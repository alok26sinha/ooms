package com.cimbidia.wm.booking

class BookingReference {

	String id
	String referenceType
	String referenceNumber

	static mapping = {
		id generator: 'uuid'
		cache true
	}

	static belongsTo = [ booking: Booking ]
	
	static constraints = { 
		referenceType(nullable :false)
		referenceNumber(nullable :false)
	}
}