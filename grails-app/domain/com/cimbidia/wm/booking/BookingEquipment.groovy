package com.cimbidia.wm.booking

import com.cimbidia.wm.core.User
import com.cimbidia.wm.core.Equipment
import com.cimbidia.scm.constants.Constants
import grails.converters.*

class BookingEquipment {
	
	String id
   	Equipment equipmentType
	Integer numOfContainers
	Integer numOfConfirmedContainers
	Constants transportationService
	Constants equipmentProvider
	String comments
	
	static mapping = {
		id generator: 'uuid'
		cache true
	}

	static belongsTo = [ booking: Booking ]
	
	static constraints = { 
		equipmentType(nullable:false)
		transportationService(nullable:false)
		numOfContainers(nullable:false)
		numOfConfirmedContainers(nullable:true)
		equipmentProvider(nullable:false)
		comments(nullable:true)
	}
}
