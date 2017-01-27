package com.cimbidia.scm.asn

import java.util.Collection;
import java.util.Date;
import java.util.List;
import com.cimbidia.wm.auth.AuthService

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.wm.booking.Booking;
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Equipment;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Mot;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.shipment.TransportationOrder;
import com.cimbidia.wm.receiving.*;

class Asn {

	
	String id
	
	Date dateCreated
	
	Location shipDestination			// the location to which the shipment will arrive
	Date expectedDeliveryDate
	Date expectedShippingDate
	Date lastUpdated
	Location origin
	//Receipt receipt
	String asnNo
	Float price
	String additionalInformation
	Float carrierPrice
	Float weight
	Date pickupStart
	Date pickupEnd
	Company carrierCompany
	Constants pc
	Company billTo
	Equipment equipment
	Company companyId
	Date deliveryStart
	Date deliveryEnd
	Address fromAddress
	Mot mot
	String priorityNumber	
	Address toAddress
	Constants incoTerm
	Constants transResp
	String shipStatus	
	String masterBOL
	Company businessUnit
	String tempCtrl
	String isPerish	
	String trailerId
	String tractorId
	String sealNumber
	Float volume
	Float quantity
	Float dimWeight
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
		
	List asnItems = new ArrayList()	
	
	static transients = [
		"actualShippingDate",
		"actualDeliveryDate",
		"shipmentStatus",
		"payMethod",
		
		]
	
	
	
	List shipmentSizes = new ArrayList()
	
	// Core association mappings
	static hasMany = [
					  asnItems : AsnItems
					 
					]
	
	

	static mapping = {
		id generator: 'uuid'
		table :'asn'
		cache true
		additionalInformation type: "text"
		shipmentSizes lazy : false
		shipmentSizes cascade: "all-delete-orphan"
		transResp column : "trans_resp"
		billTo column : "bill_to"
		carrierCompany column : "carrier"
		pc column : "product_class"
		
		
		businessUnit column : "business_unit"
		origin column : "origin_id"
		//destination column : "destination_id"
		shipDestination column : "destination_id"
		shipDestination cascade : "none"
		mot column : "mot"
		mot cascade : "none"
		pickupStart column : "pickup_start"
		pickupEnd column : "pickup_end"
		deliveryStart column : "delivery_start"
		deliveryEnd column : "delivery_end"
		fromAddress column : "from_address"
		toAddress column : "to_address"
		fromAddress lazy : false
		toAddress lazy : false
		toAddress cascade : "save-update"
		fromAddress cascade : "save-update"
		weight column : "weight"
		//weightUnits column : "weight_units"
		volume coumn : "volume"
		quantity volumn : "quantity"
		equipment column : "equipment"
		equipment cascade : "none"
		//receipt cascade:"none"
		companyId column : "company_id"
		dimWeight column : "dim_weight"
		timeOfDeparture : "time_of_departure"
		timeOfArrival : "time_of_arrival"
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
	}
	
	

	// Constraints
	static constraints = {
		price(nullable:true)
		asnNo(nullable:true)
		masterBOL(nullable:true)
		trailerId(nullable:true)
		tractorId(nullable:true)
		sealNumber(nullable:true)
		tempCtrl(nullable:true)
		isPerish(nullable:true)
		shipDestination(nullable:true)
		expectedShippingDate(nullable:true)		// the date the origin expects to shRCip the goods (required)
		expectedDeliveryDate(nullable:true)
		equipment(nullable:true)
		carrierPrice(nullable:true)
		asnNo(nullable:true, maxSize: 255)
		shipDestination(nullable:false)
		origin(nullable:false)
		additionalInformation(nullable:true, maxSize: 2147483646)
		carrierCompany(nullable:true)
		dateCreated(nullable:true)
		lastUpdated(nullable:true)
		//weightUnits(nullable:true)
		//destination(nullable:true)
		billTo (nullable:true)
		businessUnit (nullable:true)
		companyId(nullable:true)
		//receipt(nullable:true)
		weight(nullable:true)
		volume(nullable:true)
		quantity(nullable:true)
		dimWeight(nullable:true)
		origin(nullable:true)
		pc(nullable:true)
		deliveryEnd(nullable:true)
		deliveryStart(nullable:true)
		pickupEnd(nullable:true)
		pickupStart(nullable:true)
		createdBy (nullable:true)
		modifiedBy (nullable:true)
		createdDttm (nullable:true)
		modifiedDttm (nullable:true)
	
	}
	
	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date =new Date()
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
