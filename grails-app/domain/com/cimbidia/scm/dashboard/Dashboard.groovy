package com.cimbidia.scm.dashboard;

class Dashboard {

	Integer newOrderCount
	Integer releasedOrderCount
	Integer inTansitShipCount
	Integer committedCustOrderCount
	Integer acknowledgeCustOrderCount
	Integer unCommittedCustomerOrderCount
	Integer backOrderedCustomerOrderCount
	Integer belowSafetyStock
	Integer daysOpen
	Integer unassignedShipmentCount
	static transients = ['newOrderCount', 'releasedOrderCount']
	
}
