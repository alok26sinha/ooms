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

import java.util.Date;
import java.util.List;

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.*
import com.cimbidia.wm.order.OrderDelivery;
import com.cimbidia.wm.order.OrderItem;
import com.cimbidia.wm.order.OrderDeliveryShipment;
import com.cimbidia.wm.receiving.Receipt
import com.cimbidia.wm.shipment.ShipmentStatus;
import com.cimbidia.wm.shipment.TransportationOrder;
import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Document;
import com.cimbidia.wm.core.Event;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Person;


// import java.io.Serializable;

class CarrierShipment implements Comparable, Serializable {

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
	Company shipperCompanyId
	String shipmentNumber			// an auto-generated shipment number
	Float weight											// weight of container
	Date dateCreated
	Date lastUpdated
	Location origin		
	Location destination			// the location from which the shipment will depart
	Location shipDestination			// the location to which the shipment will arrive
	
	String payMethod
	Date pickupStart
	//Date pickupEnd
	String timeOfDeparture
	String timeOfArrival
	Company billTo
	Company carrierCompany
	
	//Constants pc
	Date deliveryStart
	//Date deliveryEnd
	String shipStatus
	//Constants mot
	//Constants transResp
	Shipment shipment
	Company seller
	Float distance
	String time
	 
	// Core association mappings
	static hasMany = [
					  trackingMsgs : TrackingMessage
					]
	static transients = [ 
		"allShipmentItems",
		"unpackedShipmentItems",
		"containersByType", 
		"mostRecentEvent", 
		"actualShippingDate",
		"actualDeliveryDate",
		"shipmentStatus",
		"pos","cos","tos",
		"shipper",
		"payMethod",
		"seller",
		"timeOfDeparture",
		"timeOfArrival",
		"destination"]
	
	

	static mapping = {
		id generator: 'uuid'
		table "`carrier_shipment`"
		cache true
		billTo column : "bill_to"
		carrierCompany column : "carrier"
		origin column : "origin_id"
		shipDestination column : "destination_id"
		shipDestination cascade : "none"
		shipment : "shipment_id"
		pickupStart column : "pickup_start"
		deliveryStart column : "delivery_start"
		shipperCompanyId column : "shipper_company_id"
		companyId column : "company_id"
	}

	// Constraints
	static constraints = {
		shipmentNumber(nullable:true, maxSize: 255)	
		shipDestination(nullable:false)
		origin(nullable:false) 
		carrierCompany(nullable:true)
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		weight(nullable:true, max:99999999F)
		billTo (nullable:true)
		distance(nullable:true)
		time(nullable:true)
	}

	@Override
	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	Boolean hasShipped() {
		//return events.any { it.eventType?.eventCode == EventCode.SHIPPED }
		return 0;
	}
	

}

