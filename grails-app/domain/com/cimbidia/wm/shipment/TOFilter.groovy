package com.cimbidia.wm.shipment

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Location

class TOFilter {
	String id
	Company companyId
	String filterName
	Integer isPublic
	String userId
	Integer showOnDashboard
	Location origin
	String toStatus
	Location destination
	Shipment shipment
	//static belongsTo = [shipment:Shipment]
	
    static constraints = {
		shipment(nullable:true)
		origin(nullable:true)
		destination(nullable:true)
		toStatus(nullable:true)
    }
	static mapping = {
		id generator: 'uuid'
		table "`to_filter`"
		companyId column : "company_id"
		origin column : "origin_id"
		toStatus column : "status"
		destination column : "destination_id"
		userId column : "user_id"
    }
}
