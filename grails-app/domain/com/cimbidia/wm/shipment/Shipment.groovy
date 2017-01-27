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

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.booking.Booking
import com.cimbidia.wm.core.*
import com.cimbidia.wm.order.OrderItem;
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.shipment.ShipmentStatus;
import com.cimbidia.wm.shipment.TransportationOrder;
import com.cimbidia.wm.shipment.ShipmentCarrier;
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Document;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Person;
import com.cimbidia.scm.shipment.ShipmentAccessorial;

// import java.io.Serializable;

class Shipment implements  Serializable {

    def beforeInsert = {
        //def currentUser = AuthService.currentUser.get()
        //if (currentUser) {
        //    createdBy = currentUser
        //    updatedBy = currentUser
        //}

    }
    def beforeUpdate = {
        //def currentUser = AuthService.currentUser.get()
        //if (currentUser) {
        // updatedBy = currentUser
        //}
    }

    String id
	Company companyId 
	String shipmentNumber			// an auto-generated shipment number
	//Date expectedShippingDate		// the date the origin expects to shRCip the goods (required)
	//Date expectedDeliveryDate		// the date the destination should expect to receive the goods (optional)
	//Float statedValue
	//Float totalValue				// the total value of all items in the shipment		
	String additionalInformation	// any additional information about the shipment (e.g., comments)
	Float weight
	Float dimWeight			
	Float volume
	Float quantity								// weight of container
	//String weightUnits  	// standard weight unit: kg, lb
	
	// Audit fields
	Date dateCreated
	Date lastUpdated
	
	// One-to-one associations
	Location origin		
	
	Location shipDestination			// the location to which the shipment will arrive
	//ShipmentType shipmentType		// the shipment type: Air, Sea Freight, Suitcase
	//ShipmentMethod shipmentMethod	// the shipping carrier and shipping service used	
	
	//ShipmentStatus shipmentStatus
	String masterBOL
	Company businessUnit
	Booking booking
	//String billTo
	//String productClass
	String tempCtrl
	String isPerish
	Equipment equipment 
	String trailerId
	String tractorId
	String sealNumber
	//String mode
	//String shipper -- Company
	Company seller
	String payMethod
	Float shipmentPrice
	Float carrierPrice
	Date pickupStart
	Date pickupEnd
	Date timeOfDeparture
	Date timeOfArrival
	Company billTo
	Company carrierCompany
	Constants pc
	Date deliveryStart
	Date deliveryEnd
	String shipStatus
	Mot mot
	Constants transResp
	
	Address fromAddress
	Address toAddress
	Float distance
	String time
	String rsDetailId
	String rsCycleType
	Integer rsLevel
	
	static transients = [ 
		"actualShippingDate",
		"actualDeliveryDate",
		"shipmentStatus",
		"payMethod",
		"expectedShippingDate",		// the date the origin expects to shRCip the goods (required)
		"expectedDeliveryDate"
		]
	
	
	
	List shipmentSizes = new ArrayList()
	
	// Core association mappings
	static hasMany = [
					  transportationOrders : TransportationOrder,
					  shipmentSizes : ShipmentSize,
					  shipmentStops : ShipmentStops,
					  trackingMsgs : TrackingMessage,
					  shipmentCarriers : ShipmentCarrier,
					 // shipmentAccessorials : ShipmentAccessorial
					
					]
	

	static mapping = {
		id generator: 'uuid'
		cache true
		additionalInformation type: "text"
		shipmentSizes lazy : false
		shipmentSizes cascade: "all-delete-orphan"
		transResp column : "trans_resp"
		billTo column : "bill_to"
		carrierCompany column : "carrier"
		pc column : "product_class"
		
		
		businessUnit column : "business_unit"
		origin column : "origin_id"
		//destination column : "destination_id"
		shipDestination column : "destination_id"
		shipDestination cascade : "none"
		mot column : "mot"
		mot cascade : "none"
		pickupStart column : "pickup_start"
		pickupEnd column : "pickup_end"
		deliveryStart column : "delivery_start"
		deliveryEnd column : "delivery_end"
		fromAddress column : "from_address"
		toAddress column : "to_address"
		fromAddress lazy : false
		toAddress lazy : false
		toAddress cascade : "save-update"
		fromAddress cascade : "save-update"
		weight column : "weight"
		//weightUnits column : "weight_units"
		volume coumn : "volume"
		quantity volumn : "quantity"
		equipment column : "equipment"
		equipment cascade : "none"
		booking cascade : "none"
		
		trackingMsgs sort: 'createdDate', order: 'asc'
		shipmentStops sort : 'stopNumber',order:'asc'
		transportationOrders sort : 'dateCreated',order:'desc'
		companyId column : "company_id"
		dimWeight column : "dim_weight"
		timeOfDeparture : "time_of_departure"
		timeOfArrival : "time_of_arrival"
	}

	// Constraints
	static constraints = {
		shipmentPrice(nullable:true)
		seller(nullable:true)
		masterBOL(nullable:true)
		trailerId(nullable:true)
		tractorId(nullable:true)
		sealNumber(nullable:true)
		tempCtrl(nullable:true)
		isPerish(nullable:true)
		timeOfDeparture(nullable:true)
		timeOfArrival(nullable:true)
		//expectedShippingDate(nullable:true)		// the date the origin expects to shRCip the goods (required)
		//expectedDeliveryDate(nullable:true)
		equipment(nullable:true)
		carrierPrice(nullable:true)
		shipmentNumber(nullable:true, maxSize: 255)	
		shipDestination(nullable:false)
		origin(nullable:false) 
		additionalInformation(nullable:true, maxSize: 2147483646)
		carrierCompany(nullable:true)
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		//weightUnits(nullable:true)
		//destination(nullable:true)
		billTo (nullable:true)
		businessUnit (nullable:true)
		companyId(nullable:true)
		
		weight(nullable:true)
		volume(nullable:true)
		quantity(nullable:true)
		dimWeight(nullable:true)
		distance(nullable:true)
		time(nullable:true)
		pc(nullable:true)
		deliveryEnd(nullable:true)
		deliveryStart(nullable:true)
		pickupEnd(nullable:true)
		pickupStart(nullable:true)
		rsDetailId(nullable:true)
		rsCycleType(nullable:true)
		rsLevel(nullable:true)
		booking(nullable:true)
	}

	
	

	
	Collection<TransportationOrder> getUniquePOs() {
		return transportationOrders.unique ( false, new java.util.Comparator(){
			
			
			public int compare( obj1, obj2){
				if(obj1.poNumber != null && obj2.poNumber!=null){
					 return  obj1.poNumber <=> obj2.poNumber;
					 }else{
				return 1;
				}
			   }
			
		});
	
	}
	
	Collection<TransportationOrder> getUniqueCOs() {
		return transportationOrders.unique ( false, new java.util.Comparator(){
			
			
			public int compare( obj1, obj2){
				if(obj1.coNumber != null && obj2.coNumber!=null){
					 return  obj1.coNumber <=> obj2.coNumber;
					 }else{
				return 1;
				}
			   }
			
		});
	
	}



	
	public String toString(){
		return shipmentNumber.toUpperCase();
	}	

}

