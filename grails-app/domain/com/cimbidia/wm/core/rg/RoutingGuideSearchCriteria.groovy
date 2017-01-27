package com.cimbidia.wm.core.rg

import java.util.List;

import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Address;
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.Mot
import com.cimbidia.wm.auth.AuthService
import com.cimbidia.wm.core.User
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.util.DateUtil


class RoutingGuideSearchCriteria {

	Company company
	Company businessUnit
	Location origin
	Location destination	
	
	Constants billingMethod

	Mot mot
	Equipment equipment
	Constants tempCtrl
	Constants serviceLevel
	
	Date effectiveStartTime
	Date effectiveEndTime
	
	Company carrierCompany
	
	Float distance
	Constants distanceUom
	Constants weightUom

	Integer numOfStops
	
	String orderBy
	Date routingDate 
	Shipment shipment
	String commodityClass
}
	