/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core

public enum OrderSizes {

	SIZE1('size1', 1),
	SIZE2('size2', 2),
	SIZE3('size3', 3)
	
	int sortOrder
	String name
	
	OrderSizes(String name, int sortOrder) {  
		this.name = name
		this.sortOrder = sortOrder  }

	static int compare(OrderSizes a, OrderSizes b) {
		return a.sortOrder <=> b.sortOrder
	}

	static list() {
			[ SIZE1, SIZE2, SIZE3]
		}
		
	String toString() { return this.name }
	
}
