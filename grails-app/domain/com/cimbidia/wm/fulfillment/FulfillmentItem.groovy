/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.fulfillment



class FulfillmentItem implements Serializable {

	String id
	
	// Attributes
	Integer quantity
	
	
	// Audit fields
	Date dateCreated
	Date lastUpdated
	
	static mapping = {
		id generator: 'uuid'
	}
	
	// Bi-directional associations
	static belongsTo = [ fulfillment : Fulfillment ]
	
	// One-to-many associations
	//static hasMany = [ shipmentItems : ShipmentItem ]
		
    static constraints = {
		//requisitionItem(nullable:true)
		//inventoryItem(nullable:true)
		quantity(nullable:true)
    }
	
	/*
	Integer quantityPacked() { 
		return shipmentItems?.sum { it.quantity }
	}
	*/
}
