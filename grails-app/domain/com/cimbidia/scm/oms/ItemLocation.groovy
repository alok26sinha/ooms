package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper

import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil

class ItemLocation {

	@Override
	public String toString() {
		return "id=" + id + ", product=" + product+ ", location=" + location + ", safetyStock=" + safetyStock
				
	}
	String id;
	Product product
	Location location
	Double safetyStock = 0.0
	Boolean isActive
	Company company;
	
	User createdBy;
	User modifiedBy;
	Date createdDttm;
	Date modifiedDttm;
	Integer version;
	
	
       static mapping = {
		id generator: 'uuid'
		table "item_location"
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
}
