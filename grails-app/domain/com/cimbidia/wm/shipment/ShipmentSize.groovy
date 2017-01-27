package com.cimbidia.wm.shipment

import com.cimbidia.scm.constants.Constants;

import com.cimbidia.wm.shipment.Shipment;

class ShipmentSize {
	String id
	String quantity
	Constants uom
	static belongsTo = [ shipment : Shipment ]
	
	static mapping = {
		id generator: 'uuid'
		//table "`shipment_size`"
		uom column : "uom"
		uom cascade : "none"
		
	}
	static constraints = {
		uom(nullable:false, blank: false)
	}
}