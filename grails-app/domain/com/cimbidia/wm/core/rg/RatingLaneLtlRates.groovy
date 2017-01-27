package com.cimbidia.wm.core.rg

import java.util.Date;

import com.cimbidia.wm.core.User;
import com.cimbidia.wm.auth.AuthService
class RatingLaneLtlRates {

	@Override
	public String toString() {
		return  "Class:"+ltlClass + ", Zone:" + zone	+ ", Rate:" + rate+ ", From Zone:" + fromZone+ ", to Zone:" + toZone ;
	}
	String id
	//RatingLaneCarrier ratingLaneCarrier
	Double ltlClass
	String zone 
	Double rate
	String fromZone
	String toZone 
	User createdBy
	User modifiedBy
	Date createdDttm
	Date modifiedDttm
	Integer version
	static 	belongsTo = [ ratingLaneCarrier: RatingLaneCarrier ]
    static constraints = {
		
		createdDttm(nullable:true,display:false)
		modifiedDttm(nullable:true,display:false)
		createdBy(nullable:true, display:false)
		modifiedBy(nullable:true, display:false)
		fromZone(nullable:true)
		toZone(nullable:true)
    }
	
	static mapping = {
		id generator: 'uuid'
		createdBy column : "created_by"
		modifiedBy column : "modified_by"
		createdDttm column : "created_dttm"
		modifiedDttm column : "modified_dttm"
		ratingLaneCarrier cascade: "all-delete-orphan, save-update"
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
