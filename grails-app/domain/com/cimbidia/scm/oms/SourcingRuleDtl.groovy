package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User



class SourcingRuleDtl {
	String id
	int priority
	Location fromLocation
		
	
	static belongsTo = [ sourcingRuleHdr : SourcingRuleHdr ]
	
	
	
	static mapping = {
		id generator: 'uuid'
		version false
	  }
	
    static constraints = {
		
		//fromLocation(nullable:true)
		
    }
    
}
