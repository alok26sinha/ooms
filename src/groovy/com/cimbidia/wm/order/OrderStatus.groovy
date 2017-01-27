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

public enum OrderStatus {
	PENDING(0),
	NEW(1),
	RELEASED(2),
	OPEN(3),
	COUNTERED(4),
	REJECTED(5),
	IN_PROCESSING(6),
	IN_TRANSIT(7),
	PARTIALLY_IN_TRANSIT(8),
	INVOICED(9),
	APPROVED_FOR_PAYMENT(10),
	PAID(11),
	PARTIALLY_RECEIVED(12),
	RECEIVED(13),
	CANCELLED(14)
	int sortOrder

	OrderStatus(int sortOrder) { [ this.sortOrder = sortOrder ] }
	
	static int compare(OrderStatus a, OrderStatus b) {
		return a.sortOrder <=> b.sortOrder
	}
	
	static list() {
		[ PENDING, NEW, RELEASED, OPEN, IN_PROCESSING, IN_TRANSIT, PARTIALLY_IN_TRANSIT, INVOICED, APPROVED_FOR_PAYMENT, PAID, COUNTERED, REJECTED, PARTIALLY_RECEIVED, RECEIVED, CANCELLED ]
	}
	
	String toString() { return name() }
	
}
