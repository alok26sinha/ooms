/**
 * Copyright (c) Cimbidia.  All rights reserved.
 * The use and distribution terms for this software are covered by the
 * Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
 * which can be found in the file epl-v10.html at the root of this distribution.
 * By using this software in any fashion, you are agreeing to be bound by
 * the terms of this license.
 * You must not remove this notice, or any other, from this software.
 **/ 
package com.cimbidia.wm.shipment

import grails.validation.ValidationException
import groovy.sql.Sql

import java.sql.Timestamp
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

import com.cimbidia.wm.core.*
import com.cimbidia.wm.core.rg.*
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.receiving.ReceiptItem;
import com.cimbidia.scm.admin.Company
// import java.io.Serializable;
// import java.sql.ResultSet;
// import java.text.SimpleDateFormat;

import com.cimbidia.scm.constants.Constants;
import com.cimbidia.scm.shipment.ShipmentAccessorial
import com.cimbidia.wm.shipment.ItemListCommand;
import com.cimbidia.wm.shipment.ShipmentItemException;
import com.cimbidia.wm.shipment.ShipmentStatusCode;
import com.cimbidia.wm.shipment.CarrierStatusCode;
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Document;
import com.cimbidia.wm.core.Equipment;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.EventType;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Mot;
import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.shipment.Container;
import com.cimbidia.wm.shipment.ReferenceNumber;
import com.cimbidia.wm.shipment.Shipment;
import com.cimbidia.wm.shipment.ShipmentItem;
import com.cimbidia.wm.shipment.ShipmentMethod;
import com.cimbidia.wm.shipment.ShipmentType;
import com.cimbidia.wm.shipment.ShipperService;

import au.com.bytecode.opencsv.CSVWriter
//import com.ocpsoft.pretty.time.PrettyTime;





import com.cimbidia.wm.shipment.TOFilter
import com.cimbidia.wm.shipment.TransportationOrder
import com.cimbidia.wm.order.Order

class ShipmentController {

	def scaffold = Shipment
	def shipmentService
	def userService
	def reportService;
	def inventoryService;
	def mailService
	def transportationOrderService
	def dataSource
	def sessionFactory
	def routingGuideService


	def redirect = {
		redirect(controller: "shipment", action: "showDetails", id: params.id)
	}

	def show = {

		redirect(action: "showDetails", params : [ 'id':params.id ])
	}

	def list = {
		def startTime = System.currentTimeMillis()
		println "Get shipments: " + params
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		Calendar calendar = Calendar.instance
		int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH)
		int firstDayOfMonth = calendar.getActualMinimum(Calendar.DAY_OF_MONTH)
		int lastDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), firstDayOfMonth)
		def lastUpdatedFromDefault = calendar.getTime()
		def lastUpdatedToDefault = calendar.getTime()

		boolean incoming = params?.type?.toUpperCase() == "INCOMING"
		def origin = params.origin ? Location.get(params.origin) : null
		def destination = incoming ? Location.get(session.warehouse.id) : (params.destination ? Location.get(params.destination) : null)
		def shipmentType = params.shipmentType ? ShipmentType.get(params.shipmentType) : null
		def statusCode = params.status ? Enum.valueOf(ShipmentStatusCode.class, params.status) : null
		def statusStartDate = params.statusStartDate ? Date.parse("MM/dd/yyyy", params.statusStartDate) : null
		def statusEndDate = params.statusEndDate ? Date.parse("MM/dd/yyyy", params.statusEndDate) : null
		def lastUpdatedFrom = params.lastUpdatedFrom ? Date.parse("MM/dd/yyyy", params.lastUpdatedFrom) : null
		def lastUpdatedTo = params.lastUpdatedTo ? Date.parse("MM/dd/yyyy", params.lastUpdatedTo) : null
		def user = User.get(session?.user?.id)
		def carrier = params.carrier ?params.carrier:user?.shipper
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		
		

		println "lastUpdatedFrom = " + lastUpdatedFrom + " lastUpdatedTo = " + lastUpdatedTo
		println "carrier = " + carrier
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		def shipments = shipmentService.getShipments(companyId,params.terms, shipmentType, origin, destination,
				statusCode, statusStartDate, statusEndDate, lastUpdatedFrom, lastUpdatedTo, carrier,, orderBy, colName)
		def totalsize = shipments?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(shipments?.size() > 10)
			shipments = shipments.subList(lowerIndex, highIndex);
		// sort by event status, event date, and expecting shipping date
		shipments = shipments.sort( { a, b ->
			return b.lastUpdated <=> a.lastUpdated
		} )

		def mode=Mot.findById(1);
		println "List shipments: " + (System.currentTimeMillis() - startTime) + " ms"

		[
			shipments:shipments,
			shipmentType:shipmentType?.id,
			//origin:origin?.id,
			//destination:destination?.id,
			status:statusCode?.name,
			lastUpdatedFrom:lastUpdatedFrom,
			lastUpdatedTo:lastUpdatedTo,
			incoming: incoming,
			mot:mode,
			shipmentTotal:totalsize
		]
	}


	def create = {

		def shipmentInstance = new Shipment()
		shipmentInstance.properties = params

		if (params.type == "incoming") {
			shipmentInstance.destination = session.warehouse;
		}
		else if (params.type == "outgoing") {
			shipmentInstance.origin = session.warehouse;
		}
		//return [shipmentInstance: shipmentInstance]
		render(view: "create", model: [ shipmentInstance : shipmentInstance,
			warehouses : Location.list(), eventTypes : EventType.list()]);
	}

	def save = {
		def shipmentInstance = new Shipment(params)

		//if (shipmentInstance.save(flush: true)) {
		shipmentInstance.pickupStart=getDateTimeFormat(params.pickupStart)
		shipmentInstance.pickupEnd=getDateTimeFormat(params.pickupEnd)
		shipmentInstance.deliveryStart=getDateTimeFormat(params.deliveryStart)
		shipmentInstance.deliveryEnd=getDateTimeFormat(params.deliveryEnd)
		if(shipmentService.saveShipment(shipmentInstance)){
			// Try to add the initial event
			def eventType = EventType.get(params.eventType?.id);
			if (eventType) {
				def shipmentEvent = new Event(eventType: eventType, eventLocation: session.warehouse, eventDate: new Date())
				shipmentInstance.addToEvents(shipmentEvent).save(flush:true);
			}
			flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), shipmentInstance.id])}"
			redirect(action: "showDetails", id: shipmentInstance.id)
		}
		else {
			//redirect(action: "create", model: [shipmentInstance: shipmentInstance], params: [type:params.type])
			render(view: "create", model: [shipmentInstance : shipmentInstance,
				warehouses : Location.list(), eventTypes : EventType.list()]);
		}
	}

	def update={
		println "update"
		
		
		def shipmentInstance = Shipment.get(params.id)
		println "params.pickupStart : "+params.pickupStart
		println "update"
		
		//println "Date.parse :  "+Date.parse("h:mm a", params.pickupStart)
		if (shipmentInstance) {


			if (params.version) {
				def version = params.version.toLong()
				if (shipmentInstance.version > version) {
					shipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						warehouse.message(code: 'shipment.label', default: 'Shipment')] as Object[], "Another user has updated this Shipment while you were editing")
					render(view: "edit", model: [shipmentInstance: shipmentInstance])
					return
				}
			}
			
			// Bind request parameters
			shipmentInstance.properties = params
			shipmentInstance.pickupStart=getDateTimeFormat(params.pickupStart)
			shipmentInstance.pickupEnd=getDateTimeFormat(params.pickupEnd)
			shipmentInstance.deliveryStart=getDateTimeFormat(params.deliveryStart)
			shipmentInstance.deliveryEnd=getDateTimeFormat(params.deliveryEnd)
			shipmentInstance.timeOfArrival=getDateTimeFormat(params.timeOfArrival)
			shipmentInstance.timeOfDeparture=getDateTimeFormat(params.timeOfDeparture)
			if (!shipmentInstance.hasErrors() && shipmentInstance.save(flush: true)) {
				flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), shipmentInstance.id])}"
				//redirect(action: "show", id: shipmentInstance.id)

				render(view: "edit", model: [shipmentInstance: shipmentInstance])
			}
			else {
				render(view: "edit", model: [shipmentInstance: shipmentInstance])
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"
			redirect(action: "list")
		}
	}

	def update1 = {

		log.info params
		println("params"+params)
		def shipmentInstance = Shipment.get(params.id)
		if (shipmentInstance) {


			if (params.version) {
				def version = params.version.toLong()
				if (shipmentInstance.version > version) {
					shipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						warehouse.message(code: 'shipment.label', default: 'Shipment')] as Object[], "Another user has updated this Shipment while you were editing")
					render(view: "edit", model: [shipmentInstance: shipmentInstance])
					return
				}
			}

			// Bind request parameters
			shipmentInstance.properties = params

			// -- Processing shipment method  -------------------------
			log.info "autocomplete shipment method: " + params

			// -- Processing destination  -------------------------
			// Reset the destination to null
			if (!params.safeDestination?.name) {
				shipmentInstance.destination = null;
			}
			// Assign a destination if one was selected
			else if (params.safeDestination.id && params.safeDestination?.name) {
				def destination = Location.get(params.safeDestination.id);
				if (destination && params.safeDestination.name == destination?.name) // if it exists
					shipmentInstance.destination = destination;
			}

			// -- Processing carrier  -------------------------
			// This is necessary because Grails seems to be binding things incorrectly.  If we just let
			// Grails do the binding by itself, it tries to change the ID of the 'carrier' that is already
			// associated with the shipment, rather than changing the 'carrier' object associated with
			// the shipment.

			// Reset the carrier
			if (!params.safeCarrier?.name) {
				shipmentInstance.carrier = null;
			}
			// else if the person is found and different from the current one, then we use that person
			else if (params.safeCarrier.id && params.safeCarrier?.name) {
				def safeCarrier = Person.get(params.safeCarrier.id);
				if (safeCarrier && safeCarrier?.name != shipmentInstance?.carrier?.name)
					shipmentInstance.carrier = safeCarrier;
			}
			// else if only the name is provided, we need to create a new person
			else {
				def safeCarrier = convertStringToPerson(params.safeCarrier?.name);
				if (safeCarrier) {
					safeCarrier.save(flush:true)
					shipmentInstance.carrier = safeCarrier;
				}
			}

			if (!shipmentInstance.hasErrors() && shipmentInstance.save(flush: true)) {
				flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), shipmentInstance.id])}"
				//redirect(action: "show", id: shipmentInstance.id)

				render(view: "edit", model: [shipmentInstance: shipmentInstance])
			}
			else {
				render(view: "edit", model: [shipmentInstance: shipmentInstance])
			}
		}
		else {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"
			redirect(action: "list")
		}
	}



	def showDetails = {
		println "Tender Shipment"
		println "params : "+params
		println "shipment id : "+params.id
		def shipmentInstance = Shipment.get(params.id)
		if (!shipmentInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"
			redirect(action: "list", params:[type: params.type])
		}
		else {
			/*def eventTypes =  com.cimbidia.wm.core.EventType.list();
			 def shipmentWorkflow = shipmentService.getShipmentWorkflow(shipmentInstance)
			 [shipmentInstance: shipmentInstance, shipmentWorkflow: shipmentWorkflow, shippingEventTypes : eventTypes]
			 */
			render(view: "edit", model: [shipmentInstance: shipmentInstance])
		}
	}

	
	def resetResourceSelectionShipment = {
		println "Tender Shipment"
		println "params : "+params
		println "shipment id : "+params.id
		
	}
	
	def editDetails = {

		log.info params
		def shipmentInstance = Shipment.get(params.id)
		if (!shipmentInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"
			redirect(action: "list", params:[type: params.type])
		}
		else {
			[shipmentInstance: shipmentInstance]
		}
	}
	def edit = {

		log.info params
		def shipmentInstance = Shipment.get(params.id)
		if (!shipmentInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"

			redirect(action: "list", params:[type: params.type])
		}
		else {
			[shipmentInstance: shipmentInstance]
		}
	}

	def acceptShipment = {
		//println "params"+  params
		def shipmentInstance = Shipment.get(params.id)
		println "shipmentInst=" + shipmentInstance.carrierStatusCode + ":" + shipmentInstance.id
		shipmentInstance?.carrierStatusCode = CarrierStatusCode.ACCEPTED
		if (shipmentInstance?.save(flush: true)) {
			println "shipment saved with accepted status" + shipmentInstance.carrierStatusCode
			redirect(action: "list", params:[type: params.type])
		}
		else{println "shipment not saved"}

	}



	def carrierShiplist = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		def shipmentInstance = Shipment.get(params.id)
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		def carrierShipments=shipmentService.getCarrierShipments(companyId, orderBy, colName)
		def totalsize = carrierShipments?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(carrierShipments?.size() >10)
			carrierShipments = carrierShipments.subList(lowerIndex, highIndex);
			
		render(view: "carrierShipList", model: [carrierShipments: carrierShipments, carrierShipmentsTotal:totalsize])

	}

	def tenderedShipment = {
		def String[] ids=params.id.split(",")
		for (i in ids) {
			def shipmentInstance = Shipment.get(i)
			shipmentService.tenderedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.addCarrierShipment(shipmentInstance)
		}
		
		redirect(action: "list")
	}

	def acceptedShipment = {
		def String[] ids=params.id.split(",")
		for (i in ids) {
			def shipmentInstance = Shipment.get(i)
			shipmentService.acceptedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.acceptCarrierShipment(shipmentInstance)
		}
		redirect(action: "list")
	}
	def acceptedCarrierShipment = {
		def String[] ids=params.id.split(",")
		for (i in ids) {
			def carrierShipmentInstance = CarrierShipment.get(i)
			def shipmentInstance = Shipment.get(carrierShipmentInstance.shipment.id)
			shipmentService.acceptedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.acceptCarrierShipmentByCarrier(carrierShipmentInstance)
		}
		redirect(action: "carrierShiplist")
	}
	def rejectedShipment = {
		def String[] ids=params.id.split(",")
		for (i in ids) {
			def shipmentInstance = Shipment.get(i)
			shipmentService.rejectedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.rejectCarrierShipment(shipmentInstance)
			shipmentService.resetResourceSelection(shipmentInstance, true)
		}
		redirect(action: "list")
	}
	def rejectedCarrierShipment = {
		def String[] ids=params.id.split(",")
		for (i in ids) {
			def carrierShipmentInstance = CarrierShipment.get(i)
			def shipmentInstance = Shipment.get(carrierShipmentInstance.shipment.id)
			shipmentService.rejectedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.rejectCarrierShipmentByCarrier(carrierShipmentInstance,shipmentInstance)
		}
		redirect(action: "carrierShiplist")
	}

	def transportationOrdersList = {
		println "Transportation order list ";
		
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		def company=Company.findById(companyId)
		def transportationOrders=TransportationOrder.findAllByCompanyId(company, [sort: colName, order: orderBy]);
		
		
		def totalsize = transportationOrders?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(transportationOrders?.size() > 10)
			transportationOrders = transportationOrders.subList(lowerIndex, highIndex);
		render(view: "../transportationOrder/list", model: [transportationOrders: transportationOrders,transportationOrderTotal:totalsize])
	}
	
	def filterTOList = {
		println"&&session.companyId : "+session.companyId //+ cimbidiascm.ShipmentFilter.findAll()
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		
		def company=Company.findById(companyId)
		
		//def toFilters=transportationOrderService.getToFilter(company);
		def toFilters=TOFilter.findAllByCompanyId(company);
		def totalsize = toFilters?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(toFilters?.size() > 10)
			toFilters = toFilters.subList(lowerIndex, highIndex);
		println "filter list : "+toFilters+" : "+toFilters.size()
		
		render(view: "../transportationOrder/filterList", model: [toFilters: toFilters, toFiltersTotal:toFilters.size()])
	}
	def saveToFilterData = {
		println "params : "+params
		def filterName=params.filterName
		def status=params.status
		def origin=params.originFilter
		def destination=params.destinationFilter
		println "location : "+origin+" : "+destination
		def isPublic = params.isPublic
		def dashboard = params.dashboard
	
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		
		def company=Company.findById(companyId)
		def user = User.get(session?.user?.id)
		def userId=user.id
		println "User : "+userId
		def TOFilter=new TOFilter()
		TOFilter.filterName=filterName
		TOFilter.toStatus=status
		TOFilter.origin=Location.findById(origin)
		TOFilter.destination=Location.findById(destination)
		if(isPublic.equals("Yes")){
			TOFilter.isPublic=1
		}else{
		TOFilter.isPublic=0
		}
		if(dashboard.equals("Yes")){
			TOFilter.showOnDashboard=1
		}else{
		TOFilter.showOnDashboard=0
		}
		
		TOFilter.companyId=company
		TOFilter.userId=userId
		TOFilter.save(failOnError: true)
		redirect(action: "filterTOList")
	}
	def createTrackingMsg = {
		println "changed create tracking msg"
		println "changed shipmentId : "+params.shipmentId
		def shipmentInstance = Shipment.get(params.shipmentId)
		
		def trackingMsg=new TrackingMessage()
		
		trackingMsg.properties = params
		trackingMsg.shipment = shipmentInstance
		trackingMsg.msgDate	 = getDateTimeFormat(params.msgDate)
		shipmentService.createTrackingMsg( trackingMsg,  shipmentInstance)
		redirect(action: "list")
	}
	def createCarrierTrackingMsg = {
		def carrierShipmentInstance = CarrierShipment.get(params.shipmentId)
		def shipmentInstance = Shipment.findByShipmentNumber(carrierShipmentInstance.shipmentNumber)
		def trackingMsg=new TrackingMessage()
		
		trackingMsg.properties = params
		trackingMsg.shipment = carrierShipmentInstance.shipment
		
		trackingMsg.carrier = carrierShipmentInstance.carrierCompany
		trackingMsg.createdDate = new Date()
		ShipmentStops stop = ShipmentStops.findByShipmentAndStopNumber(shipmentInstance,trackingMsg.getStopNumber())
		stop.shipment = shipmentInstance
		if(trackingMsg.msgType.equals("Arrival")){
			stop.actualArrival = trackingMsg.msgDate
		}else if( trackingMsg.msgType.equals("Departure")){
			stop.actualDeparture = trackingMsg.msgDate
		}
		trackingMsg.save(failOnError: true)
		if(shipmentInstance.shipStatus.equals("Accepted")){
		if(trackingMsg.stopNumber == 1){
			shipmentInstance.shipStatus ="InTransit"
			carrierShipmentInstance.shipStatus ="InTransit"		
			}}
		
		if(trackingMsg.stopNumber == 2){
			shipmentInstance.shipStatus ="Delivered"
			carrierShipmentInstance.shipStatus ="Delivered"
			}
		redirect(action: "carrierShiplist")
	}
	
	def intransitShipment = {
		def intransitShipmentList=shipmentService.getShipmentsByTransitStatus("inTransit")
		render(view: "list", model: [shipments: intransitShipmentList])
	}
	
	def applyToFilter = {
		
		println "apply filter : "+params.id
		redirect(action: "toListByApplyFilter",id: params.id)
	
	}
	def toListByApplyFilter = {
		def id=params.id
		println "apply id for filter : "+id
		def toFilter=TOFilter.findById(id)
		println "filter : "+toFilter.origin?.id+" : "+toFilter.destination?.id+" : "+toFilter.toStatus
		def origin = toFilter.origin
		def destination = toFilter.destination
		def toStatus=toFilter.toStatus
		def shipmentNumber=null
		def toNumber=null
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		println " ############ : "+toNumber+" : "+shipmentNumber+" : "+origin+" : "+destination+" : "+toStatus
		def transportationOrders = transportationOrderService.getTransportationOrders(companyId,null,null,origin,destination,toStatus)
		render(view: "../transportationOrder/list", model: [
			transportationOrders:transportationOrders,
			origin:origin?.id,
			destination:destination?.id,
			toStatus:toStatus
		])
	}
	
	
	def toListByFilter = {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		def origin = Location.get(params.origin)
		def destination = Location.get(params.destination)
		def toNumber=params.toNumber 
		def shipmentNumber=params.shipmentNumber?.toUpperCase()
		def toStatus=params.toStatus
		def mode=params.mode
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		println " ############ : "+toNumber+" : "+shipmentNumber+" : "+origin+" : "+destination+" : "+toStatus
		def transportationOrders = transportationOrderService.getTransportationOrders(companyId,toNumber,shipmentNumber,origin,destination,toStatus,, orderBy, colName)
		def totalsize = transportationOrders?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(transportationOrders?.size() >10)
			transportationOrders = transportationOrders.subList(lowerIndex, highIndex);
		
		render(view: "../transportationOrder/list", model: [
			transportationOrders:transportationOrders,
			toNumber:toNumber,
			shipmentNumber:shipmentNumber,
			origin:origin?.id,
			destination:destination?.id,
			toStatus:toStatus,
			mode:mode,
			transportationOrderTotal:totalsize
		])
		
	
	}
	def shipListByFilter = {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		def origin = Location.get(params.origin)
		def destination = Location.get(params.shipDestination)
		//def toNumber=params.toNumber 
		def shipmentNumber=params.shipmentNumber
		def toStatus=params.shipStatus
		def mode=Mot.findById(params.mot?params.mot: null);
		println "mode : "+mode
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		def shipments = shipmentService.getShipmentsByFilter(companyId,shipmentNumber,origin,destination,toStatus,mode, orderBy, colName)
		def totalsize = shipments?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(shipments?.size() > 10)
			shipments = shipments.subList(lowerIndex, highIndex);
		
		render(view: "list", model: [
			shipments:shipments,
			shipmentNumber:shipmentNumber,
			origin:origin?.id,
			shipDestination:destination?.id,
			shipStatus:toStatus,
			mot:mode,
			shipmentTotal:totalsize
		])
		
	
	}
	
	def carrierShipListByFilter = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		
		def shipper=params.shipperCompanyId
		println "shipper : "+shipper
		def shipperCompany=Company.findByCompanyName(shipper)
		def origin = Location.get(params.origin)
		def destination = Location.get(params.shipDestination)
		//def shipperCompanyId = Company.findById(params.shipperCompanyId)
		def shipmentNumber=params.shipmentNumber
		def toStatus=params.shipStatus
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		def carrierShipments = shipmentService.getCarrierShipmentsByFilter(companyId,shipmentNumber,origin,destination,toStatus,shipperCompany, orderBy, colName)
		def totalsize = carrierShipments?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(carrierShipments?.size() > 10)
			carrierShipments = carrierShipments.subList(lowerIndex, highIndex);
		
		
		render(view: "carrierShiplist", model: [
			carrierShipments:carrierShipments,
			shipmentNumber:shipmentNumber,
			origin:origin?.id,
			shipDestination:destination?.id,
			shipper:shipper,
			shipStatus:toStatus,
			carrierShipmentsTotal:totalsize
		])
		
	
	}
	
	def deleteToFilter = {
		println "delete filter : "+params.id
		def ids=params.id.split(",")
		for(int i=0;i<ids.size();i++){
			def toFilter=TOFilter.findById(ids[i])
			toFilter.delete()
		}
		redirect(action: "filterTOList")
	}
	
	def planShipmentByFilter = {
		def toFilter=TOFilter.findById(params.id)
		def origin = toFilter.origin
		def destination = toFilter.destination
		def toStatus=toFilter.toStatus
		def shipment=toFilter.shipment
		def tos = TransportationOrder.withCriteria {
				and {
						if(origin)eq('origin',origin)
						if(destination)eq('destination',destination)
						isNull('shipment')
						if(toStatus)eq('toStatus',toStatus)
					}
				order("origin", "asc")
				order("destination", "asc")
				order("weight", "desc")
				order("volume", "desc")
				order("quantity", "desc")
				order("dimWeight", "desc")
				
		}
		println "tos : "+tos
		for(int i=0;i<tos.size();i++){
			println "@@@@@@@@@@ : "+tos[i].origin+" : "+tos[i].shipment
		}
		shipmentService.planShipmentByTOFilter(tos)
		def transportationOrders=TransportationOrder.getAll()
		def toNumber = null
		def shipmentNumber = shipment?.shipmentNumber
		render(view: "../transportationOrder/list", model: [
			transportationOrders:transportationOrders,
			toNumber:toNumber,
			shipmentNumber:shipmentNumber,
			origin:origin?.id,
			destination:destination?.id,
			toStatus:toStatus
		])

	}
	
	def resetResourceSelection = {
		def shipment = Shipment.findById(params.id)
		shipmentService.resetResourceSelection(shipment, false)
//		shipmentService.deleteShipmentCarrier(shipment)
//		def list=shipmentService.getMatchingRoutesList(shipment,5) 
//		def shipmentCarrier=shipmentService.assignShipment(shipment)
//		def rsdetail = RsDetail.findByParentId(shipment.companyId)
//		if(rsdetail !=null && rsdetail.autoTender){
//			redirect(action: "tenderedAssignShipment",id: shipment.id+"@"+shipmentCarrier.id)
//		}
		//render(view: "edit", model: [shipmentInstance: shipment])
		redirect(action: "showDetails",id: shipment.id)
	}
	
	def assignToShipment = {
		def shipmentCarrier = ShipmentCarrier.findById(params.id)
		shipmentCarrier.status="ASSIGNED"
		def shipment = Shipment.findById(shipmentCarrier.shipment.id)
		//shipmentService.unAssignedShipment(shipmentCarrier,shipment)
		shipment.carrierCompany = shipmentCarrier.carrier
		shipment.carrierPrice = shipmentCarrier.totalCost
//		if(true){
//			redirect(action: "tenderedAssignShipment",id: shipment.id+"@"+shipmentCarrier.id)
//		}
		render(view: "edit", model: [shipmentInstance: shipment,assignedId:shipmentCarrier.id])
	}
	def tenderedAssignShipment = {
		
			def idAry=params.id.split("@")
			def shipmentInstance = Shipment.findById(idAry[0])
			shipmentService.tenderedShipmentStatus(shipmentInstance)
			shipmentService.addToTrackingMsg(shipmentInstance)
			shipmentService.addCarrierShipment(shipmentInstance)
			render(view: "edit", model: [shipmentInstance: shipmentInstance,assignedId:idAry[1]])
	}
	
	def loadShipAccessorials = {
		def ratingLaneCarrierId=params.ratingLaneCarrierId
		def totalcost=params.totalcost
		def shipCarrierId=params.shipCarrierId
		println "ship carrier id : "+shipCarrierId
		def oldCost=RatingLaneCarrier.findById(ratingLaneCarrierId).rate
		def shipmentAccessorialInstanceList = shipmentService.getAccessorialsForShipment(params.shipmentId,ratingLaneCarrierId)
		/*for(int i=0;i<shipmentAccessorialInstanceList.size;i++){
			def shipmentAccessorials=new ShipmentAccessorial()
			
		}*/
		render(template: 'shipmentAccessorials', model: [shipmentAccessorialInstanceList: shipmentAccessorialInstanceList,ratingLaneCarrierId:ratingLaneCarrierId,totalcost:totalcost,shipCarrierId:shipCarrierId,oldCost:oldCost])
		}
	
	public Date getDateTimeFormat(String strDate){
		DateFormat readFormat = new SimpleDateFormat( "MM/dd/yyyy HH:mm");
		Date date = null;
		try {

			date = readFormat.parse( strDate )
		}catch(Exception e ){
			e.printStackTrace();
		}
		return date
	}
	
	def noAssignCarrierList = {
		def startTime = System.currentTimeMillis()
		println "Get shipments: " + params
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		Calendar calendar = Calendar.instance
		int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH)
		int firstDayOfMonth = calendar.getActualMinimum(Calendar.DAY_OF_MONTH)
		int lastDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH)
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), firstDayOfMonth)
		def lastUpdatedFromDefault = calendar.getTime()
		def lastUpdatedToDefault = calendar.getTime()
		
		Date now  = new Date();
		boolean incoming = params?.type?.toUpperCase() == "INCOMING"
		
		
		
		def statusStartDate =  now;
		def statusEndDate =  now+16;
	
		def user = User.get(session?.user?.id)
		def carrier = user?.shipper
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		
		

		
		
	
		def shipments = shipmentService.getShipmentsWithNoAssignCarrier( statusStartDate, statusEndDate, orderBy, colName)
		
		def totalsize = shipments?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(shipments?.size() > 10)
			shipments = shipments.subList(lowerIndex, highIndex);
		// sort by event status, event date, and expecting shipping date
		shipments = shipments.sort( { a, b ->
			return b.lastUpdated <=> a.lastUpdated
		} )

		def mode=Mot.findById(1);
		println "List shipments: " + (System.currentTimeMillis() - startTime) + " ms"

		render(view: "list", model: [shipments: shipments,shipmentTotal:totalsize])

	}

}




