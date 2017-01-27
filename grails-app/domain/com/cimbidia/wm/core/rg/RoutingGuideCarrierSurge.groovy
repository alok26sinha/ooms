package com.cimbidia.wm.core.rg

import java.util.List;

import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants


class RoutingGuideCarrierSurge {
	
	String id
	//RoutingGuideCarrier routingGuideCarrier
	Integer surgeCapacityValue
	Date surgeStartDate
    Date surgeEndDate 
    
    static belongsTo = [ routingGuideCarrier: RoutingGuideCarrier ]
 
 	static constraints = {
		surgeCapacityValue(nullable:false)
		surgeStartDate(nullable:false)
		surgeEndDate(nullable:false)
	}
    
}