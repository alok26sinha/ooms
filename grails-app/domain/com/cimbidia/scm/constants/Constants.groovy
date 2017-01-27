package com.cimbidia.scm.constants

class Constants {
	int id
	String type
	String code
	String name
	String description
	Integer sortOrder
	
	//TODO, load value on startup
	static final String WT_UOM_Code="lbs"
	static final String VOL_UOM_Code="cu.ft."
	static final String QTY_UOM_Code="pallets"
	static final String TO_STATUS_PLANNED="Planned"
	
    static constraints = {
		description{nullable: true}
		sortOrder{nullable: true}
    }
	static mapping = {
		version false
	  }
	  
	  String toString()
	  {
	  	code + "-" + name
	  }
}
