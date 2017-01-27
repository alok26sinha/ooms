package com.cimbidia.wm.booking

class BookingParty {

	String id
	String partyId
	String partyType
	String comments

	static mapping = {
		id generator: 'uuid'
		cache true
	}

	static belongsTo = [ booking: Booking ]
	
	static constraints = { 
		partyId(nullable :false)
		partyType(nullable :false)
	}
}