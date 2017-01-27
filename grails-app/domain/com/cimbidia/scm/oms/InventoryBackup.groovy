package com.cimbidia.scm.oms

import java.util.Date;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.product.Product

class InventoryBackup {
 String id
 Company company
 Product product 
 Location location
 Double quantity
 Double safetyStock
 Double allocQty
 Double availQty
 Double delta

 InventoryStatus inventoryStatus
 User createdBy
 User modifiedBy
 Date createdDttm
 Date modifiedDttm

 
 static mapping = {
	 id generator: 'uuid'
	 table "`inventory`"
	 createdBy column : "created_by"
	 modifiedBy column : "modified_by"
	 createdDttm column : "created_dttm"
	 modifiedDttm column : "modified_dttm"
	 inventoryStatus column : "inventory_status"

	 availQty formula: "quantity - alloc_qty"
	 delta formula:"quantity - alloc_qty - safety_stock"
   }
 def beforeInsert() {
	 
	 createdDttm = new Date()
	 modifiedDttm = new Date()
 }
 def beforeUpdate(){
	 modifiedDttm = new Date()
 }
 static constraints = {
	 
	 createdBy(nullable:true,blank: false)
	 modifiedBy(nullable:true,blank: false)
	 createdDttm(nullable:true,blank: false)
	 modifiedDttm(nullable:true,blank: false)
	 
	 
 }
 @Override
	public boolean equals(Object obj) {
		
		return (this.product.id.equals(obj.product.id) && this.location.id.equals(object.location.id)) ;
	}
}
