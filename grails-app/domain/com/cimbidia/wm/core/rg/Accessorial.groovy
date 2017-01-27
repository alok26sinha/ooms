package com.cimbidia.wm.core.rg


import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Person

class Accessorial {

	String id
	String description
	Constants sourceData
	Constants uom
	Constants calculationMethod
	Constants accessorialType
	Boolean isHazmat = Boolean.FALSE
	Boolean canBeOverridden = Boolean.FALSE
	Float invoiceCostTolerancePercent
	Float invoiceCostToleranceAmt
	Boolean isDefaultForInvoicing = Boolean.FALSE
	Boolean isFuelAccessorial = Boolean.FALSE
	Constants fuelIndexName
	
	static mapping = {
		id generator: 'uuid'
	}
	
	static constraints = {
		
		description(nullable:false)
		sourceData(nullable:true)
		uom(nullable:true)
		calculationMethod(nullable:true)
		accessorialType(nullable:true)
		invoiceCostTolerancePercent(nullable:true)
		invoiceCostToleranceAmt(nullable:true)
		fuelIndexName(nullable:true)
	}
		
}
