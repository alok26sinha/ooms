package com.cimbidia.wm.booking

import java.text.SimpleDateFormat
import com.cimbidia.wm.shipment.TrackingMessage
import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.product.ProductClass

import com.cimbidia.wm.shipment.Shipper
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User
import com.cimbidia.wm.util.DateUtil
import org.apache.commons.collections.Factory;
import org.apache.commons.collections.ListUtils;

class Booking {

	def beforeInsert = {
		def user = AuthService.currentUser.get()
		def date = DateUtil.getTodaysDate()
		createdBy = user
		dateCreated = date
		updatedBy = user
		lastUpdated = date
		println "user.companyId="+user.companyId
		if(user.companyId)
			companyId = user.companyId
		
	}
	def beforeUpdate ={
		updatedBy = AuthService.currentUser.get()
		lastUpdated = DateUtil.getTodaysDate()
	}

	String id
    String bookingNumber
	BookingStatus bookingStatus
	Location shipFrom
	Location shipTo
	Company carrier
	Location originPort
	Location destinationPort
	Date earliestDepartureDate
	Date mustArriveByDate
	Boolean hazmat
	Constants productClass
	Constants unCode
	Constants incoterms
	Company supplier
	Company shipper
	Company customer
	Company consignee
	Company bookingAgent
	Constants specialHandling
	String comments
	String bookingForecastId
	
	//Confirmation fields
	String bookingConfirmationNumber 
	String vessel
	String voyageNumber 
	Date plannedDepartureDate 
	Date plannedArrivalDate
	Date closingDate 
		
	Integer companyId
	
	//child tables
	List bookingShipmentList
	List bookingEquipmentList
	List referenceList
	List  trackingMsgs 
	
	// Auditing
	Date dateCreated
	Date lastUpdated
	User createdBy
	User updatedBy
	

	static mapping = {
		id generator: 'uuid'
		//cache true
		trackingMsgs sort: 'createdDate', order: 'asc'
		referenceList cascade: "all-delete-orphan, save-update"
		bookingEquipmentList cascade: "all-delete-orphan, all"
		bookingShipmentList cascade: "all-delete-orphan, all"
		trackingMsgs cascade :"all-delete-orphan, all"
	}

	static constraints = {
		bookingNumber(nullable :false, blank: false)
		bookingStatus(nullable:false)
		shipFrom(nullable:false, blank:false)
		shipTo(nullable:false, blank:false)
		carrier(nullable:false, blank:false)
		originPort(nullable:false, blank:true)
		destinationPort(nullable:false, blank:true)
		earliestDepartureDate(nullable:true, validator: { val, obj ,errors-> 
												if(!val && !obj.mustArriveByDate){ 
													errors.rejectValue('earliestDepartureDate','booking.earliestDepartureDate.eitherDateNotNull','Either Earliest departure date or Must Arrive By date should be specified');
													return ['booking.earliestDepartureDate.eitherDateNotNull']
												} })
		mustArriveByDate(nullable:true)
		hazmat(nullable:true)
		productClass(nullable:true, validator: { val, obj ,errors-> 
												if(obj.hazmat && !val){ 
													errors.rejectValue('productClass','booking.productClass.blankForHazmat','Product class must be specified for Hazardous material');
													return ['booking.productClass.blankForHazmat']
												} })
		unCode(nullable:true, validator: { val, obj ,errors-> 
												if(obj.hazmat && !val){ 
													errors.rejectValue('unCode','booking.unCode.blankForHazmat','UN Code must be specified for Hazardous material');
													return ['booking.productClass.blankForHazmat']
												} })
		incoterms(nullable:true, blank:false)
		supplier(nullable:true)
		shipper(nullable:true)
		customer(nullable:true)
		carrier(nullable:true)
		consignee(nullable:true)
		bookingAgent(nullable:true)
		specialHandling(nullable:true)
		comments(nullable:true)
		bookingForecastId(nullable:true, display:false)
		
		bookingConfirmationNumber (nullable:true)
		voyageNumber (nullable:true)
		vessel(nullable:true)
		closingDate (nullable:true)
		plannedDepartureDate (nullable:true)
		plannedArrivalDate(nullable:true)
		companyId(nullable:true,display:false)
		
		dateCreated(nullable:true,blank: false,display:false)
		lastUpdated(nullable:true,blank: false,display:false)
		createdBy(nullable:true,blank: false,display:false)
		updatedBy(nullable:true,blank: false,display:false)
	}
	
    static hasMany = [
		bookingShipmentList: BookingShipment,
    	bookingEquipmentList: BookingEquipment,
    	referenceList: BookingReference,
		trackingMsgs : TrackingMessage,
    ]
	
	String toString()
	{
		println "intostring" +id+
		"bookingNumber=" + this.bookingNumber + "bookingEquipmentList size="+ this.bookingEquipmentList?.size() + "bookingShipmentList size="+ this.bookingShipmentList?.size() + "referenceList size=" + this.referenceList?.size() 
	}
	

}
