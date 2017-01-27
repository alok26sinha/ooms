/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core;


// import java.util.Date

class Blog implements Serializable {


	def beforeInsert = {
		dateCreated = new Date()
		lastUpdated = new Date()
	}
	def beforeUpdate ={
		lastUpdated = new Date()
	}	
	
	String id
	String name
	User owner
	Date dateCreated;
	Date lastUpdated;
	
	static hasMany = [ comments : Comment, followers : User  ]

	
	static mapping = {
		id generator: 'uuid'
		comments cascade: "all-delete-orphan"
	}
	static notCloneable = ['comments']
	
	
	static constraints = {
		name(nullable:false, maxSize: 255)
		owner(nullable:true)
	}

	String toString() { return "$blog"; }
}
