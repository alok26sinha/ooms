package com.cimbidia.wm.core.rg


import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.User

class RatingLane {

    def beforeInsert = {
		def user = AuthService.currentUser.get()
		
		createdBy = user
		updatedBy = user
		println "user.companyId="+user.companyId
		if(user.companyId)
			company = Company.get(user.companyId);
		
	}
	def beforeUpdate ={
		updatedBy = AuthService.currentUser.get()
	}
	
	String id
	String status
	
	Company company
	Company businessUnit
	Location origin
	Location originShipVia
	
	Location destination
	Location destinationShipVia	
	
	//fromAddress fields
	String fromType
	String fromCity
	String fromCounty
	String fromStateOrProvince
	String fromPostalCode
	String fromCountry
	
	//toAddress fields
	String toType
	String toCity
	String toCounty
	String toStateOrProvince
	String toPostalCode
	String toCountry
	
	Constants minCommodity
	Constants maxCommodity
	Date effectiveStartDate
	Date effectiveEndDate	

	Integer weightage
	
	//Audit fields
	int version
	Date dateCreated
	Date lastUpdated
	User createdBy
	User updatedBy
	
	//childObject
	List ratingLaneCarrierList
	
    static constraints = {
		company(nullable:true, display:false)
		businessUnit(nullable:true)
		
		status(nullable:false, inList:["ACTIVE","INACTIVE"])
		origin(nullable:true)
		originShipVia(nullable:true)
	
		destination(nullable:true)
		destinationShipVia(nullable:true)
		
		fromCity(nullable:true)
		fromCounty(nullable:true)
		fromStateOrProvince(nullable:true)
		fromPostalCode(nullable:true)
		fromCountry(nullable:true)
		
		toCity(nullable:true)
		toCounty(nullable:true)
		toStateOrProvince(nullable:true)
		toPostalCode(nullable:true)
		toCountry(nullable:true)
		
		effectiveStartDate(nullable:false)
		effectiveEndDate(nullable:false)
		
		weightage(display:false, nullable:true)
		
		dateCreated(display:false)
		lastUpdated(display:false)
		createdBy(nullable:true, display:false)
		updatedBy(nullable:true, display:false)
    }
	static mapping = {
		id generator: 'uuid'
		//ratingLaneCarrierList lazy:true
		ratingLaneCarrierList cascade: "all-delete-orphan, save-update"
		//cache false
	}
	
   static hasMany = [
    	ratingLaneCarrierList: RatingLaneCarrier
  	]
  		
	 String getFullFromAddress()
	{
		String fullFromAddress =  (fromCity?(fromCity+", "):"") + (fromCounty?(fromCounty+", "):"") + (fromStateOrProvince?(fromStateOrProvince+", "):"") + (fromPostalCode?(fromPostalCode+", "):"") + (fromCountry?(fromCountry.toUpperCase()):"")  
		return fullFromAddress
	}
	
	String getFullToAddress()
	{
		String fullToAddress = (toCity?(toCity+", "):"") + (toCounty?(toCounty+", "):"") + (toStateOrProvince?(toStateOrProvince+", "):"") + (toPostalCode?(toPostalCode+", "):"") + (toCountry?(toCountry.toUpperCase()):"")  
		return fullToAddress
	} 

}
