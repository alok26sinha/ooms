package com.cimbidia.scm.admin


import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.shipment.CarrierMot

class Company {
	Integer id
	Integer parentCompanyId
	String companyName
	String description
	Constants type
	String contactName
	String contactAddress1
	String contactAddress2
	String contactPhone
	String contactEmail
	String contactState
	String contactZip
	String contactCountry
	String logo
	Date createdDttm
	Date lastUpdatedDttm
	
	List carrierMots
	
	static hasMany = {carrierMots : CarrierMot}
	
	static mapping = {
		id generator: 'assigned'
		type column : "type"
	  }
	def beforeInsert() {
		
		createdDttm = new Date()
		lastUpdatedDttm = new Date()
	}
    static constraints = {
		createdDttm(nullable:true,blank: false)
		lastUpdatedDttm(nullable:true,blank: false)
		logo(nullable:true)
		
    }
    String toString() {
    	return companyName
    }
}
