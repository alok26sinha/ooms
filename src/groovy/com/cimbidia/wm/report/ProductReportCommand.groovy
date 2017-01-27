/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.report


import com.cimbidia.wm.product.Product

import com.cimbidia.wm.core.Location;

class ProductReportCommand {

	Product product
	Location location;
	Date startDate;
	Date endDate;	
	
	Integer quantityInitial
	Integer quantityFinal

	
	List<ProductReportEntryCommand> productReportEntryList = []
			
	static constraints = {
		product(nullable:false)
		location(nullable:false)
		startDate(nullable:true)
		endDate(nullable:true)
		quantityInitial(nullable:true)
		quantityFinal(nullable:true)
	}
}