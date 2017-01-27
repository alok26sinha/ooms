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

import grails.gorm.DetachedCriteria
import grails.validation.ValidationException

import com.cimbidia.scm.rs.RsDetail;
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.*
import com.cimbidia.wm.inventory.*
import com.cimbidia.wm.order.Order
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.receiving.ReceiptItem
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.EventType;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.core.rg.*
import com.cimbidia.wm.shipment.Container;
import com.cimbidia.wm.shipment.ItemCommand;
import com.cimbidia.wm.shipment.ItemListCommand;
import com.cimbidia.wm.shipment.ReceiptException;
import com.cimbidia.wm.shipment.Shipment;
import com.cimbidia.wm.shipment.ShipmentException;
import com.cimbidia.wm.shipment.ShipmentItem;
import com.cimbidia.wm.shipment.ShipmentItemException;
import com.cimbidia.wm.shipment.ShipmentStatusCode;
import com.cimbidia.wm.shipment.ShipmentType;
import com.cimbidia.wm.shipment.ShipmentWorkflow;
import com.cimbidia.wm.shipment.TrackingMessage
import com.cimbidia.wm.shipment.CarrierShipment
import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.scm.shipment.ShipmentAccessorial
import com.cimbidia.wm.util.DomainObjectClone;

import groovy.time.TimeCategory

import java.text.SimpleDateFormat
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.TimeUnit
class ShipmentService {

    boolean transactional = true

    def mailService;
	def sessionFactory;
	def productService
	
	def identifierService
	def routingGuideService
	
	/**
	 * Returns the shipment referenced by the passed id parameter;
	 * if id is null, returns a new Shipment object
	 * 
	 * @param shipmentId
	 * @return
	 */
	Shipment getShipmentInstance(String shipmentId) {
		return getShipmentInstance(shipmentId, null)
	}
	
	/**
	 * Returns the shipment referenced by the passed id parameter;
	 * if id is null, returns a new Shipment object of the specified
	 * shipment type
	 * 
	 * @param shipmentId
	 * @param shipmentType
	 * @return
	 */
	Shipment getShipmentInstance(String shipmentId, String shipmentType) {
		if (shipmentId) {
			Shipment shipment = Shipment.get(shipmentId)
			if (!shipment) {
				throw new Exception("No shipment found with shipmentId " + shipmentId)
			}
			else {
				return shipment
			}
		}
		else {
			Shipment shipment = new Shipment()
			
			if (shipmentType) {
				ShipmentType shipmentTypeObject = ShipmentType.findByNameIlike(shipmentType)
				if (!shipmentTypeObject) {
					throw new Exception(shipmentType + " is not a valid shipment type")
				}
				else {
					shipment.shipmentType = shipmentTypeObject
				}
			}		
			return shipment
		}
	}
	
	
	/**
	 * @param sort
	 * @param order
	 * @return	all shipments sorted by the given sort column and ordering
	 */
	List<Shipment> getAllShipments(String sort, String order) {
		return Shipment.list(['sort':sort, 'order':order])
	}
	
	
	/**
	 * @return all shipments 
	 */
	List<Shipment> getAllShipments() {
		return Shipment.list()
	}

	
	/**
	 * 	
	 * @return
	 */
	Object getProductMap() { 
		
		def criteria = ShipmentItem.createCriteria();		
		def quantityMap = criteria.list {
			projections {
				sum('quantity')
			}
			groupProperty "product"
		}
		return quantityMap
		
	}
	
	
	/**
	 * 
	 * @param locationId
	 * @return
	 */
	List<Shipment> getRecentOutgoingShipments(String locationId, int daysBefore, int daysAfter) { 		
		Location location = Location.get(locationId);
		//def upcomingShipments = Shipment.findAllByOriginAndExpectedShippingDateBetween(location, new Date()-30, new Date()+30, 
		//	[max:5, offset:2, sort:"expectedShippingDate", order:"desc"]);
		
		def criteria = Shipment.createCriteria()
		def now = new Date()
		def upcomingShipments = criteria.list {
			and { 
				eq("origin", location)
				or {
					//between("expectedShippingDate",null,null)
					between("expectedShippingDate",now-daysBefore,now+daysAfter)
					isNull("expectedShippingDate")
				}
			}
		}
		
		def shipments = new ArrayList<Shipment>();		
		for (shipment in upcomingShipments) { 
			shipments.add(shipment);
		}
						
		
		
		return shipments;
	}
	
	/**
	 * 
	 * @param locationId
	 * @return
	 */
	List<Shipment> getRecentIncomingShipments(String locationId, int daysBefore, int daysAfter) { 		
		def startTime = System.currentTimeMillis()
		Location location = Location.get(locationId);
		Date fromDate = new Date() - daysBefore
		Date toDate = new Date() + daysAfter
		//return Shipment.findAllByDestinationAndExpectedShippingDateBetween(location, new Date()-30, new Date()+30, 
		def shipments = Shipment.findAllByDestinationAndExpectedShippingDateBetween(location, fromDate, toDate, 
			[max:10, offset:2, sort:"expectedShippingDate", order:"desc"]);
		
		println " * Recent incoming shipments " + (System.currentTimeMillis() - startTime) + " ms"
		return shipments
	}
	

	/**
	 * 	
	 * @param shipments
	 * @return
	 */
	Map<EventType, ListCommand> getShipmentsByStatus(List shipments) { 
		def startTime = System.currentTimeMillis()
		def shipmentMap = new TreeMap<ShipmentStatusCode, ListCommand>();
		
		ShipmentStatusCode.list().each { 
			shipmentMap[it] = [];
		}
		shipments.each {
			
			def key = it.getStatus().code;			 
			def shipmentList = shipmentMap[key];
			if (!shipmentList) {
				shipmentList = new ListCommand(category: key, objectList: new ArrayList());
			}
			shipmentList.objectList.add(it);
			shipmentMap.put(key, shipmentList)
		}	
		
		println " * Get shipments by status " + (System.currentTimeMillis() - startTime) + " ms"
		
		return shipmentMap;
	}
	
	/**
	 * 
	 * @return
	 */
	List<Shipment> getShipments() { 		
		
		return getAllShipments()
		
		
	}
	

	
	
	/**
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getShipmentsByLocation(Location location) {
		return Shipment.withCriteria { 
			or {	
				eq("destination", location)
				eq("origin", location)
			}
		}
	}    
	
	
	/**
	 * 
	 * @param name
	 * @return
	 */
	List<Shipment> getShipmentsByName(String name) {
		return Shipment.withCriteria { 
			ilike("name", "%" +name + "%")
		}
	}
	
	/**
	 * 
	 * @param name
	 * @param location
	 * @return
	 */
	List<Shipment> getShipmentsByNameAndDestination(String name, Location location) {
		return Shipment.withCriteria {
			and { 
				ilike("name", "%" +name + "%")
				eq("destination", location)
			}
		}
	}

	
	/**
	 * 
	 * @param name
	 * @param location
	 * @return
	 */
	List<Shipment> getShipmentsByNameAndOrigin(String name, Location location) {
		return Shipment.withCriteria {
			and {
				ilike("name", "%" +name + "%")
				eq("origin", location)
			}
		}
	}

	
	/**
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getPendingShipments(Location location) { 
		def shipments = Shipment.withCriteria {
			eq("origin", location)
		}
		
		return shipments.findAll { !it.hasShipped() }
	}
	
	/**
	 * 
	 * @param location
	 * @param product
	 * @return
	 */
	List<ShipmentItem> getPendingShipmentItemsWithProduct(Location location, Product product) {
		def shipmentItems = []
		def shipments = getPendingShipments(location);
        shipments.addAll(getIncomingShipments(location));
		
		shipments.each { 
			def shipmentItemList = it.shipmentItems.findAll { it.product == product }
			shipmentItemList.each { 
				shipmentItems << it;
			}
		}
	
		return shipmentItems;		
	}
	
	/**
	 * Get all shipments that are shipping to the given location.
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getIncomingShipments(Location location) {
		return Shipment.withCriteria { eq("destination", location) }.findAll { it.isPending() }		
	}
	
	
	/**
	 * Get all shipments that are shipping from the given location.
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getOutgoingShipments(Location location) {
		return Shipment.withCriteria { eq("origin", location) }.findAll { it.isPending() } 		
	}

	
	/**
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getShipmentsByDestination(Location location) {
		def startTime = System.currentTimeMillis()
		def shipments = Shipment.withCriteria { 
			eq("destination", location) 
		}
		println " * Get shipments by origin " + (System.currentTimeMillis() - startTime) + " ms"
		return shipments
	}
	
	/**
	 * 
	 * @param location
	 * @return
	 */
	List<Shipment> getShipmentsByOrigin(Location location) {
		def startTime = System.currentTimeMillis()
		def shipments = Shipment.withCriteria { 
			eq("origin", location);
		}
		println " * Get shipments by origin " + (System.currentTimeMillis() - startTime) + " ms"
		
		return shipments
	}
	
	
	/**
	 * 
	 * @param shipmentType
	 * @param origin
	 * @param destination
	 * @param statusCode
	 * @param statusStartDate
	 * @param statusEndDate
	 * @return
	 */
	List<Shipment> getShipments(Integer companyId,String terms, ShipmentType shipmentType, Location origin, Location destination, ShipmentStatusCode statusCode, Date statusStartDate, Date statusEndDate, Date lastUpdatedStart, Date lastUpdatedEnd, Shipper carrier,String orderBy,String colName) {

        println "Get shipments: " + terms + " " + shipmentType + " " + origin + " " + destination + " " + lastUpdatedStart + " " + lastUpdatedEnd
		
		
		def companyInstance = Company.findById(companyId)
		
		
		
        def shipments = Shipment.withCriteria {
			eq("companyId", companyInstance)
            and {
                if (terms) {
                    or {
                        ilike("name", "%" + terms + "%")
                        ilike("shipmentNumber", "%" + terms + "%")
                    }
                }
                if (shipmentType) { eq("shipmentType", shipmentType) }
               
                if (lastUpdatedStart) { ge("lastUpdated", lastUpdatedStart)}
                if (lastUpdatedEnd) { le("lastUpdated", lastUpdatedEnd)}

            }
			if( colName) {order(colName, orderBy)}

        }

        println "Shipments: " + shipments.size()
		
		if(carrier)
		{
			shipments = shipments.findAll(
										{ def shipper = it.shipmentMethod?.shipper
									 	  if(shipper == carrier)
									 	  { return true }
									 	  return false} )
		}
		
		return shipments
	}
	
	
	List<Shipment> getShipmentsWithNoAssignCarrier(Date lastUpdatedStart, Date lastUpdatedEnd, String orderBy,String colName) {
						
			//	println "Date range "+lastUpdatedEnd+"  "+lastUpdatedEnd
				def shipments = Shipment.withCriteria {
					
						isNull("carrierCompany")
						/*and{
							if (lastUpdatedStart != null) { ge("lastUpdated", lastUpdatedStart)}
							if (lastUpdatedEnd != null) { le("lastUpdated", lastUpdatedEnd)}
						}*/
					
					if( colName) {order(colName, orderBy)}
		
				}
		
				println "Shipments: " + shipments.size()
				
				
				
				return shipments
			}
	
	/**
	 * Saves a shipment
	 * 
	 * @param shipment
	 */
	void saveShipment(Shipment shipment) {
		if (!shipment.shipmentNumber) { 
			shipment.shipmentNumber = identifierService.generateShipmentIdentifier()
		}
		shipment.save(flush:true, failOnError:true)
	}
	
	/**
	 * Saves a container
	 * 
	 * @param container
	 */
	void saveContainer(Container container) {	
		if (!container.recipient) { 			
			container.recipient = (container?.parentContainer?.recipient)?:container.shipment.recipient;
		}
		container.save()
	}
	
	
	/**
	 * Validate the shipment item 	
	 * 
	 * @param shipmentItem
	 * @return
	 */
	boolean validateShipmentItem(ShipmentItem shipmentItem) { 
		def location = Location.get(shipmentItem?.shipment?.origin?.id);
		log.info("Validating shipment item at " + location?.name + " for product " + shipmentItem.product + " and lot number " + shipmentItem.lotNumber)
		def onHandQuantity = inventoryService.getQuantity(location, shipmentItem.product, shipmentItem.lotNumber)
		log.info("Checking shipment item quantity [" + shipmentItem.quantity + "] vs onhand quantity [" + onHandQuantity + "]");
		if (!shipmentItem.validate()) { 
			throw new ShipmentItemException(message: "shipmentItem.invalid", shipmentItem: shipmentItem)
		}
		
		if (shipmentItem.quantity > onHandQuantity) { 
			throw new ShipmentItemException(message: "shipmentItem.quantity.cannotExceedOnHandQuantity", shipmentItem: shipmentItem)
		}
		return true;
	}
	
	
	
	public void tenderedShipmentStatus(Shipment shipmentInstance){
		shipmentInstance.setShipStatus("Tendered")
	}
	public void acceptedShipmentStatus(Shipment shipmentInstance){
		shipmentInstance.setShipStatus("Accepted")
	}
	public void rejectedShipmentStatus(Shipment shipmentInstance){
		shipmentInstance.setShipStatus("Rejected")
	}

	public void addToTrackingMsg(Shipment shipmentInstance){
		def trackingMsg = new TrackingMessage()
		trackingMsg.comments = ""
		trackingMsg.shipment = shipmentInstance
		trackingMsg.carrier = shipmentInstance.carrierCompany
		trackingMsg.setMsgType(shipmentInstance.getShipStatus())
		trackingMsg.createdDate = new Date()
		shipmentInstance.addToTrackingMsgs(trackingMsg)
		shipmentInstance.save(failOnError: true)
	}
	
	public void addCarrierShipment(Shipment shipmentInstance){
		def carrierShipment = new CarrierShipment()
		carrierShipment.shipmentNumber = shipmentInstance.shipmentNumber
		carrierShipment.shipment	= shipmentInstance
		carrierShipment.shipStatus	   = "Tendered"
		carrierShipment.shipperCompanyId	=	shipmentInstance.companyId
		carrierShipment.shipment = shipmentInstance
		carrierShipment.companyId	=	shipmentInstance.carrierCompany
		carrierShipment.carrierCompany = shipmentInstance.carrierCompany
		carrierShipment.origin = shipmentInstance.origin
		carrierShipment.shipDestination = shipmentInstance.shipDestination
		carrierShipment.origin = shipmentInstance.origin
		carrierShipment.pickupStart	= shipmentInstance.pickupStart
		carrierShipment.deliveryStart = shipmentInstance.deliveryStart
		carrierShipment.save(failOnError: true)
		
	}
	public void acceptCarrierShipment(Shipment shipmentInstance){
		def carrierShipment = findByIdCarrier(shipmentInstance);
		carrierShipment.shipStatus = "Accepted"
	}
	public void acceptCarrierShipmentByCarrier(CarrierShipment carrierShipmentInstance){
		carrierShipmentInstance.shipStatus = "Accepted"
	}
	public void rejectCarrierShipment(Shipment shipmentInstance){
		def carrierShipment = findByIdCarrier(shipmentInstance);
		carrierShipment.shipStatus = "Rejected"//"Open"
		shipmentInstance.carrierCompany	= null
		shipmentInstance.shipStatus = "Open"
	}
	public void rejectCarrierShipmentByCarrier(CarrierShipment carrierShipmentinstance,Shipment shipmentInstance){
		carrierShipmentinstance.shipStatus = "Rejected"
		shipmentInstance.carrierCompany	= null
		shipmentInstance.shipStatus = "Open"
	}
	
	public CarrierShipment findByIdCarrier(Shipment shipmentInstance){
		return CarrierShipment.withCriteria {
			and {
				eq("shipment",shipmentInstance)
				eq("carrierCompany", shipmentInstance.carrierCompany)
			}
		}.get(0)
	}
	public TrackingMessage trackByIdCarrier(Shipment shipmentInstance){
		return TrackingMessage.withCriteria {
			and {
				eq("shipment",shipmentInstance)
				eq("carrier", shipmentInstance.carrierCompany)
			}
		}.get(0)
	}
	
	public List<CarrierShipment> getCarrierShipments(Integer companyId, String orderBy, String colName ){
		
				def companyInstance = Company.findById(companyId)
				
				def carrierShipments = CarrierShipment.withCriteria {
					
					eq("companyId", companyInstance)
					if( colName) {order(colName, orderBy)}
				}
		
				return carrierShipments
			
	}
	
	public void createShipmentFromTO(TransportationOrder transportationOrder){
		//TODO need to be any equipment, will do that
		
 
		//TO check again
		if (( (transportationOrder.weight < (Mot.MIN_PERC * Mot.MAX_EQP_WT)) && (transportationOrder.dimWeight > Mot.MAX_PCL_WT))
		||((transportationOrder.volume < (Mot.MIN_PERC * Mot.MAX_EQP_VOL)) )
		||((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
		)
		{
			transportationOrder.save(failOnError: true)
		}else{
			if (transportationOrder.dimWeight !=null && transportationOrder.dimWeight >0 && transportationOrder.dimWeight <= Mot.MAX_PCL_WT){
				transportationOrder.mot = Mot.findById(Mot.AIR)
			}
			
//			def routingGuideSearch = new RoutingGuide();
//			routingGuideSearch.origin = transportationOrder.origin
//			routingGuideSearch.destination = transportationOrder.destination
//			routingGuideSearch.mot = transportationOrder.mot
//			routingGuideSearch.companyId = transportationOrder.companyId
//			def List<RoutingGuide> rglist=routingGuideService.getRoutingGuideList(routingGuideSearch)
//			println "rg size : "+rglist.size()
			//create shipment
			def shipment = new Shipment();
			shipment.dimWeight = transportationOrder.dimWeight
			shipment.weight = transportationOrder.weight
			shipment.volume = transportationOrder.volume
			shipment.quantity = transportationOrder.quantity
			//shipment.weightUnits = transportationOrder.weightUnits
			
	 
			shipment.shipStatus="Planned"
			shipment.shipmentNumber="SH_" + identifierService.generateIdentifier('NNNLLL')
			shipment.origin = transportationOrder.origin
			shipment.shipDestination = transportationOrder.destination
			//shipment.origin.id = transportationOrder.origin.id
			//shipment.shipDestination.id = transportationOrder.destination.id
			//shipment.uom = transportationOrder.uom
			shipment.pc = transportationOrder.productClass
			shipment.businessUnit = transportationOrder.bu
			shipment.companyId = transportationOrder.companyId
			//shipment.incoterm = transportationOrder.incoterm
			shipment.mot = transportationOrder.mot
			shipment.transResp = transportationOrder.transResp
			println " transportationOrder.fromAddress  : "+transportationOrder.origin.address
			if (transportationOrder.fromAddress !=null)
				shipment.fromAddress = transportationOrder.fromAddress
			else{
				shipment.fromAddress = transportationOrder.origin.address
			}
			shipment.fromAddress = transportationOrder.fromAddress
			shipment.toAddress = transportationOrder.toAddress
			shipment.pickupStart = transportationOrder.pickupStart
			shipment.pickupEnd = transportationOrder.pickupEnd
			shipment.deliveryStart = transportationOrder.deliveryStart
			shipment.deliveryEnd = transportationOrder.deliveryEnd
			shipment.carrierCompany = transportationOrder.carrier
			//shipment.get
			transportationOrder.toStatus = com.cimbidia.scm.constants.Constants.TO_STATUS_PLANNED
			shipment.addToTransportationOrders(transportationOrder)
			
			println "create tracking message" + shipment.pickupStart + "***" + shipment.origin + "***" + shipment.pickupEnd
			def trackingMsg1 = new TrackingMessage()
			trackingMsg1.location = shipment.origin
			trackingMsg1.msgDate = findAvailableSlot(shipment.pickupStart, shipment.origin,shipment.pickupEnd)//shipment.pickupStart
			//getNextFreeSlot(trackingMsg1.msgDate, trackingMsg1.location)
			trackingMsg1.comments = ""
			trackingMsg1.stopNumber = 1
			trackingMsg1.shipment = shipment
			trackingMsg1.carrier = shipment.carrierCompany
			trackingMsg1.msgType = "Appointment"
			trackingMsg1.createdDate = new Date()
			if (trackingMsg1.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg1)
			else
				println "Appointment for slot 1 not found."
			String timeDistance=getTimeDistance(shipment?.origin,shipment?.shipDestination);
			println "time distance : "+timeDistance
			String[] str=timeDistance.split("@")
			String time=str[0].replace("hours", ":").replace("mins", "").trim()
			float distance=Float.parseFloat(str[1].trim().replace("km","").replace(",",""))
			println "time & distance : "+time +"="+distance
			shipment.time = time
			shipment.distance = distance
			if (trackingMsg1.msgDate ==null)
				shipment.timeOfArrival = shipment.pickupStart
			else{
				Date apptDate=getExpectedTimeOfArrival(trackingMsg1.msgDate,shipment.time)
				println "apointment date : "+apptDate
				shipment.timeOfArrival = apptDate
			}
			def trackingMsg2 = new TrackingMessage()
			trackingMsg2.comments = ""
			trackingMsg2.stopNumber = 2
			trackingMsg2.shipment = shipment
			trackingMsg2.location = shipment.shipDestination
			trackingMsg2.msgDate =findAvailableSlot(shipment.timeOfArrival, shipment.shipDestination,shipment.deliveryEnd)//
			
			trackingMsg2.carrier = shipment.carrierCompany
			trackingMsg2.msgType = "Appointment"
			trackingMsg2.createdDate = new Date()
			if (trackingMsg2.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg2)
			else
				println "Appointment for slot 2 not found."

			def stop1 = new ShipmentStops();
			stop1.estdArrival=  transportationOrder.pickupStart
			stop1.estdDeparture=  transportationOrder.pickupEnd
			stop1.plannedArrival=  transportationOrder.pickupStart
			stop1.plannedDeparture=  transportationOrder.pickupEnd
			stop1.stopAction="Pickup"
			stop1.stopNumber	= 1
			stop1.apptDate	=  trackingMsg1.msgDate
			shipment.timeOfDeparture = stop1.apptDate
			if (transportationOrder.fromAddress !=null)
			stop1.address = transportationOrder.fromAddress
			else{
				def fromLocation=Location.findById(transportationOrder.origin.id)
				stop1.address = fromLocation.address
			}
			shipment.addToShipmentStops(stop1)
	 
			def stop2 = new ShipmentStops();
			stop2.estdArrival=  transportationOrder.deliveryStart
			stop2.estdDeparture=  transportationOrder.deliveryEnd
			stop2.plannedArrival=  transportationOrder.deliveryStart
			stop2.plannedDeparture=  transportationOrder.deliveryEnd
			stop2.stopAction="Deliver"
			stop2.stopNumber	= 2
			stop2.apptDate	= trackingMsg2.msgDate
			if (transportationOrder.toAddress !=null)
			stop2.address = transportationOrder.toAddress
			else{
				def toLocation=Location.findById(transportationOrder.destination.id)
				stop2.address = toLocation.address
			}
			shipment.addToShipmentStops(stop2)
			
			shipment.save(failOnError: true)
			println "shipment id : "+shipment.id
			resetResourceSelection(shipment, false)
		}
	}

	public void createShipmentFromTOForOcean(TransportationOrder transportationOrder){
		//TODO need to be any equipment, will do that
		
 
		//TO check again
		if (( (transportationOrder.weight < (Mot.MIN_PERC *44000)) )
		||((transportationOrder.volume < (Mot.MIN_PERC *2377)) )
		||((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
		)
		{
			transportationOrder.save(failOnError: true)
		}else{
			
			//create shipment
			def shipment = new Shipment();
			shipment.weight = transportationOrder.weight
			shipment.volume = transportationOrder.volume
			shipment.quantity = transportationOrder.quantity
			//shipment.weightUnits = transportationOrder.weightUnits
			
	 
			shipment.shipStatus="Planned"
			shipment.shipmentNumber="SH_" + identifierService.generateIdentifier('NNNLLL')
			shipment.origin = transportationOrder.origin
			shipment.shipDestination = transportationOrder.destination
			//shipment.origin.id = transportationOrder.origin.id
			//shipment.shipDestination.id = transportationOrder.destination.id
			//shipment.uom = transportationOrder.uom
			shipment.pc = transportationOrder.productClass
			shipment.businessUnit = transportationOrder.bu
			shipment.companyId = transportationOrder.companyId
			//shipment.incoterm = transportationOrder.incoterm
			shipment.mot = transportationOrder.mot
			shipment.transResp = transportationOrder.transResp
			println " transportationOrder.fromAddress  : "+transportationOrder.origin.address
			if (transportationOrder.fromAddress !=null)
				shipment.fromAddress = transportationOrder.fromAddress
			else{
				shipment.fromAddress = transportationOrder.origin.address
			}
			shipment.fromAddress = transportationOrder.fromAddress
			shipment.toAddress = transportationOrder.toAddress
			shipment.pickupStart = transportationOrder.pickupStart
			shipment.pickupEnd = transportationOrder.pickupEnd
			shipment.deliveryStart = transportationOrder.deliveryStart
			shipment.deliveryEnd = transportationOrder.deliveryEnd
			shipment.carrierCompany = transportationOrder.carrier
			//shipment.get
			transportationOrder.toStatus = com.cimbidia.scm.constants.Constants.TO_STATUS_PLANNED
			shipment.addToTransportationOrders(transportationOrder)
			

			def stop1 = new ShipmentStops();
			stop1.estdArrival=  transportationOrder.pickupStart
			stop1.estdDeparture=  transportationOrder.pickupEnd
			stop1.plannedArrival=  transportationOrder.pickupStart
			stop1.plannedDeparture=  transportationOrder.pickupEnd
			stop1.stopAction="Pickup"
			stop1.stopNumber	= 1
			if (transportationOrder.fromAddress !=null)
			stop1.address = transportationOrder.fromAddress
			else{
				def fromLocation=Location.findById(transportationOrder.origin.id)
				stop1.address = fromLocation.address
			}
			shipment.addToShipmentStops(stop1)
	 
			def stop2 = new ShipmentStops();
			stop2.estdArrival=  transportationOrder.deliveryStart
			stop2.estdDeparture=  transportationOrder.deliveryEnd
			stop2.plannedArrival=  transportationOrder.deliveryStart
			stop2.plannedDeparture=  transportationOrder.deliveryEnd
			stop2.stopAction="Deliver"
			stop2.stopNumber	= 2
			if (transportationOrder.toAddress !=null)
			stop2.address = transportationOrder.toAddress
			else{
				def toLocation=Location.findById(transportationOrder.origin.id)
				stop2.address = toLocation.address
			}
			shipment.addToShipmentStops(stop2)
			
			shipment.save(failOnError: true)
			println "shipment id : "+shipment.id
		}
	}

		
	public Date getExpectedTimeOfArrival(Date date,String time){
		println "date : "+date
		String[] strTime=time.split(":")
		Integer totalTime=Integer.parseInt(strTime[0].trim())*60+Integer.parseInt(strTime[1].trim())
		println "total time : "+totalTime
		Date expectedTA
		use( TimeCategory ) {
			expectedTA=date + totalTime.minutes
		}
		println "expectedTA : "+expectedTA
		
		return expectedTA
	}

	public String getTimeDistance(Location origin,Location destination){
		
		String key= "AIzaSyBIyktu-T4V5zEWuAbhCh45V4__1OQfb58"
		try {
		StringBuffer sb = new StringBuffer("https://maps.googleapis.com/maps/api/distancematrix/xml");
		String o=(origin?.address?.address+","+origin?.address?.city+","+origin?.address?.country).trim()
		String d=(destination?.address?.address+","+destination?.address?.city+","+destination?.address?.country).trim()
		
		String origin1 = 'Denver';
		String destinationA = 'Dallas';
	    sb.append("?origins=").append(origin1);
		sb.append("&destinations=").append(destinationA);
		sb.append("&mode=").append("driving");
		sb.append("&sensor=").append("false");
	    sb.append("&key=").append(URLEncoder.encode(key));
		print "sb : "+sb
	    URL path = new URL(sb.toString());
		println "path : "+path
		HttpURLConnection httpConn = (HttpURLConnection) path.openConnection();
		httpConn.setDoInput(true);
		int code = httpConn.getResponseCode();
		println"code : "+code
		String durationStr
		String distanceStr
		if (code == 200) {
			BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
			String line = br.readLines();
			println"line : "+line
			durationStr=line.substring(line.indexOf("<duration>"), line.indexOf("</duration>"))
			distanceStr=line.substring(line.indexOf("<distance>"), line.indexOf("</distance>"))
			println "duration : "+durationStr.substring(durationStr.indexOf("<text>")+6,durationStr.indexOf("</text>"))
			println "distance : "+distanceStr.substring(distanceStr.indexOf("<text>")+8,distanceStr.indexOf("</text>"))
			
			return durationStr.substring(durationStr.indexOf("<text>")+6,durationStr.indexOf("</text>"))+"@"+distanceStr.substring(distanceStr.indexOf("<text>")+6,distanceStr.indexOf("</text>"))
		}
		 
		}
		catch (Exception ex) {
			println "ex######################:-"+ex
			ex.printStackTrace();
			throw ex;
		}
	
		
		
	}
	
	
	
	public Date findAvailableSlot(Date msgDate,Location location,Date endDate){
		println "msgDate : "+msgDate
		boolean avl = false;
		try{
		
//		println "msgDate.getHours() : "+msgDate.getHours()
	//	println "msgDate.getMinutes() : "+msgDate.getMinutes()
		println "location :L "+location
		println "location minTime : "+location.minTime
		println "location maxTime : "+location.maxTime
		// "location.minTime : "+location.minTime.split(":")[0]+"==="+location.minTime.split(":")[1]
		
		int minHr = Integer.parseInt(location.minTime.split(":")[0])
		int minMinute = Integer.parseInt(location.minTime.split(":")[1])
		int maxHr = Integer.parseInt(location.maxTime.split(":")[0])
		int maxMinute = Integer.parseInt(location.maxTime.split(":")[1])

		
		Calendar calendar = Calendar.getInstance();
		
		println "endDate : "+endDate
			while(!avl && msgDate <=endDate){
				
			
			while (!avl &&
				 calendar.get(Calendar.HOUR_OF_DAY) <= maxHr && calendar.get(Calendar.MINUTE) <=maxMinute){
				if ( calendar.get(Calendar.HOUR_OF_DAY) >= minHr && calendar.get(Calendar.MINUTE) >=minMinute){
					
	
				}else{
					//set the time of msgDate=minTime
					msgDate.setHours(minHr)
					msgDate.setMinutes(minMinute)
					calendar.setTime(msgDate)
				}
				avl =  TrackingMessage.withCriteria {
					eq("msgDate", msgDate)
					eq("location",location)
				}.isEmpty()
				if (!avl){
				use( TimeCategory ) {
					msgDate=msgDate + 30.minutes
					calendar.setTime(msgDate)
				}
				}
			}//end of inner while
				 println("msgDate after inner while=" + msgDate)
				 if (!avl){
			msgDate = msgDate.next();
			if(calendar.get(Calendar.DAY_OF_WEEK)==7){
				msgDate=msgDate.next().next()
			}else if(calendar.get(Calendar.DAY_OF_WEEK)==0){
				msgDate=msgDate.next()
			}
			msgDate.setHours(minHr)
			msgDate.setMinutes(minMinute)
			println("msgDate after inner while if=" + msgDate)
			calendar.setTime(msgDate)
				 }
		}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if (!avl){
			msgDate=null;
		}
		return msgDate;
	}
	

	public void createShipmentFromTOForCustomer(TransportationOrder transportationOrder){
		//TODO need to be any equipment, will do that
		println "create shipment from to for co"
 
		//TO check again
		/*if (( (transportationOrder.weight < (Mot.MIN_PERC * Mot.MAX_EQP_WT)) && (transportationOrder.dimWeight > Mot.MAX_PCL_WT))
		||((transportationOrder.volume < (Mot.MIN_PERC * Mot.MAX_EQP_VOL)) )
		||((transportationOrder.quantity < (Mot.MIN_PERC * Mot.MAX_EQP_QTY)) )
		)
		{*/
			println "create to"
			transportationOrder.save(failOnError: true)
		//}else{
			println "create shipment"
			if (transportationOrder.dimWeight <= Mot.MAX_PCL_WT){
				transportationOrder.mot = Mot.findById(Mot.AIR)
			}
			
			def routingGuideSearch = new RoutingGuide();
			routingGuideSearch.origin = transportationOrder.origin
			routingGuideSearch.destination = transportationOrder.destination
			routingGuideSearch.mot = transportationOrder.mot
			routingGuideSearch.companyId = transportationOrder.companyId
			//def List<RoutingGuide> rglist=routingGuideService.getRoutingGuideList(routingGuideSearch)
			//println "rg size : "+rglist.size()
			//create shipment
			def shipment = new Shipment();
			shipment.dimWeight = transportationOrder.dimWeight
			shipment.weight = transportationOrder.weight
			shipment.volume = transportationOrder.volume
			shipment.quantity = transportationOrder.quantity
			//shipment.weightUnits = transportationOrder.weightUnits
			
	 
			shipment.shipStatus="Open"
			shipment.shipmentNumber="SH_" + identifierService.generateIdentifier('NNNLLL')
			shipment.origin = transportationOrder.origin
			shipment.shipDestination = transportationOrder.destination
			//shipment.origin.id = transportationOrder.origin.id
			//shipment.shipDestination.id = transportationOrder.destination.id
			//shipment.uom = transportationOrder.uom
			shipment.pc = transportationOrder.productClass
			shipment.businessUnit = transportationOrder.bu
			shipment.companyId = transportationOrder.companyId
			//shipment.incoterm = transportationOrder.incoterm
			shipment.mot = transportationOrder.mot
			shipment.transResp = transportationOrder.transResp
			shipment.fromAddress = transportationOrder.fromAddress
			shipment.toAddress = transportationOrder.toAddress
			shipment.pickupStart = transportationOrder.pickupStart
			shipment.pickupEnd = transportationOrder.pickupEnd
			shipment.deliveryStart = transportationOrder.deliveryStart
			shipment.deliveryEnd = transportationOrder.deliveryEnd
			shipment.carrierCompany = transportationOrder.carrier
			
			shipment.addToTransportationOrders(transportationOrder)
			
			println "create tracking message" + shipment.pickupStart + "***" + shipment.origin + "***" + shipment.pickupEnd
			def trackingMsg1 = new TrackingMessage()
			trackingMsg1.location = shipment.origin
			//trackingMsg1.msgDate = findAvailableSlot(shipment.pickupStart, shipment.origin,shipment.pickupEnd)//shipment.pickupStart
			//getNextFreeSlot(trackingMsg1.msgDate, trackingMsg1.location)
			trackingMsg1.comments = ""
			trackingMsg1.stopNumber = 1
			trackingMsg1.shipment = shipment
			trackingMsg1.carrier = shipment.carrierCompany
			trackingMsg1.msgType = "Appointment"
			trackingMsg1.createdDate = new Date()
			if (trackingMsg1.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg1)
			else
				println "Appointment for slot 1 not found."
			String timeDistance=getTimeDistance(shipment?.origin,shipment?.shipDestination);
			println "time distance : "+timeDistance
			String[] str=timeDistance.split("@")
			String time=str[0].replace("hours", ":").replace("mins", "").trim()
			float distance=Float.parseFloat(str[1].trim().replace("km","").replace(",",""))
			println "time & distance : "+time +"="+distance
			shipment.time = time
			shipment.distance = distance
			if (trackingMsg1.msgDate ==null)
				shipment.timeOfArrival = shipment.pickupStart
			else{
				Date apptDate=getExpectedTimeOfArrival(trackingMsg1.msgDate,shipment.time)
				println "apointment date : "+apptDate
				shipment.timeOfArrival = apptDate
			}
			def trackingMsg2 = new TrackingMessage()
			trackingMsg2.comments = ""
			trackingMsg2.stopNumber = 2
			trackingMsg2.shipment = shipment
			trackingMsg2.location = shipment.shipDestination
			//trackingMsg2.msgDate =findAvailableSlot(shipment.timeOfArrival, shipment.shipDestination,shipment.deliveryEnd)//
			
			trackingMsg2.carrier = shipment.carrierCompany
			trackingMsg2.msgType = "Appointment"
			trackingMsg2.createdDate = new Date()
			if (trackingMsg2.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg2)
			else
				println "Appointment for slot 2 not found."

			def stop1 = new ShipmentStops();
			stop1.estdArrival=  transportationOrder.pickupStart
			stop1.estdDeparture=  transportationOrder.pickupEnd
			stop1.stopAction="Pickup"
			stop1.stopNumber	= 1
			stop1.apptDate	=  trackingMsg1.msgDate
			shipment.timeOfDeparture = stop1.apptDate
			stop1.address = transportationOrder.fromAddress
			shipment.addToShipmentStops(stop1)
	 
			def stop2 = new ShipmentStops();
			stop2.estdArrival=  transportationOrder.deliveryStart
			stop2.estdDeparture=  transportationOrder.deliveryEnd
			stop2.stopAction="Deliver"
			stop2.stopNumber	= 2
			stop2.apptDate	= trackingMsg2.msgDate
			stop2.address = transportationOrder.toAddress
			shipment.addToShipmentStops(stop2)
			
			shipment.save(failOnError: true)
			println "shipment id : "+shipment.id
			resetResourceSelection(shipment, false)
		//}
	}
	
	public List<Shipment> getShipmentsByTransitStatus(String status){
		return Shipment.withCriteria {
					eq("shipStatus",status)
		}
	}
	
	
	public List<Shipment> getShipmentsByFilter(companyId,shipmentNumber,origin,destination,shipStatus,mode, String orderBy,String colName){
		def companyInstance = Company.findById(companyId)
		
		def shipments = Shipment.withCriteria {
			and {
				
				if(shipmentNumber) { like("shipmentNumber","%"+shipmentNumber+"%")}
				if (shipStatus) { eq("shipStatus", shipStatus) }
				if (origin) { eq("origin", origin) }
				if (destination) { eq("shipDestination", destination) }
				if (mode) { eq("mot", mode) }
				}
			if( colName) {order(colName, orderBy)}
		}
		return shipments
	}
	public planShipmentByTOFilter(List<TransportationOrder> transportationOrderList){
		//TODO need to be any equipment, will do that
		//have a for loop here
		
		Location origin
		
		Location destination
		def shipment;
		for(int i=0;i<transportationOrderList.size();i++){
			
		
		//TO check again
			def transportationOrder=transportationOrderList[i]
			println "origin == transportationOrder.origin : "+origin+" : "+(origin == transportationOrder.origin)
				println "destination == transportationOrder.destination : "+destination+" : "+(destination == transportationOrder.destination)
			if (origin == transportationOrder.origin && destination == transportationOrder.destination ){
				//shipment = new Shipment();
				//shipment.dimWeight += transportationOrder.dimWeight
				shipment.weight += transportationOrder.weight
				shipment.volume += transportationOrder.volume
				shipment.quantity += transportationOrder.quantity
	
			}else{
				shipment = new Shipment();
			shipment.dimWeight = transportationOrder.dimWeight
			shipment.weight = transportationOrder.weight
			shipment.volume = transportationOrder.volume
			shipment.quantity = transportationOrder.quantity
			shipment.shipStatus="Open"
			shipment.shipmentNumber="SH_" + identifierService.generateIdentifier('NNNLLL')
			shipment.origin = transportationOrder.origin
			shipment.shipDestination = transportationOrder.destination

			shipment.pc = transportationOrder.productClass
			shipment.businessUnit = transportationOrder.bu
			shipment.companyId = transportationOrder.companyId
			shipment.mot = transportationOrder.mot
			shipment.transResp = transportationOrder.transResp
			shipment.fromAddress = transportationOrder.fromAddress
			shipment.toAddress = transportationOrder.toAddress
			shipment.pickupStart = transportationOrder.pickupStart
			shipment.pickupEnd = transportationOrder.pickupEnd
			shipment.deliveryStart = transportationOrder.deliveryStart
			shipment.deliveryEnd = transportationOrder.deliveryEnd
			shipment.carrierCompany = transportationOrder.carrier
			def trackingMsg1 = new TrackingMessage()
			trackingMsg1.location = shipment.origin
			trackingMsg1.msgDate = findAvailableSlot(shipment.pickupStart, shipment.origin,shipment.pickupEnd)//shipment.pickupStart
			//getNextFreeSlot(trackingMsg1.msgDate, trackingMsg1.location)
			trackingMsg1.comments = ""
			trackingMsg1.stopNumber = 1
			trackingMsg1.shipment = shipment
			trackingMsg1.carrier = shipment.carrierCompany
			trackingMsg1.msgType = "Appointment"
			trackingMsg1.createdDate = new Date()
			if (trackingMsg1.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg1)
			else
				println "Appointment for slot 1 not found."
			String timeDistance=getTimeDistance(shipment?.origin,shipment?.shipDestination);
			println "time distance : "+timeDistance
			String[] str=timeDistance.split("@")
			String time=str[0].replace("hours", ":").replace("mins", "").trim()
			float distance=Float.parseFloat(str[1].trim().replace("km","").replace(",",""))
			println "time & distance : "+time +"="+distance
			shipment.time = time
			shipment.distance = distance
			if (trackingMsg1.msgDate ==null)
				shipment.timeOfArrival = shipment.pickupStart
			else{
				Date apptDate=getExpectedTimeOfArrival(trackingMsg1.msgDate,shipment.time)
				println "apointment date : "+apptDate
				shipment.timeOfArrival = apptDate
			}
			def trackingMsg2 = new TrackingMessage()
			trackingMsg2.comments = ""
			trackingMsg2.stopNumber = 2
			trackingMsg2.shipment = shipment
			trackingMsg2.location = shipment.shipDestination
			trackingMsg2.msgDate =findAvailableSlot(shipment.timeOfArrival, shipment.shipDestination,shipment.deliveryEnd)//
			
			trackingMsg2.carrier = shipment.carrierCompany
			trackingMsg2.msgType = "Appointment"
			trackingMsg2.createdDate = new Date()
			if (trackingMsg2.msgDate !=null )
				shipment.addToTrackingMsgs(trackingMsg2)
			else
				println "Appointment for slot 2 not found."

			def stop1 = new ShipmentStops();
			stop1.estdArrival=  transportationOrder.pickupStart
			stop1.estdDeparture=  transportationOrder.pickupEnd
			stop1.plannedArrival=  transportationOrder.pickupStart
			stop1.plannedDeparture=  transportationOrder.pickupEnd
			stop1.stopAction="Pickup"
			stop1.stopNumber	= 1
			stop1.apptDate	=  trackingMsg1.msgDate
			shipment.timeOfDeparture = stop1.apptDate
			stop1.address = transportationOrder.fromAddress
			shipment.addToShipmentStops(stop1)
	 
			def stop2 = new ShipmentStops();
			stop2.estdArrival=  transportationOrder.deliveryStart
			stop2.estdDeparture=  transportationOrder.deliveryEnd
			stop2.plannedArrival=  transportationOrder.deliveryStart
			stop2.plannedDeparture=  transportationOrder.deliveryEnd
			stop2.stopAction="Deliver"
			stop2.stopNumber	= 2
			stop2.apptDate	= trackingMsg2.msgDate
			stop2.address = transportationOrder.toAddress
			shipment.addToShipmentStops(stop2)

			}
			origin = transportationOrder.origin
			destination = transportationOrder.destination
			
			
			
			//create shipment
			
			//shipment.weightUnits = transportationOrder.weightUnits
			
	 
			//shipment.get
			transportationOrder.toStatus = com.cimbidia.scm.constants.Constants.TO_STATUS_PLANNED
			shipment.addToTransportationOrders(transportationOrder)
			
			println "create tracking message" + shipment.pickupStart + "***" + shipment.origin + "***" + shipment.pickupEnd
			
			shipment.save(failOnError: true)
			println "shipment id : "+shipment.id
		}
		
	
	}
	
	public List<CarrierShipment> getCarrierShipmentsByFilter(Integer companyId,String shipmentNumber,Location origin,Location destination,String toStatus,Company shipperCompany,String orderBy,String colName){
		def companyInstance = Company.findById(companyId)
		
		def carrierShipment = CarrierShipment.withCriteria {
			and {
				
				if(shipmentNumber) { eq("shipmentNumber",shipmentNumber)}
				if (toStatus) { eq("shipStatus", toStatus) }
				if (origin) { eq("origin", origin) }
				if (destination) { eq("shipDestination", destination) }
				if(shipperCompany){eq("shipperCompanyId",shipperCompany)}
				}
			if( colName) {order(colName, orderBy)}
		}
		return carrierShipment
	}
	
	public void addShipmentCarrier(RoutingRatingLookupResult routingRatingLookupResult,Shipment shipment){
		println " add to shipment carrier "
		def shipmentCarrier = new ShipmentCarrier()
		shipmentCarrier.shipment = shipment
		shipmentCarrier.carrier = routingRatingLookupResult.routingGuideCarrier.carrier
		shipmentCarrier.dateCreated=new Date()
		shipmentCarrier.routingGuide=routingRatingLookupResult.routingGuideCarrier.routingGuide
		shipmentCarrier.ratingLaneCarrierId=routingRatingLookupResult.ratingLaneCarrier.id
		shipmentCarrier.carrierPriority=routingRatingLookupResult.routingGuideCarrier.carrierPriority
		shipmentCarrier.totalCost=routingRatingLookupResult.ratingLaneCarrier.rate
		shipmentCarrier.status=routingRatingLookupResult.routingGuideCarrier.routingGuide.rgStatus
		shipmentCarrier.routingGuideCarrier=routingRatingLookupResult.routingGuideCarrier
		shipmentCarrier.ratingGuideId=routingRatingLookupResult.ratingLaneCarrier.ratingLane.id
		
		//save to shipment accessorial 
		def ratingLaneAccessorialList=routingRatingLookupResult.ratingLaneCarrier.ratingLaneAccessorialList
		for(int i=0;i<ratingLaneAccessorialList?.size();i++){
					def ratingLaneAccessorial=(RatingLaneAccessorial)ratingLaneAccessorialList[i]
					def shipAccessorial=new ShipmentAccessorial()
					
				shipAccessorial.shipment=shipment
				shipmentCarrier.totalCost+=ratingLaneAccessorial.rate
				shipAccessorial.rate=ratingLaneAccessorial.rate
				shipAccessorial.accessorial=ratingLaneAccessorial.accessorial
				shipAccessorial.ratingLaneCarrier=ratingLaneAccessorial.ratingLaneCarrier
				shipAccessorial.save(flush: true,failOnError: true)
		}
		shipmentCarrier.save(flush: true,failOnError: true)
	}
	
	
	
	List<ShipmentAccessorial> getAccessorialsForShipment(String shipmentId, String ratingLaneCarrierId ) {
		println "rating : "+ratingLaneCarrierId
		def shipmentAccessorials = ShipmentAccessorial.withCriteria {


			eq("shipment.id", shipmentId)
			eq("ratingLaneCarrier.id", ratingLaneCarrierId)
		}
		
		return shipmentAccessorials;
	}
	
	public ShipmentCarrier assignShipment(Shipment shipment){
		def shipmentCarrier = ShipmentCarrier.findByShipment(shipment)
		shipmentCarrier.status="ASSIGNED"
		shipment.carrierCompany = shipmentCarrier.carrier
		shipment.carrierPrice = shipmentCarrier.totalCost
		return shipmentCarrier
	}
	public void resetResourceSelection(Shipment shipment, boolean isReject){
		deleteShipmentCarrier(shipment)
		def rsdetail = RsDetail.findByParentId(shipment.companyId.id)
		def routingGuideSearchCriteria=getRoutingGuideSearchCriteria(shipment)
		if (rsdetail !=null && rsdetail.cycleType=="core"){
			if (isReject)
				routingGuideSearchCriteria.orderBy="CP"
			else
				routingGuideSearchCriteria.orderBy="TC"
		}else{
			if (isReject)
				routingGuideSearchCriteria.orderBy="TC"
			else
				routingGuideSearchCriteria.orderBy="CP"
		}
		def list=routingGuideService.getMatchingRoutesList(routingGuideSearchCriteria,5)
		if(list.size>0){
			for(int i=0;i<list.size;i++){
				def routingRatingLookupResult=(RoutingRatingLookupResult)list[i]
				
				addShipmentCarrier(routingRatingLookupResult,shipment)
				if(i==0){
					assignShipment(shipment)
				}
			}
			println "shipment.companyId : "+shipment.companyId.id
			
			println "rsdetail.autoTender : "+rsdetail
			if(rsdetail !=null && rsdetail.autoTender){
				tenderedShipmentStatus(shipment)
				addToTrackingMsg(shipment)
				addCarrierShipment(shipment)
			}
		}
		
	}
	
	public RoutingGuideSearchCriteria getRoutingGuideSearchCriteria(Shipment shipment){
		def routingGuideSearchInstance =new  RoutingGuideSearchCriteria()
		routingGuideSearchInstance.company=shipment.companyId
		routingGuideSearchInstance.businessUnit=shipment.businessUnit
		routingGuideSearchInstance.origin=shipment.origin
		routingGuideSearchInstance.destination=shipment.shipDestination
		routingGuideSearchInstance.shipment=shipment
		routingGuideSearchInstance.billingMethod=shipment.payMethod
		routingGuideSearchInstance.mot=shipment.mot
		routingGuideSearchInstance.equipment=shipment.equipment
		routingGuideSearchInstance.tempCtrl=shipment.tempCtrl
		//routingGuideSearchCriteria.serviceLevel=shipment
		routingGuideSearchInstance.routingDate=new Date()
		routingGuideSearchInstance.effectiveStartTime=shipment.pickupStart
		routingGuideSearchInstance.effectiveEndTime=shipment.deliveryEnd
		routingGuideSearchInstance.carrierCompany=shipment.carrierCompany
		routingGuideSearchInstance.numOfStops=2
		routingGuideSearchInstance.distance=shipment.distance
		routingGuideSearchInstance.weight=shipment.weight
		return routingGuideSearchInstance
	}
	public void deleteShipmentCarrier(shipment){
		def shipmentCarriers = ShipmentCarrier.withCriteria {
			eq("shipment", shipment)
			}
		if(shipmentCarriers.size()>0){
		for(int i=0;i<shipmentCarriers.size;i++){
			shipmentCarriers[i].delete()
		}
		}
		def shipmentAccessorials = ShipmentAccessorial.withCriteria {
			eq("shipment", shipment)
			}
		if(shipmentAccessorials.size()>0){
		for(int i=0;i<shipmentAccessorials.size;i++){
			shipmentAccessorials[i].delete()
		}
		}
		
	}
	
	public void createTrackingMsg(TrackingMessage trackingMsg, Shipment shipmentInstance){
		def carrierShipmentInstance = CarrierShipment.findByShipment(shipmentInstance)
		trackingMsg.carrier = shipmentInstance.carrierCompany
		trackingMsg.createdDate = new Date()
		ShipmentStops stop = ShipmentStops.findByShipmentAndStopNumber(shipmentInstance,trackingMsg.getStopNumber())
		stop?.shipment = shipmentInstance
		if( trackingMsg.msgType.equals("Arrival")){
			stop?.actualArrival = trackingMsg.msgDate
		}else if( trackingMsg.msgType.equals("Departure")){
			stop?.actualDeparture = trackingMsg.msgDate
		}
		
		println "Saving tracking message: " + trackingMsg
		trackingMsg.save(failOnError: true)
		if(shipmentInstance.shipStatus.equals("Accepted")||shipmentInstance.shipStatus.equals("Planned")){
		if(trackingMsg.stopNumber == 1){
			
			shipmentInstance.shipStatus ="InTransit"
			carrierShipmentInstance?.shipStatus ="InTransit"
		}}
		
		if(trackingMsg.stopNumber == 2){
			
			shipmentInstance.shipStatus ="Delivered"
			carrierShipmentInstance?.shipStatus ="Delivered"
		}
		println "Out of shipment, back to booking controller"

	}
}
