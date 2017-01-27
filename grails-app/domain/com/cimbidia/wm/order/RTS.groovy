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

import java.util.Date;

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.core.Mot;
import com.cimbidia.wm.product.Product;
import com.cimbidia.wm.product.Category;


class RTS implements Serializable {

	String id
	String description
	
	Product product
	
	Location origin
	Location destination
	int orderLineNum
	
	boolean deleted
   
	Constants pc
	Constants quantityUom
	Constants weightUom
	Constants volumeUom
	
	Constants rtsSize4Uom
	Constants rtsSize5Uom
	Integer companyId
	Integer bu
	String orderNumber

	Constants incoterm
	Mot mot
	Constants transResp
	
	Company carrier
		
	boolean mst
	Address fromAddress
	Address toAddress
	
	Float rtsQuantity
	Float rtsWeight
	Float rtsVolume
	Float rtsSize4
	Float rtsSize5
	
	Date pickupStart
	Date pickupEnd
	
	Date deliveryStart
	Date deliveryEnd
	// Audit fields
	Date dateCreated
	Date lastUpdated

	static mapping = {
		
		id generator: 'uuid'
		table "rts"
		//version false
		carrier column:"carrier"
		fromAddress column:"from_address"
		toAddress column:"to_address"
		incoterm column:"incoterm"
		mot column:"mot"
		transResp column:"trans_resp"
		quantityUom column:"quantity_uom"
		weightUom column:"weight_uom"
		volumeUom column:"volume_uom"
		rtsSize4Uom column:"rts_size4_uom"
		rtsSize5Uom column:"rts_size5_uom"
		pc column:"pc"
		orderLineNum column:"order_line_number"
		
	}
	
	static transients = ['deleted']
	
	static belongsTo = [ order : Order ]

	static constraints = {
		description(nullable:true)
		
		product(nullable:true)
		
		rtsQuantity(nullable:false, min:1.0F)
		rtsWeight(nullable:true)
		rtsVolume(nullable:true)
		rtsSize4(nullable:true)
		rtsSize5(nullable:true)
		
		pickupStart(nullable:true)
		pickupEnd(nullable:true)
		origin(nullable:true)
		destination(nullable:true)
		
		
		orderLineNum(nullable:true)
		pc(nullable:true)
		quantityUom(nullable:true)
		weightUom(nullable:true)
		volumeUom(nullable:true)
		rtsSize4Uom(nullable:true)
		rtsSize5Uom(nullable:true)
		
		orderNumber(nullable:true)
		incoterm(nullable:true)
		mot(nullable:true)
		transResp(nullable:true)
		carrier(nullable:true)
		fromAddress(nullable:true)
		toAddress(nullable:true)
		
		rtsQuantity validator: { value, rts, errors ->
			if ( (value==null || value ==0) && (rts.rtsWeight==null || rts.rtsWeight==0) && (rts.rtsVolume=null|| rts.rtsVolume==0)) {
				
				errors.rejectValue( "Quantity ", "rts.quantity", "Enter either Qty or Weight or Volume.")
				return false
			}
			 
			return true
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((lastUpdated == null) ? 0 : lastUpdated.hashCode());
		result = prime * result
				+ ((pickupEnd == null) ? 0 : pickupEnd.hashCode());
		result = prime * result
				+ ((pickupStart == null) ? 0 : pickupStart.hashCode());
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result
				+ ((rtsQuantity == null) ? 0 : rtsQuantity.hashCode());
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
		RTS other = (RTS) obj;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
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
		if (pickupEnd == null) {
			if (other.pickupEnd != null)
				return false;
		} else if (!pickupEnd.equals(other.pickupEnd))
			return false;
		if (pickupStart == null) {
			if (other.pickupStart != null)
				return false;
		} else if (!pickupStart.equals(other.pickupStart))
			return false;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		if (rtsQuantity == null) {
			if (other.rtsQuantity != null)
				return false;
		} else if (!rtsQuantity.equals(other.rtsQuantity))
			return false;
		return true;
	}

	
	
}
