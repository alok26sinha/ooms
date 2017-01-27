package com.cimbidia.wm.shipment

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.User
import com.cimbidia.wm.core.rg.*

class ShipmentCarrier {

	String id
	//Shipment shipment
	Date dateCreated
	Date lastUpdated
	String createdById
	String updatedById
	RoutingGuide routingGuide
	RoutingGuideCarrier routingGuideCarrier
	String ratingGuideId
	String ratingLaneCarrierId
	Company carrier
	Integer carrierPriority
   	Float totalCost
	String status    
	
	   
    static mapping = {
		   id generator: 'uuid'	
		  // table : "shipment_carriers"
	}
	
	static belongsTo = [shipment:Shipment]
    static constraints = {
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		createdById(nullable:true)
		updatedById(nullable:true)
		routingGuide(nullable:true)
		routingGuideCarrier(nullable:true)
		ratingGuideId(nullable:true)
		ratingLaneCarrierId(nullable:true)
		carrier(nullable:true)
		carrierPriority(nullable:true)
		totalCost(nullable:true)
		status(nullable:true)
    }
}
