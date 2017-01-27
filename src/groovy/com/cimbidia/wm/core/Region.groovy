package com.cimbidia.wm.core;

public enum Region {
	
	AMERICAS("AMERICAS"),
	EMEA("EMEA")
	
	
	String id
	Region(String id) 
	{ 
		this.id = id
	}
	
	static list() {
		[AMERICAS,EMEA]
	}
	

}
