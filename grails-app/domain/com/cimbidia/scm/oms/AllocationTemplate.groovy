package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.customerOrder.CustomerOrderStatus

class AllocationTemplate {
	String id
	Company company
	Company customer
	String orderNumber
	CustomerOrderStatus status
	Location shipTo
	Date dueDate
	AllocationRule rule
	
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	
	def beforeInsert() {
		
		createdDttm = new Date()
		modifiedDttm = new Date()
	}
	def beforeUpdate(){
		modifiedDttm = new Date()
	}
	static mapping = {
		id generator: 'uuid'
		company column : "company"
		customer column : "customer"
		status column : "status"
		rule column : "rule"
		shipTo column : "ship_to"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		company cascade : "none"
		customer cascade : "none"
		status cascade : "none"
		shipTo cascade : "none"
		rule cascade : "none"
		createdBy cascade : "none"
		modifiedBy cascade : "none"
	}
	static constraints = {
		
		customer(nullable:true)
		orderNumber(nullable:true)
		status(nullable:true)
		shipTo(nullable:true)
		dueDate(nullable:true)
		createdBy(nullable:true,blank: false)
		modifiedBy(nullable:true,blank: false)
		createdDttm(nullable:true,blank: false)
		modifiedDttm(nullable:true,blank: false)
		
		
		
		
	}
}
