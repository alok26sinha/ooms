package com.cimbidia.wm.core.rg

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.User;

import com.cimbidia.wm.auth.AuthService
class LtlRatesZone {

    String id
	String name
	String description
	Company carrier
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
   

	static constraints = {
		
		createdDttm(nullable:true,display:false)
		modifiedDttm(nullable:true,display:false)
		createdBy(nullable:true, display:false)
		modifiedBy(nullable:true, display:false)
		carrier(nullable:true)
	}
	
	static mapping = {
		
		id generator: 'uuid'
		name(nullable:true)
		description(nullable:true)
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
	}
	
	
	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date  =new Date()
		createdBy = user
		createdDttm = date
		modifiedBy = user
		modifiedDttm = date
		
	}
	def beforeUpdate ={
		modifiedBy = AuthService.currentUser.get()
		modifiedDttm = new Date()
	}
}

