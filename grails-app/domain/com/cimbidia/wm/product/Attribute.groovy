/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.product

//import java.util.Date;

/**
 * Simple implementation of entity-attribute-value model that allows for 
 * a Product to be extended to contain custom attribute values
 * TODO: This should really be named ProductAttribute
 */
class Attribute {
	
	String id
	String name 			// The name of the attribute (e.g. 'vitality')
	Boolean allowOther		// If true, supports a free-text entry for value
	List options;			// Valid coded option values for this attribute
	
	Date dateCreated;
	Date lastUpdated;

	static hasMany = [options : String ];

	static mapping = {
		id generator: 'uuid'
	}	
		
	static constraints = { 
		name(nullable:false, maxSize: 255)
		dateCreated(display:false)
		lastUpdated(display:false)
	}
	       
	String toString() { return "$name"; }
}
