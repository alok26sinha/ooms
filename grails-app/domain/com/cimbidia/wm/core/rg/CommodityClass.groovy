package com.cimbidia.wm.core.rg

import java.util.Date;

import com.cimbidia.wm.core.User;

import com.cimbidia.wm.auth.AuthService
class CommodityClass {

	@Override
	public String toString() {
		return  name ;
	}
	String id
	String name
	String description
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
	}
	
	static mapping = {
		
		id generator: 'uuid'
		table "commodity_class"
		name(nullable:true)
		description(nullable:true)
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
	}
	
	
	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date =new Date()
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
