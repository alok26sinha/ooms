/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.order


import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.ShipmentItem
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User;

// import java.util.Date

class OrderItem implements Serializable {
	
	String id
	String description	
	Product product
	Location origin
	Location destination
	int lineNum
	
	Float quantity
	Float weight
	Float volume
	Float size4
	Float size5
	
	// Audit fields
	Date dateCreated
	Date lastUpdated
	boolean deleted
   
	Constants pc
	Constants quantityUom
	Constants weightUom
	Constants volumeUom
	Constants size4Uom
	Constants size5Uom
	
	Float pricePerUom
	Constants priceCurrency
	
	
		
	static mapping = {
		id generator: 'uuid'
		table "`order_item`"
		origin column : "origin"
		destination column : "destination"
		pc column : "pc"
		quantityUom column : "quantity_uom"
		weightUom column : "weight_uom"
		volumeUom column : "volume_uom"
		size4Uom column : "size4_uom"
		size5Uom column : "size5_uom"
		pricePerUom column : "price_per_uom"
		priceCurrency column : "price_currency"
		lineNum column : "line_num"
		version false
		destination cascade : "none"
		origin cascade : "none"
		product cascade : "none"
		size4Uom cascade : "none"
		size5Uom cascade : "none"
		pc cascade : "none"
		priceCurrency cascase : "none"
	}
	
	static transients = ['deleted']
	
	static belongsTo = [ order : Order ]
	
	

    static constraints = {
    	description(nullable:true)
		product(nullable:true)
		
		origin (nullable:true)
		destination(nullable:true)
		pricePerUom(nullable:true)
		priceCurrency(nullable:true)
		pc(nullable:true)
		
		quantity(nullable:true)
		weight(nullable:true)
		volume(nullable:true)
		size4(nullable:true)
		size5(nullable:true)
		quantityUom(nullable:true)
		weightUom(nullable:true)
		volumeUom(nullable:true)
		size4Uom(nullable:true)
		size5Uom(nullable:true)
		
	}

	

	def totalPrice() { 
		
		return ( quantity ? quantity : 0.0 ) * ( unitPrice ? unitPrice : 0.0 );
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + (deleted ? 1231 : 1237);
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result
				+ ((destination == null) ? 0 : destination.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((lastUpdated == null) ? 0 : lastUpdated.hashCode());
		result = prime * result + ((origin == null) ? 0 : origin.hashCode());
		result = prime * result + ((pc == null) ? 0 : pc.hashCode());
		result = prime * result
				+ ((priceCurrency == null) ? 0 : priceCurrency.hashCode());
		
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result
				+ ((quantity == null) ? 0 : quantity.hashCode());
		
		
		result = prime * result + ((size4Uom == null) ? 0 : size4Uom.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItem other = (OrderItem) obj;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (deleted != other.deleted)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (destination == null) {
			if (other.destination != null)
				return false;
		} else if (!destination.equals(other.destination))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (lastUpdated == null) {
			if (other.lastUpdated != null)
				return false;
		} else if (!lastUpdated.equals(other.lastUpdated))
			return false;
		if (origin == null) {
			if (other.origin != null)
				return false;
		} else if (!origin.equals(other.origin))
			return false;
		if (pc == null) {
			if (other.pc != null)
				return false;
		} else if (!pc.equals(other.pc))
			return false;
		if (priceCurrency == null) {
			if (other.priceCurrency != null)
				return false;
		} else if (!priceCurrency.equals(other.priceCurrency))
			return false;
		
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		
		if (size4Uom == null) {
			if (other.size4Uom != null)
				return false;
		} else if (!size4Uom.equals(other.size4Uom))
			return false;
		return true;
	}
			
	
	
	
}
