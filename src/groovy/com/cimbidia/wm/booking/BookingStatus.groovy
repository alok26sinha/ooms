/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 

package com.cimbidia.wm.booking

public enum BookingStatus {
	
	NEW("NEW",0),
	REQUESTED("REQUESTED",1),
	CONFIRMED("CONFIRMED",2),
	AMMENDED("AMMENDED",3),
	REJECTED("REJECTED",4),
	INTRANSIT("INTRANSIT",5),
	DELIVERED("DELIVERED",6)	
	String name
	int sortOrder

	BookingStatus(String name, int sortOrder) { 
	 this.sortOrder = sortOrder 
	 this.name = name
 }
	
	static int compare(BookingStatus a, BookingStatus b) {
		return a.sortOrder <=> b.sortOrder
	}

	
	static list() {
		[NEW,REQUESTED,CONFIRMED,REJECTED,INTRANSIT,DELIVERED]
	}

	String toString() { 
	return name }
}
