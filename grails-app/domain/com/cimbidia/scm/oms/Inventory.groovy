package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.User;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location;

import com.cimbidia.wm.product.Product;


import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper

import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil
class Inventory {

	String Id
	Company company
	ItemLocation itemLocation
	InventoryIdentifier inventoryIdentifier
	Double quantity = 0.0
	Double allocQty = 0.0
	String objectType
	String objectId
	String objectDtlId
	Date startDate
	Date endDate
	Double averageCost
	Double unitCost
	String costCurrency
	InventoryStatus inventoryStatus
	String dateToShowOnUI
	Double q
	Double oh
	Double allocated
	Double inTransit = 0.0
	Double supply = 0.0
	Double demand = 0.0
	Double net = 0.0
	Double avl = 0.0
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
   
	static transients = ['q','oh','allocated','inTransit', 'dateToShowOnUI', 'supply', 'demand', 'net', 'avl']
		
	
	static mapping = {
		id generator: 'uuid'
		table "inventory"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		inventoryStatus column : "inventory_status"
		
		
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
		
		itemLocation(nullable:false,blank:false)
		inventoryIdentifier(nullable:false,blank:false)
		company(nullable:false, blank:false)
		objectType (nullable:true )
		objectId (nullable:true )
		objectDtlId (nullable:true )
		startDate (nullable:true )
		endDate (nullable:true )
		averageCost (nullable:true )
		unitCost (nullable:true )
		costCurrency (nullable:true )
		inventoryStatus (nullable:true )
	}
	@Override
	public String toString() {
		return "Inventory [company=" + company + ", itemLocation="+ itemLocation + ", quantity=" + quantity + ", dateToShowOnUI="+ dateToShowOnUI + "]";
	}
	
	
}
