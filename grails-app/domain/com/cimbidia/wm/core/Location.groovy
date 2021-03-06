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

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.order.Order

import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.TrackingMessage

import com.cimbidia.wm.core.ActivityCode;

/**
 * A location can be a customer, warehouse, or supplier.  
 */
class Location implements Comparable<Location>, java.io.Serializable {
	
	String id
	String name
	byte [] logo				// logo
	Address address
	String fgColor	= "000000"
	String bgColor = "FFFFFF"
	
	Location parentLocation; 
	LocationType locationType	
	LocationGroup locationGroup;

	User manager								// the person in charge of the warehouse
	
	Boolean local = Boolean.TRUE				// indicates whether this warehouse is being managed on the locally deployed system
	Boolean active = Boolean.TRUE				// indicates whether this warehouse is currently active
    Integer sortOrder

	Date dateCreated;
	Date lastUpdated;
	//TrackingMessage trackingMsgs
	Float latitude
	Float longitude
	
	String maxTime 
	String minTime 
	Company company
	static belongsTo = [ parentLocation : Location ]
	static hasMany = [ locations : Location, supportedActivities : String, employees: User  , relatedLocations : RelatedLocation,trackingMsgs:TrackingMessage]
		
	static constraints = {
		name(nullable:false, blank: false, maxSize: 255)
		address(nullable:true)
		locationType(nullable:false)
		locationGroup(nullable:true)
		parentLocation(nullable:true)
		bgColor(nullable:true, validator: {bgColor, obj ->
			def fgColor = obj.properties['fgColor']
			if(fgColor == null) return true 
			bgColor != fgColor ? true : ['invalid.matchingcolor']
		})
		fgColor(nullable:true)
		logo(nullable:true, maxSize:10485760) // 10 MBs
		manager(nullable:true)
		
		active(nullable:false)
		dateCreated(display:false)
		lastUpdated(display:false)
        sortOrder(nullable: true)
		minTime(nullable:true)
		maxTime(nullable:true)
		latitude(nullable:true)
		longitude(nullable:true)
	}
	
	static mapping = {
		id generator: 'uuid'
		// Needs to be eagerly fetched because of Location.supportsActivity() method
		relatedLocations cascade: "all-delete-orphan, save-update"
		relatedLocations lazy:true
		supportedActivities lazy: false
		locationType lazy: false
		cache true
	}
	
	static transients = ["transactions", "events", "shipments", "requests", "orders" ]
	
	//List getTransactions() { return Transaction.findAllByDestinationOrSource(this,this) }
	List getEvents() { return Event.findAllByEventLocation(this) }
	List getShipments() { return Shipment.findAllByOriginOrDestination(this,this) }
	//List getRequests() { return Requisition.findAllByOriginOrDestination(this,this) }
	List getOrders() { return Order.findAllByOriginOrDestination(this,this) } 
	List getUsers() { return User.findAllByWarehouse(this) }
	
	String toString() { return this.name } 

    /**
     * Compares location by sort order and name.
     * @param location
     * @return
     */
	int compareTo(Location location) {
		return sortOrder <=> location?.sortOrder ?: name <=> location?.name
	}
	
	/**
	 * Indicates whether the location supports the given activity.
	 * 
	 * @param activity	the given activity
	 * @return	true if the activity is supported, false otherwise
	 */
	Boolean supports(ActivityCode activity) {
		return supports(activity.id)
	}

	/**
	 * Indicates whether the location supports the given activity.
	 * 
	 * @param activity	the given activity id
	 * @return	true if the activity is supported, false otherwise
	 */
	Boolean supports(String activity) { 
		boolean supportsActivity = false
		if (supportedActivities) {
			supportsActivity = supportedActivities?.any{a -> activity == a.toString()};
		}
		else {
			supportsActivity = locationType?.supports(activity)
		}
		return supportsActivity;

	}
	
	Boolean isWarehouse() {
		return true;//todo
	}

    Boolean isWardOrPharmacy() {
        return (locationType.description in ["Pharmacy", "Ward"])
    }

    Boolean isDepotWardOrPharmacy(){
      return  (locationType.description in ["Depot", "Pharmacy", "Ward"])
    }

	Boolean isPort(){
		return (locationType.description in ["Port"])
	}
	
    static AllDepotWardAndPharmacy(){
      Location.list().findAll{ it.isDepotWardOrPharmacy()}.sort{it.name}
    }
    
    
}
