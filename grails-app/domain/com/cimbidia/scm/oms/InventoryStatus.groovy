package com.cimbidia.scm.oms

class InventoryStatus {
	String id
	String inventoryStatus
	String description
	String supplyType
	
	static mapping = {
		
			version false
		
		}
	@Override
	public String toString() {
	
		return inventoryStatus.toString();
	}
}
