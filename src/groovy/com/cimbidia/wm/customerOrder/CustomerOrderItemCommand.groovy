/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.customerOrder

import org.codehaus.groovy.grails.validation.Validateable
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.ShipmentItem

import com.cimbidia.wm.order.OrderItem;

// import java.io.Serializable;

@Validateable
class CustomerOrderItemCommand  implements Serializable {

	Boolean primary
	OrderItem orderItem
	Shipment shipment
	ShipmentItem shipmentItem
	
	// from order item
	String type
	String description
	Integer quantityOrdered
	
	// for shipment item
	String lotNumber
	Date expirationDate
	Product productReceived
	Integer quantityReceived	
		
	static constraints = {
		productReceived(nullable:false)
	}
	
}

