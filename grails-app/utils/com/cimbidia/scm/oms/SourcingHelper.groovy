package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company;
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.LocationType;
import com.cimbidia.wm.customerOrder.CustomerOrderItem;
import com.cimbidia.wm.product.Category;
import com.cimbidia.wm.product.Product;
import com.cimbidia.wm.product.ProductClass;

class SourcingHelper {
	
	
	SourcingRuleHdr hdr 
	CustomerOrderItem custItem
	Location source
	boolean isAllocated = false
	SourcingHelper(CustomerOrderItem custItem){
		this.custItem = custItem
		
		if(hdr == null){
			hdr = new SourcingRuleHdr();
		}
		hdr.company =  Company.findById(custItem.order.companyId);
		//todo
		//hdr.fulfillmentType = custItem.order.fulfillmentType
		//hdr.seller = 
		hdr.customer =  custItem.order.customer
		hdr.toLocation = custItem.order.destination
		hdr.product = custItem.product
		//hdr.toAddressGeoRegion
		//hdr.productClass = custItem.pc
		//hdr.category = custItem.
		//hdr.locationType = custItem.destination.locationType 
		
		
	}
	
	
}
