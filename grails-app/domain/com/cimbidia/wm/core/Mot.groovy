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



class Mot {
	
	String id
	String code
	String description
	Integer sortOrder
	Integer maxWt
	
	static final int TRUCKLOAD = 11
	static final int LESS_THAN_TRUCKLOAD = 12
	static final int INTERMODAL = 14
	static final int OCEAN = 15
	static final int AIR = 16
	static final int LESS_THAN_CONTAINERLOAD = 17
	
	//TODO fetch from mot 
	static final float MAX_PCL_WT=15
	//TODO fetch from equipment table
	static final float MAX_EQP_WT=45000
	static final float MAX_EQP_VOL=3500
	static final float MAX_EQP_QTY=26
	static final float MIN_PERC=0.85
	
	static final String TL = "TL"
	static final String LTL = "LTL"
	static final String IM = "IM"
	static final String OCN = "FCL"
	static final String LCL = "LCL"
	static final String AIRCD = "AIR"

	
	static constraints = {
		description{nullable: true}
		sortOrder{nullable: true}
		maxWt{nullable: true}
	}
	static mapping = {
		version false
		table : "`mot`"
		code column : "code"
		description : "description"
		sortOrder	: "sort_order"
		maxWt		: "max_wt"
	  }
	
	String toString()
	{
		return description
	}
}
