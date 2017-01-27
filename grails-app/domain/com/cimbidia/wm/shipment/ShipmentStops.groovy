package com.cimbidia.wm.shipment

import com.cimbidia.wm.core.Address;

class ShipmentStops {
	
	String id
	int stopNumber
	//String stop
	Date estdArrival
	Date estdDeparture
	Date actualArrival
	Date actualDeparture
	Date plannedArrival
	Date plannedDeparture
	String stopAction
	Date apptDate
	String comments
	Address address
	Shipment shipment
	
	static belongsTo = [ shipment : Shipment ]
	
	static mapping = {
		id generator: 'uuid'
		//shipmentId column : 'shipment_id'
		//shipmentId cascade : 'none'
		sort stopNumber:"asc"
		actualArrival column : "actual_arrival"
	}
    static constraints = {
		//address(nullable: true)
		plannedArrival(nullable: true)
		plannedDeparture(nullable: true)
		actualArrival(nullable: true)
		actualDeparture(nullable: true)
		apptDate(nullable: true)
		comments(nullable: true)
		estdArrival(nullable: true)
		estdDeparture(nullable: true)
    }
}
