package com.cimbidia.wm.booking

import com.cimbidia.wm.shipment.Shipment
class BookingShipment {

   
	

	String id;
	//String bookingId;
	Shipment shipment;
	Integer version;
	
	static mapping = {
		id generator: 'uuid'
		cache true
	}
	static belongsTo = [ booking: Booking ]
	
	static constraints = {
		//bookingId(nullable:false)
		//shipmentId(nullable:false)
		
	}
	
	@Override
	public String toString() {
		return "BookingShipment [id=" + id + ", shipment=" + shipment
				+ ", version=" + version + "]";
	}
}
