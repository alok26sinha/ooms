package com.cimbidia.scm.oms


import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil

class InventorySupplyType {

   static mapping = {
		id generator: 'uuid'
		table "`inventory_supply_type`"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		
	  }
	
	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date = DateUtil.getTodaysDate()
		createdBy = user
		createdDttm = date
		modifiedBy = user
		modifiedDttm = date
		
	}
	def beforeUpdate ={
		modifiedBy = AuthService.currentUser.get()
		modifiedDttm = DateUtil.getTodaysDate()
	}
	
	def beforeInsert() {
		
		createdDttm = new Date()
		modifiedDttm = new Date()
	}
	def beforeUpdate(){
		modifiedDttm = new Date()
	}
	static constraints = {
		
		createdBy(nullable:true,blank: false)
		modifiedBy(nullable:true,blank: false)
		createdDttm(nullable:true,blank: false)
		modifiedDttm(nullable:true,blank: false)		
	}
	
	String id;
	String supplyType 
	String description;
	boolean onhandSupply;
	User createdBy;
	User modifiedBy;
	Date createdDttm;
	Date modifiedDttm;
	Integer version;
	
	
}
