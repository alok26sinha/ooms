package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.User



class AllocationRule {
	String id
	Company company
	String description
	boolean shipComplete
	boolean lineShipComplete
	boolean shipSingleLocation
	boolean lineShipSingleLocation
	boolean considerFutureInventory
	boolean applyOnHandSafetyFactor	
	boolean applyFutureSafetyFactor
	boolean honorPriorCommittments
	boolean cancelOrderOnFail
	double weightToDistance
	double weightToLocation
	OptimizationType optimizationType //time, priority, number of shipments
	
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	
	
	
	
	
	static mapping = {
		id generator: 'uuid'
		company column : "company"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		optimizationType column : "optimization_type"
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
    @Override
    public String toString() {
    	
    	return description.toString();
    }
}
