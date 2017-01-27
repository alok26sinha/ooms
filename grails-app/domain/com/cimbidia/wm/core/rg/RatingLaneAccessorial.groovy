package com.cimbidia.wm.core.rg
import com.cimbidia.scm.constants.Constants

class RatingLaneAccessorial {

   	String id
	//RatingLaneCarrier ratingLaneCarrier
	Accessorial accessorial
	Float rate
	Constants payee
	Float minRate
	Float minQty
	Float maxQty
	Boolean autoApprove
	Boolean isBookingAccessorial
	Date effectiveDate
	Date expirationDate
	Float cost
	
	static belongsTo = [ ratingLaneCarrier: RatingLaneCarrier ]
	
	static mapping = {
		id generator: 'uuid'
		cache false
		
	}
	
	static transients = ["cost"]
	
	static constraints = {
		accessorial(nullable:false)
		rate(nullable:false)
		payee(nullable:true)
		minRate(nullable:true)
		minQty(nullable:true)
		maxQty(nullable:true)
		effectiveDate(nullable:true)
		expirationDate(nullable:true)
	 }
}
