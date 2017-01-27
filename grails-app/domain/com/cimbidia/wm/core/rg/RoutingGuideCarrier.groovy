package com.cimbidia.wm.core.rg

import java.util.List;

import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.Mot
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil


class RoutingGuideCarrier {

	String id
	RoutingGuide routingGuide
	Mot mot	
	Equipment equipment
	Constants tempCtrl
	Constants serviceLevel
	
	Company carrier
	Integer carrierPriority
	Constants frequency
	String absOrPercent
	Integer commitmentValue
	Integer capacityValue	
	
	//child Object
	List routingGuideCarrierSurgeList
	
	static belongsTo = [ routingGuide: RoutingGuide ]
	
	static mapping = {
		id generator: 'uuid'
		routingGuideCarrierSurgeList cascade: "all-delete-orphan, save-update"
	}
	
   static hasMany = [
    	routingGuideCarrierSurgeList: RoutingGuideCarrierSurge
  	]
	
	static constraints = {
		carrier(nullable:false)
		mot(nullable:true)	
		equipment(nullable:true)
		tempCtrl(nullable:true)
		serviceLevel(nullable:true)
		absOrPercent(nullable:true)
		carrierPriority(nullable:false)
		frequency(nullable:true)
		commitmentValue(nullable:true)
		capacityValue(nullable:true)
	
	}
		
	
}
	