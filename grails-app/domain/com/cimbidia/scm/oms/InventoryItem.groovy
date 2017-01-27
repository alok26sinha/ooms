package com.cimbidia.scm.oms

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.product.Product

class InventoryItem {
	Company company
	Location location
	Product product
	
	@Override
	public boolean equals(Object obj) {
		if(obj !=null )
		{
			InventoryItem inv  = (InventoryItem)obj
			
			return this?.company?.id.equals(inv?.company?.id) && this?.product?.id.equals(inv?.product?.id) && this?.location?.id.equals(inv?.location?.id);
		}
		else {
			return false;
		}
	}
	
	int hashCode() {
		return this.company.id;
	}
}
