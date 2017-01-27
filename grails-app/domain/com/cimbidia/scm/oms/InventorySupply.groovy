package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company

import com.cimbidia.wm.product.Product

import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper

import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil
class InventorySupply {

	String Id;
	Company company
	ItemLocation  itemLocation
	InventorySupplyType inventorySupplyType;
	InventoryIdentifier inventoryIdentifier;
	String supplyReferences
	String supplyReferenceType
	Double quantity;
	Date startDate;
	Date endDate;
	
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
    
	
	static mapping = {
		id generator: 'uuid'
		table "inventory_supply"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
	
		itemLocation cascade :"none"
		inventorySupplyType cascade :"none"
		
		company cascade :"none"
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
	static constraints = {
		
		createdBy(nullable:true,blank: false)
		modifiedBy(nullable:true,blank: false)
		createdDttm(nullable:true,blank: false)
		modifiedDttm(nullable:true,blank: false)
		inventorySupplyType(nullable:true,blank:false)
		itemLocation(nullable:true,blank:false)
		
		company(nullable:true, blank:false)
	}
}
