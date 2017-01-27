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

class RelatedLocation implements java.io.Serializable {
	
	String id
	Location location
	Location relatedLocation
	String	relationshipType
	Integer daysBuffer
	
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		location (nullable:false)
		relatedLocation(nullable:false)
		relationshipType(nullable:false, inList: ["PORT"])
		daysBuffer (nullable:false)
		dateCreated (display:false)
		lastUpdated (display:false)	
		id (display:false)
	}
	
	static mapping = {
		id generator: 'uuid' 
		cache true
	}
	
	String toString()
	{
		this.relationshipType + "-" + this.relatedLocation.name
	}
	
	
}
	
	
	