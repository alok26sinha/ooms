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

import com.cimbidia.wm.order.DeliveryStatus;
import com.cimbidia.wm.core.User;

import com.cimbidia.wm.product.Product;
import com.cimbidia.wm.product.Category;
import com.cimbidia.wm.shipment.Shipment;


class CustomerOrderDelivery implements Serializable {

	String id
	String description
	Category category
	DeliveryStatus status
	Product product
	
	Integer deliveryQuantity
	Float size1
	Float size2
	Float size3
	User requestedBy	// the person who actually requested the item
	Date pickupDt
	Date deliveryDt
	
	
	// Audit fields
	Date dateCreated
	Date lastUpdated

	static mapping = {
		id generator: 'uuid'
		table "order_delivery"
	}
	
	static transients = [ "orderItemType" ]
	
	static belongsTo = [ order : CustomerOrder ]
	
	static hasMany = [ orderDeliveryShipments : CustomerOrderDeliveryShipment]

	static constraints = {
		status(nullable:true)
		description(nullable:true)
		category(nullable:true)
		product(nullable:true)
		//inventoryItem(nullable:true)
		requestedBy(nullable:true)
		deliveryQuantity(nullable:false, min:1)
		size1(nullable:true)
		size2(nullable:true)
		size3(nullable:true)
		pickupDt(nullable:true)
		deliveryDt(nullable:true)
	}

	
	String getOrderItemType() {
		return (product)?"Product":(category)?"Category":"Unclassified"
	}

}
