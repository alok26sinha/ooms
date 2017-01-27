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


class RoutingGuide {

	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date = DateUtil.getTodaysDate()
		
		dateCreated = date
		lastUpdated = date
		createdBy = user
		updatedBy = user
		println "user.companyId="+user.companyId
		if(user.companyId)
			company = Company.get(user.companyId);
		
	}
	def beforeUpdate ={
		updatedBy = AuthService.currentUser.get()
		lastUpdated = DateUtil.getTodaysDate()
	}
	
	String id
	String rgStatus
	
	Company company
	Company businessUnit
	Location origin
	Location destination	
	
	Constants billingMethod
	Company billTo
	
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
	List routingGuideCarrierList
	
    static constraints = {
		company(nullable:true, display:false)
		businessUnit(nullable:true)
		billingMethod(nullable:true)
		billTo(nullable:true)
		
		rgStatus(nullable:false, inList:["ACTIVE","INACTIVE"])
		origin(nullable:true)
		destination(nullable:true)
		fromType(nullable:false)
		fromCity(nullable:true)
		fromCounty(nullable:true)
		fromStateOrProvince(nullable:true)
		fromPostalCode(nullable:true)
		fromCountry(nullable:true)
		
		toType(nullable:false)
		toCity(nullable:true)
		toCounty(nullable:true)
		toStateOrProvince(nullable:true)
		toPostalCode(nullable:true)
		toCountry(nullable:true)
		
		effectiveStartDate(nullable:false)
		effectiveEndDate(nullable:false)
		
		weightage(display:false, nullable:true)
		
		dateCreated(nullable:true, display:false)
		lastUpdated(nullable:true, display:false)
		createdBy(nullable:true, display:false)
		updatedBy(nullable:true, display:false)
    }
	static mapping = {
		id generator: 'uuid'
		routingGuideCarrierList lazy:false
		routingGuideCarrierList cascade: "all-delete-orphan, save-update"
	}
	
   static hasMany = [
    	routingGuideCarrierList: RoutingGuideCarrier
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
