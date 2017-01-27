package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location;

import com.cimbidia.wm.product.Product;


import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper

import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil

class InventoryDemand {

	String Id;
	Company company
	ItemLocation itemLocation;
	InventoryDemandType inventoryDemandType;
	InventoryIdentifier inventoryIdentifier
	Double quantity;
	Date demandStartDate;
	Date demandEndDate;
	String demandReferencesType
	String demandReferences
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
   

	static mapping = {
		id generator: 'uuid'
		table "inventory_demand"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		itemLocation cascade :"none"
		inventoryDemandType cascade :"none"
		inventoryIdentifier cascade :"none"
		company cascade:"none"
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
		inventoryDemandType(nullable:false,blank:false)
		itemLocation(nullable:false,blank:false)
		inventoryIdentifier(nullable:false,blank:false)
		company(nullable:false, blank:false)
	}
}
