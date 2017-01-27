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

public enum CustomerOrderStatus {
	
	NEW(1),
	ACKNOWLEDGED(2),
	COMMITTED(3),
	READY_FOR_FULFILLMENT(4),
	ALLOCATED(5),
	BACKORDERED(6), 
	CANCELLED(7),
	RELEASED(8)
	int sortOrder

	CustomerOrderStatus(int sortOrder) { [ this.sortOrder = sortOrder ] }
	
	static int compare(CustomerOrderStatus a, CustomerOrderStatus b) {
		return a.sortOrder <=> b.sortOrder
	}
	
	static list() {
		[NEW, ACKNOWLEDGED, COMMITTED, READY_FOR_FULFILLMENT, ALLOCATED, BACKORDERED, CANCELLED,RELEASED]
	}
	
	String toString() { return name() }
	
}
