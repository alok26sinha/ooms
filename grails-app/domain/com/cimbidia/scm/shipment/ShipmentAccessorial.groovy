package com.cimbidia.scm.shipment

import com.cimbidia.wm.core.rg.Accessorial
import com.cimbidia.wm.core.rg.RatingLaneCarrier;
import com.cimbidia.wm.shipment.Shipment

class ShipmentAccessorial {
 String id
 Shipment shipment
 Accessorial accessorial
 Float rate
 RatingLaneCarrier ratingLaneCarrier
 static mapping = {
	id generator: 'uuid'
 }
 
}
