package com.cimbidia.scm.oms

import java.util.List;

import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.LocationType
import com.cimbidia.wm.core.User
import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.product.ProductClass



class SourcingRuleHdr {
	String id
	Company company
	FulfillmentType fulfillmentType
	
	Company customer
	Location toLocation
	String toAddressGeoRegion
	Constants productClass
	Product product 
	Category category	
	boolean substitutionAllowed
	LocationType locationType 
	
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	
	List sourcingRuleDtls = new ArrayList()
	
	
	
	static hasMany = [
		sourcingRuleDtls : SourcingRuleDtl,
		
		 ]
	
	
	
	static mapping = {
		id generator: 'uuid'
		fulfillmentType column:"fulfillment_type"
		
		customer column:"customer"
		toLocation column:"to_location"
		productClass column:"product_class"
		product column:"product"
		category column:"category"
		productClass column:"product_class"
		locationType column:"location_type"
		createdBy column:"created_by"
		modifiedBy column:"modified_by"
		fulfillmentType cascade : "none"
		company cascade : "none"
		
		customer cascade : "none"
		toLocation cascade : "none"
		productClass cascade : "none"
		product cascade : "none"
		category cascade : "none"
		locationType cascade : "none"
		createdBy cascade : "none"
		modifiedBy cascade : "none"
		
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
		fulfillmentType(nullable:true)
		
		customer(nullable:true)
		productClass(nullable:true)
		product(nullable:true)
		category(nullable:true)
		locationType(nullable:true)
		
    }
    
}
