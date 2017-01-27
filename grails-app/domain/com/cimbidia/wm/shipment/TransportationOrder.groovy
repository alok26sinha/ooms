package com.cimbidia.wm.shipment

import java.util.Date;
import java.util.List;
import java.util.SortedSet;

import com.cimbidia.scm.admin.Company;
import com.cimbidia.scm.constants.Constants;
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Mot

import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.core.User
import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.receiving.Receipt;
import com.cimbidia.wm.shipment.Shipment
class TransportationOrder {
	
	
	String id
	String toNumber
	String toStatus
	Float weight
	Float volume
	Float quantity
	Float dimWeight
	//String weightUnits
	//String shipmentId
	// Audit fields
	Date dateCreated
	Date lastUpdated
	
	
	//String orderNumber
	Constants productClass
	String poNumber
	String poId
	String coNumber
	String coId
	Location origin
	Location destination			// the location from which the shipment will depart
	//Location shipDestination			// the location to which the shipment will arrive
	Date pickupStart
	Date pickupEnd
	//String timeOfDeparture
	//String timeOfArrival
	//Company billTo
	Date deliveryStart
	Date deliveryEnd
	Mot mot
	Company bu
	Company companyId  
	Constants incoterm
	Constants transResp
	boolean mst
	Address fromAddress
	Address toAddress
	int orderLineNum
	Company carrier
	
	static mapping = {
		id generator: 'uuid'
		toStatus column : "status"
		origin column : "origin_id"
		origin cascade : "none"
		mot column : "mot"
		mot cascade : "none"
		bu column : "bu"
		fromAddress column:"from_address"
		toAddress column:"to_address"
		incoterm column:"incoterm"
		incoterm cascade : "none"
		transResp column:"trans_resp"
		transResp cascade : "none"
		orderLineNum column:"order_line_number"
		productClass column : "product_class"
		productClass cascade : "none"
		destination column : "destination_id"
		destination cascade : "none"
		poNumber column : "po_number"
		carrier column : "carrier"
		weight column : "weight"
		//weightUnits column : "weight_units"
		companyId column : "company_id"
		volume column : "volume"
		quantity column : "quantity"
		dimWeight column : "dim_weight"
	}
	
	static transients = []
	
	static belongsTo = [shipment:Shipment]
	
	
	static constraints = {
		
		carrier(nullable:true)
		weight(nullable:true)
		volume(nullable:true)
		quantity(nullable:true)
		mst (nullable:true)
		fromAddress (nullable:true)
		toAddress (nullable:true)
		pickupStart (nullable:true)
		pickupEnd  (nullable:true)
		deliveryStart (nullable:true)
		deliveryEnd  (nullable:true)
		bu (nullable:true)
		companyId (nullable:true)
		mot(nullable:true)
		shipment(nullable:true)
		companyId(nullable:true)
		dimWeight(nullable:true)
		origin(nullable:true)
		destination(nullable:true)
		productClass(nullable:true)
		poId(nullable:true)
		poNumber(nullable:true)
		coNumber(nullable:true)
		coId(nullable:true)
	}
	
	
	
	
	Boolean isPartiallyFulfilled() {
		return quantityFulfilled() > 0 && quantityFulfilled() < quantity;
	}
	
	Boolean isCompletelyFulfilled() {
		return quantityFulfilled() >= quantity;
	}
	
	Boolean isPending() {
		return !isCompletelyFulfilled()
	}
	
	
	
	
	public static List uniqueTOByPONumber() {
		TransportationOrder.withCriteria {
			projections {
				distinct "poNumber"
				 
			}
		}.sort()
	}
	
	
}
