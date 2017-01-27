package com.cimbidia.wm.booking

import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.Region
import com.cimbidia.scm.constants.Constants
import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil

class BookingForecast {

	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date = DateUtil.getTodaysDate()
		createdBy = user
		dateCreated = date
		if(user.companyId)
			company = Company.findById(user.companyId)
		
	}
	
	String id
	Location shipFrom
	Location shipTo
	Location originPort
	Location destinationPort
	Region region
	Date forecastDate
	Constants productClass
	Equipment equipmentType
	Integer numberOfEquipments
	Company company
	Boolean bookingsGenerated
	
	// Auditing
	Date dateCreated
	User createdBy
	
	static mapping = {
		id generator: 'uuid'
	}
	
    static constraints = {
    	shipFrom(nullable:false)
    	shipTo(nullable:false)
	    originPort(nullable:false)
		destinationPort(nullable:false)
		region(nullable:false)
		forecastDate(nullable:false)
		productClass(nullable:false)
		equipmentType(nullable:false)
		numberOfEquipments(nullable:false)
		company(nullable:true, display:false)
		bookingsGenerated(nullable:true, display:false)
  		dateCreated(nullable:true,blank: false,display:false)
		createdBy(nullable:true,blank: false,display:false)
    }
}
