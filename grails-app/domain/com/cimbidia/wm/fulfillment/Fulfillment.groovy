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



import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.fulfillment.FulfillmentStatus;

class Fulfillment implements Serializable {

	String id
	
	// Attributes
	FulfillmentStatus status;
	//Request request;				// request [to be] fulfilled	
	Person fulfilledBy				// person whom fulfilled request
	Date dateFulfilled				// the date that the request was fulfilled
	
	// Audit fields
	Date dateCreated
	Date lastUpdated

	// Bi-directional Associations	
	//static belongsTo = [ requisition : Requisition ]
	
	// One-to-many associations 
	static hasMany = [ fulfillmentItems : FulfillmentItem ]
	
	static mapping = {
		id generator: 'uuid'
		fulfillmentItems cascade: "all-delete-orphan", sort: "id"
	}

	// Constraints
    static constraints = {
		status(nullable:true)
		//requisition(nullable:false)
		fulfilledBy(nullable:true)
		dateFulfilled(nullable:true)
    }
}
