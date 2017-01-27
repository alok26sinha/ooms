package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.User



class FulfillmentType {
	String id
	Company company
	String fulfillmentType
	String description
	
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	
	
	
	
	
	static mapping = {
		id generator: 'uuid'
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		
	  }
	def beforeInsert() {
		
		createdDttm = new Date()
		modifiedDttm = new Date()
	
		
	}
	def beforeUpdate(){
		modifiedDttm = new Date()
		
	}
    static constraints = {
		description(nullable:true)
		createdBy(nullable:true,blank: false)
		modifiedBy(nullable:true,blank: false)
		createdDttm(nullable:true,blank: false)
		modifiedDttm(nullable:true,blank: false)
		
		
    }
	String toString() { return "$fulfillmentType"; }
}
