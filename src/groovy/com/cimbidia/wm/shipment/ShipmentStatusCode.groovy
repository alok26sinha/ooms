/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.shipment

public enum ShipmentStatusCode {

	CREATED(0),
	PENDING(1),
	SHIPREADY(2),
	SHIPPED(3),
	RECEIVED(4)
	
	int sortOrder

	ShipmentStatusCode(int sortOrder) { [ this.sortOrder = sortOrder ] }
	
	static int compare(ShipmentStatusCode a, ShipmentStatusCode b) {
		return a.sortOrder <=> b.sortOrder
	}
	
	static list() {
		[ CREATED, PENDING, SHIPREADY, SHIPPED, RECEIVED ]
	}
	
	
	String getName() { return name() }
	
	String toString() { return name() }
}