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

import com.cimbidia.wm.core.User;
import com.cimbidia.wm.auth.AuthService;
import com.cimbidia.scm.admin.Company;
import com.cimbidia.wm.util.DateUtil;
import com.cimbidia.wm.core.Mot


class CarrierMot implements java.io.Serializable {
	
	   	def beforeInsert = {
	   	def user = AuthService.currentUser.get()
	   	def todaysDate = DateUtil.getTodaysDate()
	   	println "inbeofreinsert user="+user
		createdBy = user
		dateCreated = todaysDate
		updatedBy = user
		lastUpdated = todaysDate
	}

	def beforeUpdate ={
		updatedBy = AuthService.currentUser.get()
		lastUpdated = DateUtil.getTodaysDate()
	}
	
 	String id  
  	Mot mot  
  	//Shipper shipper  
  	Company company  

  	//Audit fields
    Date dateCreated
	Date lastUpdated
	User createdBy
	User updatedBy
	

	static mapping = {
		id generator: 'uuid'
	}
	
    static constraints = {
    	//shipper(nullable:false)
		mot(nullable:false)
		dateCreated(display:false, nullable:true)
		lastUpdated(display:false, nullable:true)
		createdBy(display:false, nullable:true)
		updatedBy(display:false, nullable:true)
   	}

	String toString()
	{
		company.name + " - " + mot.code
	}
	

}
