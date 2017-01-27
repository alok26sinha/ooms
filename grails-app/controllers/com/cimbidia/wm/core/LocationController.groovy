

/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core

import java.text.SimpleDateFormat
import java.util.Date;

import grails.validation.ValidationException

import com.cimbidia.scm.oms.ItemLocation;


import com.cimbidia.wm.order.Order
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.TrackingMessage;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.LocationGroup;
import com.cimbidia.wm.core.LocationType;
import com.cimbidia.wm.core.User;
import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.scm.oms.*;
import com.cimbidia.wm.product.Product

class LocationController {
	
	def locationService
	def inventoryService
	/**
	 * Controllers for managing other locations (besides warehouses)
	 */
	
	def skuList 
	def index = { 
		redirect(action: "list")
	}
	
	def list = {
		println params
		
		def locations = []
		def locationsTotal = 0;
		def locationType = LocationType.get(params["locationType.id"])
		def locationGroup = LocationGroup.get(params["locationGroup.id"])
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (params.q && locationType) {
			def terms = "%" + params.q + "%"
			locations = Location.findAllByNameLikeAndLocationType(terms, locationType, params)
			locationsTotal = Location.countByNameLikeAndLocationType(terms, locationType, params);
		}
		else if (locationType) { 
			locations = Location.findAllByLocationType(locationType, params)
			locationsTotal = Location.countByLocationType(locationType, params);
		}
		else if (params.q) {
			def terms = "%" + params.q + "%"
			locations = Location.findAllByNameLike(terms, params)
			locationsTotal = Location.countByNameLike(terms, params);
		}
		else {
			locations = Location.list(params)
			locationsTotal = Location.count()
		}
		
		// Filter by location group
		if (locationGroup) { 
			locations = locations.findAll { it.locationGroup == locationGroup } 
		}
		
		[locationInstanceList: locations, locationInstanceTotal: locationsTotal]
	}
	
	def show = { 
	println "in show - params="+ params
	
		def locationInstance = locationService.getLocation(params.id)
		if (!locationInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [locationInstance: locationInstance]
		}
	}
	
	
	def edit = {
		def locationInstance = locationService.getLocation(params.id)
		if (!locationInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [locationInstance: locationInstance]
		}
	}
	
	def update = {
		def locationInstance = locationService.getLocation(params.id)
		Company company
		if (locationInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (locationInstance.version > version) {

					locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						warehouse.message(code: 'location.label', default: 'Location')] as Object[], "Another user has updated this Location while you were editing")
					render(view: "edit", model: [locationInstance: locationInstance])
					return
				}
			}

			locationInstance.properties = params
			Integer companyId = params.companyId ? params.companyId :  session.companyId
			if(companyId)
			{
				company = Company.findById(companyId)
			}
		
			locationInstance.company = company
			if (!locationInstance.hasErrors()) {
				try {
					locationService.saveLocation(locationInstance)
					if (locationInstance?.id == session?.warehouse?.id) {
						session.warehouse = locationInstance
					}
					
				} catch (ValidationException e) {
					render(view: "edit", model: [locationInstance: locationInstance])
					return
				}

				flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'location.label', default: 'Location'), locationInstance.id])}"
				redirect(action: "list", id: locationInstance.id)
			}
			else {
				render(view: "edit", model: [locationInstance: locationInstance])
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def delete = {
		def locationInstance = Location.get(params.id)
		if (locationInstance) {
			try {
				locationInstance.delete(flush: true)

				flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
				redirect(action: "edit", id: params.id)
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'location.label', default: 'Location'), params.id])}"
			redirect(action: "edit", id: params.id)
		}
	}
		
		
	/**
	 * Render location logo
	 */
	def viewLogo = {
		def warehouseInstance = Location.get(params.id);
		if (warehouseInstance) {
			if (warehouseInstance.logo) {
				response.outputStream << warehouseInstance.logo
			}
		}
	}
	   
		   
	def renderLogo = {
		def location = Location.get(params.id)
		if (location?.logo) {
			response.setContentLength(location.logo.length)
			response.outputStream.write(location.logo)
		} else {
			// Sends 404 error if no photo
			response.sendError(404)
		}
	}


	def uploadLogo = {
		def locationInstance = Location.get(params.id);

		if (request.method == "POST") {
			if (locationInstance) {
				def logo = request.getFile("logo");

				// List of OK mime-types
				def okcontents = [
					'image/png',
					'image/jpeg',
					'image/gif'
				]

				if (! okcontents.contains(logo.getContentType())) {
					log.info "Photo is not correct type"
					flash.message = "Photo must be one of: ${okcontents}"
					render(view: "uploadLogo", model: [locationInstance: locationInstance])
					return;
				}

				if (!logo?.empty && logo.size < 1024*1000) { // not empty AND less than 1MB
					locationInstance.logo = logo.bytes;
					if (!locationInstance.hasErrors()) {
						locationService.saveLocation(locationInstance)
						session.warehouse = locationInstance
						flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'warehouse.label', default: 'Location'), locationInstance.id])}"
					}
					else {
						// there were errors, the logo was not saved
						flash.message = "${warehouse.message(code: 'default.not.updated.message', args: [warehouse.message(code: 'user.label'), locationInstance.id])}"
						render(view: "uploadPhoto", model: [locationInstance: locationInstance])
						return
					}
				}
				else {
					flash.message = "${warehouse.message(code: 'user.photoTooLarge.message', args: [warehouse.message(code: 'location.label'), locationInstance.id])}"
				}

				redirect(action: "show", id: locationInstance.id)
			}
			else {
				"${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'warehouse.label', default: 'Location'), params.id])}"
			}
		}
		[locationInstance:locationInstance]
	}
	
	def deleteLogo = { 
		def location = Location.get(params.id)
		if (location) { 
			location.logo = []
			location.save(flush:true)
			flash.message = "Logo has been deleted"
		}
		redirect(action: "uploadLogo", id: params.id);
	}
	   	   
	def deleteTransaction = {
		def transaction = Transaction.get(params.id)
		transaction.delete();
		flash.message = "Transaction deleted"
		redirect(action: "show", id: params.location.id);
	}
	def deleteShipment = {
		def shipment = Shipment.get(params.id)
		shipment.delete();
		flash.message = "Shipment deleted"
		redirect(action: "show", id: params.location.id);
	}
	def deleteOrder = {
		def order = Order.get(params.id)
		order.delete();
		flash.message = "Order deleted"
		redirect(action: "show", id: params.location.id);
	}
	def deleteRequest = {
		/*def requestInstance = Requisition.get(params.id)
		requestInstance.delete();*/
		flash.message = "Request deleted"
		redirect(action: "show", id: params.location.id);
	}
	def deleteEvent = {
		def event = Event.get(params.id)
		event.delete();
		flash.message = "Event deleted"
		redirect(action: "show", id: params.location.id);
	}
	def deleteUser = {
		def user = User.get(params.id)
		user.delete();
		flash.message = "User deleted"
		redirect(action: "show", id: params.location.id);
	}                                                                 
	
	def saveAddress = {
		def locationInstance = Location.get(params.location.id)
		println "params.location.id=" + params.location.id
		println "params"+params
		if (locationInstance) {
			def address = locationInstance.address
			if ( address == null )
				address = new Address()
			
			address.properties = params
			/*if(params.stateOrProvince)
			{
				int stateId = (Integer.parseInt(params.stateOrProvince.id)).intValue()
				Constants state = Constants.get(stateId)
				address.stateOrProvince = state
			}*/
			println "1"
			locationInstance.address = address
			if ( address.hasErrors() ) {
				println "ERRORS in ADDRESS"
				 address.errors.each {
				 	 	println it
				 }
			} 
			else 
			{
				println "2"
				if( address.save(flush: true) && locationInstance.save())
				{
					println "address and location saved"
				}
				else
				{
					println "address and location not saved" +  address.errors + locationInstance.errors
				
				}
				
			}
		}	
	}

	
	def viewByDay = {
		Location location =Location.findById(params.id)
		println"location in view by day : "+location
		def trackingMsgs = TrackingMessage.findAllByLocation(location)
		println "tracking msgs : "+trackingMsgs
		render(view: "dayView",  model: [trackingMsgs: trackingMsgs,location : location])
	}
	def viewByWeek = {
		def trackingMsgs = TrackingMessage.getAll()
		render(view: "weekView", model: [trackingMsgs: trackingMsgs])
	}
	def viewByMonth = {
		def trackingMsgs = TrackingMessage.getAll()
		render(view: "monthView", model: [trackingMsgs: trackingMsgs])
	}
	def openTrackingMsgForm = {
		def locationId;
		def Date date=getDateTimeFormat(params.msgDate);
		println "date : "+date
		render(view: "trackingMsg",model : [date:date,locationId : params.id])
	}
	def updateTrackingMsgForm = {
		println "tracking msg id : "+params.id
		def trackingMsg
		render(view: "trackingMsg",model : [trackingMsg : TrackingMessage.findById(params.id)])
		
	}
	def createTrackingMsg = {
		println "params.locationId : "+params.locationId
		def location=Location.findById(params.locationId)
		def trackingMsg = new TrackingMessage()
		trackingMsg.properties = params
		if(session.companyTypeId == 10){
			println "by carrier"
			trackingMsg.carrier = session.companyInstance
		}else{
			println "by shipper"
			trackingMsg.carrier = Company.findById(params.carrier.id)
		}
		trackingMsg.msgDate = getDateTimeFormat(params.msgDate)
		trackingMsg.msgType = "Appointment"
		trackingMsg.location=location
		trackingMsg.address=Address.findById(location.address.id)
		trackingMsg.createdDate = new Date()
		trackingMsg.lastUpdated = new Date()
		trackingMsg.save(failOnError: true)
		redirect(action: "viewByDay", id: params.locationId);
		
	}
	
	def updateTrackingMsg = {
		println "params : "+params
		println "update tracking msg  : "+params.locationId
		def location=Location.findById(params.locationId)
		def trackingMsg = TrackingMessage.findById(params.trackingMsgId)
		trackingMsg.properties = params
		trackingMsg.msgDate = getDateTimeFormat(params.msgDate)
		trackingMsg.createdDate = trackingMsg.createdDate
		trackingMsg.msgType = "Appointment"
		trackingMsg.lastUpdated=new Date()
		trackingMsg.save(failOnError: true)
		redirect(action: "viewByDay", id: location.id);
	}
	
	def cancelTrackingMsg = {
		def location=Location.findById(params.locationId)
		def trackingMsg = TrackingMessage.findById(params.trackingMsgId)
		flash.message = "Appointment  cancel"
		trackingMsg.delete();
		redirect(action: "viewByDay", id: location.id);
	}
	def showMap = {
		//println"params id : "+params.id
		def company=Company.findById(Integer.parseInt(params.id))
		def locations=Location.findAllByCompany(company)//findByCompany(Company.findById(1))
		def date = new Date()
		def sku =  params.skuList
		
		
		def itemLocations = ItemLocation.createCriteria().list{
			projections {
				property("id", "id")
			}
			
		} 
	//	println " size "+itemLocations.size();
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		
		for(int i=1; i<10; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int x=0; x<itemLocations.size(); x++){
				oh = map.get(itemLocations.get(x))
				Inventory inv = getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
				oh=inv.net;
				map.put(itemLocations.get(x), oh)
				inventories.add(inv);
			}
		}
		
		String dailyChart =  getDailyData(inventories,date,sku)
		
		String weeklyChart =   getDailyData(inventories,date, sku)
	
		render(view: "showMaps",model : [locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList])
	}
	
	
	def showChart = {
		//println"params id : "+params.id
		def company=Company.findById(1)
		def locations=Location.findAllByCompany(company)//findByCompany(Company.findById(1))
		def date = new Date()
		def sku =  params.skuList
		
		
		def itemLocations = ItemLocation.createCriteria().list{
			projections {
				property("id", "id")
			}
			
		}
	//	println " size "+itemLocations.size();
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		
		for(int i=1; i<10; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int x=0; x<itemLocations.size(); x++){
				oh = map.get(itemLocations.get(x))
				Inventory inv = getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
				oh=inv.net;
				map.put(itemLocations.get(x), oh)
				inventories.add(inv);
			}
		}
		
		String dailyChart =  getDailyData(inventories,date,sku)
		
		String weeklyChart =   getDailyData(inventories,date, sku)
	
		render(template: "/dashboard/chart",model : [locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList])
	}
	
	
	String getDailyData(List<Inventory> inventories, Date date, String sku)
	{
		String chartdate = "[ ['Day', 'SKU','country', 'Qty', 'Avl', 'Oh', 'allocQty', 'inTransit', 'demand', 'supply', 'safety'], \n";
		skuList =  new HashSet<String>()
		for(int i=0; i<inventories.size(); i++){
		
				Inventory inv = inventories.get(i);
				def d = new Date().parse("MM/dd/yyyy", inv.dateToShowOnUI)
				String strDate  = d.getAt(Calendar.YEAR)+","+(d.getAt(Calendar.MONTH))+","+(d.getAt(Calendar.DAY_OF_MONTH))+",0";
				skuList.add(inv.itemLocation.product);
				if(sku.equals(inv.itemLocation.product)){
					chartdate = chartdate + "[new Date("+strDate+"),'"+inv.itemLocation.product+"','"+inv.itemLocation.location+"',"+inv.net+","+inv.avl+","+inv.oh+","+inv.allocQty+","+inv.inTransit+","+inv.demand+","+inv.supply+","+inv.itemLocation.safetyStock+"], \n"
				}
				else {
					chartdate = chartdate + "[new Date("+strDate+"),'"+inv.itemLocation.product+"','"+inv.itemLocation.location+"',"+inv.net+","+inv.avl+","+inv.oh+","+inv.allocQty+","+inv.inTransit+","+inv.demand+","+inv.supply+","+inv.itemLocation.safetyStock+"], \n"
				}
		}
		
		chartdate = chartdate + "]";
		
		
		return chartdate;
	}
	
	
	Inventory getSafetyStockForDateSequential(String paramDate, String itemLocation, Double oh ){
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		Date date  =  formatter.parse(paramDate)
		ItemLocation il = ItemLocation.get(itemLocation)
		
		def invTemp = inventoryService.findInventoryOH(il);
		def inventory = new Inventory();
		if(invTemp != null){
			inventory.quantity = invTemp.quantity;
			if(date-new Date()==0)
			inventory.allocQty = invTemp.allocQty;
			inventory.inTransit = invTemp.inTransit;
			
			
		}else{
			
		}
		if(oh==null){
		inventory.oh=inventory.quantity;
		}else{
		inventory.oh=oh;
		}
		inventory.dateToShowOnUI  = paramDate;
		
		def inv  = inventoryService.findInventoryInTransit(il, date);
		
		inventory.inTransit +=  inv!=null?inv.quantity:0.0;
		inventory.allocQty +=  inv!=null?inv.allocQty:0.0;
		Double supp = inventoryService.findSupply(il, date)?.quantity
		inventory.supply  += (supp==null?0.0:supp);
		
		inventory.demand  = inventoryService.findDemand(il, date)?.quantity;
		if(inventory.demand == null){
			inventory.demand = 0.0;
		}
		inventory.avl = inventory.oh - inventory.allocQty
		inventory.itemLocation = il
		try{
		inventory.net = inventory.oh + inventory.inTransit-inventory.allocQty+inventory.supply-il.safetyStock-inventory.demand;
		}catch(Exception e){}
		inventory.quantity=(inv?.quantity!=null?inv?.quantity:0.0)+(inv?.quantity!=null?inv?.quantity:0.0);
		
		inventory.itemLocation = il;
		InventoryDemand iDemand = inventoryService.findDemand(inventory.itemLocation, date);
		InventorySupply iSupply = inventoryService.findSupply(inventory.itemLocation, date);
		Double demand = (iDemand==null? 0.0: iDemand.quantity);
		Double supply = (iSupply==null? 0.0: iSupply.quantity);
		inventory.unitCost= inv?.unitCost;
		//inventory.q = inventory.quantity-inventory.allocQty- inventory.itemLocation.safetyStock- demand + supply;
		
		return inventory;
	}
	
	def getTodaysPositionForItemLoc(ItemLocation itemLocation, Date date){
	
		Inventory inventory = new Inventory();
		Inventory inv = inventoryService.findInventoryOH(itemLocation);
		Inventory objInv = inventoryService.findInventoryInTransit(itemLocation,date )
		inventory.quantity=(inv?.quantity!=null?inv?.quantity:0.0)+(objInv?.quantity!=null?objInv?.quantity:0.0);
		inventory.allocQty=(inv?.allocQty!=null?inv?.allocQty:0.0)+(objInv?.allocQty!=null?objInv?.allocQty:0.0);
		inventory.itemLocation = itemLocation;
		InventoryDemand iDemand = inventoryService.findDemand(inventory.itemLocation, date);
		InventorySupply iSupply = inventoryService.findSupply(inventory.itemLocation, date);
		Double demand = (iDemand==null? 0.0: iDemand.quantity);
		Double supply = (iSupply==null? 0.0: iSupply.quantity);
		inventory.unitCost= inv?.unitCost;
		inventory.q = inventory.quantity-inventory.allocQty- inventory.itemLocation.safetyStock- demand + supply;
		return inventory;
	}
	
	public Date getDateTimeFormat(String strDate){
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:m:s", Locale.US);
		Date parsedDate = dateFormat.parse(strDate);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:m:s");
		return sdf.parse(sdf.format(parsedDate))
	}
	
	def getYearData = {
		println("years data")
		render(template:"futureInventory")
	}
	
}
