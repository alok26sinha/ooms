package com.cimbidia.scm.admin

import com.cimbidia.wm.core.User

class UserGroup {

	String id
	Groups groups
	User user
	
    static constraints = {
    }
	static mapping= {
		id generator: 'uuid'
		groups cascade : "none"
		user cascade : "none"
	}
}
