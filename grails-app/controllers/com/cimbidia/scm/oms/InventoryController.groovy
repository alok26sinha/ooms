/**
 * Copyright (c) Cimbidia.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 **/ 
package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company

import java.text.SimpleDateFormat
import java.util.List;

import com.cimbidia.wm.core.*;
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.product.ProductGroup



class InventoryController {

	def inventoryService
	def locationService
	def productService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		/*params.max = Math.min(params.max ? params.int('max') : 10, 100)
		 [inventoryInstanceList: Inventory.list(params), inventoryInstanceTotal: Inventory.count()]*/
		Company company = params.company ? params.company :  session.company
		def location = params.location
		def item = params.product
		def date = new Date()
		String stringDate = params.date
		if(params.date !=null && params.date.length()>0){
			date = Date.parse("MM/dd/yyyy", params.date)
		}
		else{
			SimpleDateFormat formatter  =  new SimpleDateFormat("MM/dd/yyyy");
			stringDate= formatter.format(date);
		}
		def itemLocations = ItemLocation.createCriteria().list{

			and  {
				if(item!=null && item.length()>0){
					eq("product.id", item)
				}
				if(location!=null && location.length()>0){
					eq("location.id", location)
				}
			}
		}
		//date can be in past, present, future
		//if past look at the inventory_snapshot table to get that day's OH inventory, get committed inventory from CO line item table
		//if date == today then just the inventory table
		//for future -- based on calculation
		if((date-new Date())<0){//past

		}
		else if((date-new Date())>=0){//future=todaysNetOH+siq(intransit)-sig(supply)-sig(demand)-days*safetystock

			def inventories = new ArrayList<Inventory>();


			for(int i=0; i< itemLocations.size(); i++){
				Inventory inventory = getTodaysPositionForItemLoc(itemLocations.get(i))
				if(date-new Date()>0)
					updateInvPositionsForDays(inventory, (date-new Date()))

				inventory.dateToShowOnUI=stringDate
				inventories.add(inventory);

			}

			render(view: "list", model: [location:location, product:item, date:stringDate, inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size()])


		}

	}

	def updateInvPositionsForDays(Inventory inventory, int days){
		Double inTransit = 0.0
		Double demand = 0.0
		Double supply = 0.0
		Double allocQ = 0.0

		for(int x=0; x< (days); x++){
			Date date = (new Date()).plus(x+1)

			Inventory iInv = inventoryService.findInventoryInTransit(inventory.itemLocation, date);
			InventoryDemand iDemand = inventoryService.findDemand(inventory.itemLocation, date);
			InventorySupply iSupply = inventoryService.findSupply(inventory.itemLocation, date);
			inTransit += iInv==null? 0.0: iInv.quantity;
			allocQ += iInv==null? 0.0: iInv.allocQty;
			demand += (iDemand==null? 0.0: iDemand.quantity);
			supply += (iSupply==null? 0.0: iSupply.quantity);
		}

		inventory.q = inventory.q+inTransit-allocQ/*- ((days)*inventory.itemLocation.safetyStock)*/- demand + supply;

	}
	def getTodaysPositionForItemLoc(ItemLocation itemLocation){
		Date date = new Date();
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
		inventory.q = inventory.quantity-inventory.allocQty/*- inventory.itemLocation.safetyStock*/- demand + supply;
		return inventory;
	}

	def dtl = {
		def inventory = getInvForDate(params.date, params.itemLocation);

		render(view: "dtl", model: [inventoryInstance: inventory])
	}
	Inventory getInvForDate(String strDate, String itemLocation){
		SimpleDateFormat formatter =  new SimpleDateFormat("MM/dd/yyyy");
		Date date  = formatter.parse(strDate);
		Inventory inventory = new Inventory();
		inventory.itemLocation=ItemLocation.get(itemLocation);
		Inventory inv = inventoryService.findInventoryOH(inventory.itemLocation);
		Double allocQ = 0.0
		allocQ=(inv.allocQty==null?0.0:inv.allocQty)
		if((date-new Date())>0){
			inv = getTodaysPositionForItemLoc(inventory.itemLocation);
			updateInvPositionsForDays(inv, (date-new Date())-1)
			allocQ=0.0
		}


		Double inTransit = 0.0

		Double demand = 0.0
		Double supply = 0.0

		inventory = inv;
		Inventory iInv = inventoryService.findInventoryInTransit(inventory.itemLocation, date);
		InventoryDemand iDemand = inventoryService.findDemand(inventory.itemLocation,date);
		InventorySupply iSupply = inventoryService.findSupply(inventory.itemLocation, date);
		inTransit += (iInv==null? 0.0: (iInv.quantity));
		allocQ += (iInv==null? 0.0: (iInv.allocQty));
		demand += (iDemand==null? 0.0: iDemand.quantity);
		supply += (iSupply==null? 0.0: iSupply.quantity);

		inventory.oh = inv.q
		inventory.inTransit=inTransit
		inventory.allocQty=allocQ
		inventory.supply=supply
		inventory.demand=demand

		inventory.net=inventory.oh-inventory.allocQty+supply-demand+inTransit/*-inventory.itemLocation.safetyStock*/

		inventory.dateToShowOnUI=strDate
		return inventory;
	}



	def safetyStockList = {


		def location = params.location
		def product = params.product
		def itemLocations = ItemLocation.createCriteria().list{
			projections { property("id", "id") }
			and  {
				if(product!=null && product.length()>0){
					eq("product.id", product)
				}
				if(location!=null && location.length()>0){
					eq("location.id", location)
				}
			}
		}
		List<Inventory> inventories = inventoryService.getInventory(itemLocations)

		render(view: "safetyInvList", model: [location:location, product:product, inventoryInstanceList: inventories])
	}
	
	
	def aggregatedStockList = {

		def location = params.location
		def product = params.product

		def locationType = params.locationType
		def productGroup = params.productGroup
		def itemLocations = ItemLocation.createCriteria().list{

			projections { property("id", "id") }

			and  {

				if(product!=null && product.length()>0)	{
					eq ("product.id", product)
				}
				if(productGroup!=null && productGroup.length()>0){
					'in' ("product.id", productService.findProduct(productGroup))
				}
				'in' ("location.id", locationService.findLocation(location,locationType))
			}
		}
		List<Inventory> inventories = inventoryService.getInventory(itemLocations)

		def transInv = inventories.collate( itemLocations.size() ).transpose().flatten()

		render(view: "aggregatedStockList", model: [location:location, product:product, locationType:locationType, productGroup:productGroup, inventoryInstanceList: inventories ,transInv:transInv])
	//render(view: "aggregatedStockList", model: [location:location, product:product, locationType:locationType, productGroup:productGroup, inventoryInstanceList: inventories ,transInv:transInv])
	
		
	}

	def safetyStockAssociatedList = {
		//println "params "+params
		def location = params.location
		def product = params.product

		def locationType = params.locationType
		def productGroup = params.productGroup
		def itemLocations = ItemLocation.createCriteria().list{

			projections { property("id", "id") }

			and  {

				if(product!=null && product.length()>0)	{
					eq ("product.id", product)
				}
				if(productGroup!=null && productGroup.length()>0){
					'in' ("product.id", productService.findProduct(productGroup))
				}
				'in' ("location.id", locationService.findLocation(location,locationType))
			}
		}
		List<Inventory> inventories = inventoryService.getInventory(itemLocations)

		def transInv = inventories.collate(  itemLocations.size() ).transpose().flatten()

		render(view: "safetyInv", model: [location:location, product:product, locationType:locationType, productGroup:productGroup, inventoryInstanceList: inventories ,transInv:transInv])
	}
	def aggregatedValueList = {
	
		def location = params.location
		def product = params.product

		def locationType = params.locationType
		def productGroup = params.productGroup
		List<ItemLocation> itemLocations = ItemLocation.createCriteria().list{

			projections { property("id", "id") }

			and  {

				if(product!=null && product.length()>0)	{
					eq ("product.id", product)
				}
				if(productGroup!=null && productGroup.length()>0){
					'in' ("product.id", productService.findProduct(productGroup))
				}
				'in' ("location.id", locationService.findLocation(location,locationType))
			}
		}
		
		List<Inventory> inventories = inventoryService.getAggregatedInventoryByValue(itemLocations)
		
		def transInv = inventories.collate( itemLocations.size() ).transpose().flatten()

		render(view: "aggregatedValueList", model: [location:location, product:product, locationType:locationType, productGroup:productGroup, inventoryInstanceList: inventories ,transInv:transInv])
	}


	def safetyStockAssociatedCost = {
		//println "params "+params
		def location = params.location
		def product = params.product

		def locationType = params.locationType
		def productGroup = params.productGroup
		def itemLocations = ItemLocation.createCriteria().list{

			projections { property("id", "id") }

			and  {

				if(product!=null && product.length()>0)	{
					eq ("product.id", product)
				}
				if(productGroup!=null && productGroup.length()>0){
					'in' ("product.id", productService.findProduct(productGroup))
				}
				'in' ("location.id", locationService.findLocation(location,locationType))
			}
		}
		List<Inventory> inventories = inventoryService.getInventory(itemLocations)

		def transInv = inventories.collate( itemLocations.size() ).transpose().flatten()

		render(view: "safetyCost", model: [location:location, product:product, locationType:locationType, productGroup:productGroup, inventoryInstanceList: inventories ,transInv:transInv])
	}

	
	def create = {
		def inventoryInstance = new Inventory()
		inventoryInstance.properties = params
		return [inventoryInstance: inventoryInstance]
	}

	def save = {
		def inventoryInstance = new Inventory(params)
		Company company = params.company ? params.company :  session.company
		inventoryInstance.company = company
		inventoryInstance.createdBy = session.user
		if (inventoryInstance.save(flush: true)) {
			flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), inventoryInstance.id])}"
			redirect(action: "list", id: inventoryInstance.id)
		}
		else {
			render(view: "create", model: [inventoryInstance: inventoryInstance])
		}
	}

	def show = {
		def inventoryInstance = Inventory.get(params.id)
		if (!inventoryInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
			redirect(action: "list")
		}
		else {
			[inventoryInstance: inventoryInstance]
		}
	}

	def edit = {
		def inventoryInstance = Inventory.get(params.id)
		if (!inventoryInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
			redirect(action: "list")
		}
		else {
			render(view: "edit", model: [inventoryInstance: inventoryInstance])
		}
	}

	def update = {
		def inventoryInstance = Inventory.get(params.id)
		if (inventoryInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (inventoryInstance.version > version) {

					inventoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						warehouse.message(code: 'inventory.label', default: 'Inventory')] as Object[], "Another user has updated this Inventory while you were editing")
					render(view: "edit", model: [inventoryInstance: inventoryInstance])
					return
				}
			}
			inventoryInstance.properties = params
			if (!inventoryInstance.hasErrors() && inventoryInstance.save(flush: true)) {
				flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), inventoryInstance.id])}"
				redirect(action: "list", id: inventoryInstance.id)
			}
			else {
				render(view: "edit", model: [inventoryInstance: inventoryInstance])
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def inventoryInstance = Inventory.get(params.id)
		if (inventoryInstance) {
			try {
				inventoryInstance.delete(flush: true)
				flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
				redirect(action: "list")
			}
			catch (Exception e) {
				flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
				redirect(action: "list", id: params.id)
			}

		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventory.label', default: 'Inventory'), params.id])}"
			redirect(action: "list")
		}
	}
}
