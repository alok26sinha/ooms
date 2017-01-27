package com.cimbidia.scm.admin

class Groups {

	String id
	String name;
	String description
	
    static constraints = {
    }
	
	static mapping = {
		id generator: 'uuid'
	}
}
