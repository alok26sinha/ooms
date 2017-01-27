package com.cimbidia.scm.asn

import java.util.Date;
import com.cimbidia.wm.auth.AuthService

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.wm.core.Equipment;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.order.Order
import com.cimbidia.wm.order.OrderItem
import com.cimbidia.wm.receiving.Receipt;

class AsnItems {

   
	String id
	Order order
	OrderItem orderItem
	Float quantity

	Float pricePerUom
	
	Constants pc
	String priceCurrency
	Integer lineNum
	Float weight
	Float volume
	Integer quantityUom
	Integer weightUom
	Integer volumeUom
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
	
	static mapping = {
		id generator: 'uuid'
		//cache true
		//table: "asn_items"
		
		
		
		weight column : "weight"
		//weightUnits column : "weight_units"
		volume coumn : "volume"
		quantity volumn : "quantity"
		pc column:"pc"
		
		timeOfDeparture : "time_of_departure"
		timeOfArrival : "time_of_arrival"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		
	}
	
	static belongsTo = [ asn : Asn ]

	// Constraints
	static constraints = {
		
		
		
		weight(nullable:true)
		volume(nullable:true)
		quantity(nullable:true)
		quantityUom(nullable:true)
		weightUom(nullable:true)
		volumeUom(nullable:true)
		pricePerUom(nullable:true)
		createdBy(nullable:true)
		modifiedBy(nullable:true)
		createdDttm(nullable:true)
		modifiedDttm(nullable:true)
	}
	
	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date = new Date()
		createdBy = user
		createdDttm = date
		modifiedBy = user
		modifiedDttm = date
		
	}
	def beforeUpdate ={
		modifiedBy = AuthService.currentUser.get()
		modifiedDttm = new Date()
	}
}
