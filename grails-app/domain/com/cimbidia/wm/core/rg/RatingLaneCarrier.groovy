package com.cimbidia.wm.core.rg

import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Mot

class RatingLaneCarrier {

	String id
	//RatingLane ratingLane
	Mot mot	
	Equipment equipment
	Constants tempCtrl
	Constants serviceLevel
	
	Company carrier
	Company secondaryCarrier
	String contractNumber
	
	//rate Fields
	Float rate
	Float minRate
	Constants rateType
	Constants rateUnit
	Constants currency
	Constants tariff
	Float minDistance
	Boolean supportsMultiStop
	Constants payee
	Boolean surgeRate
	Constants frequency
	Constants modifReasonCode
	String comments
	Float cost
	Float totalCost
	
	List ratingLaneAccessorialList
	List ratingLaneltlRatesList
	
	static 	belongsTo = [ ratingLane: RatingLane ]
	
	static mapping = {
		id generator: 'uuid'
		ratingLaneAccessorialList lazy : true
		ratingLaneAccessorialList cascade: "all-delete-orphan, save-update"
		ratingLaneltlRatesList lazy : true
		ratingLaneltlRatesList cascade: "all-delete-orphan, save-update"
		//cache false
		ratingLane cascade: "all-delete-orphan, save-update"
	}

	static hasMany = [
		ratingLaneAccessorialList : RatingLaneAccessorial,
		ratingLaneltlRatesList : RatingLaneLtlRates
	]
	
	static transients = ["cost","totalCost"]
	
	static constraints = {
		carrier(nullable:false)
		mot(nullable:true)	
		equipment(nullable:true)
		rateType(nullable:true)
		tempCtrl(nullable:true)
		serviceLevel(nullable:true)
		cost bindable:true
		totalCost bindable:true

		secondaryCarrier(nullable:true)
		contractNumber(nullable:true)
		minRate(nullable:true)
		rateUnit(nullable:true)
		tariff(nullable:true)
		minDistance(nullable:true)
		supportsMultiStop(nullable:true)
		payee(nullable:true)
		surgeRate(nullable:true)
		frequency(nullable:true)
		modifReasonCode(nullable:true)
		comments(nullable:true)
		
	}
	
}
