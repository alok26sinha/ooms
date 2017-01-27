package com.cimbidia.wm.core.rg

import com.fedex.rate.stub.Dimensions
import com.fedex.rate.stub.Money
import com.fedex.rate.stub.Weight

class FedexRoutingGuideSearchCriteria extends RoutingGuideSearchCriteria {

	Dimensions dimensions
	Money money
	Weight weight
	String weightUnit
	Integer dimLength
	Integer dimWidth
	Integer dimHeight
	Integer groupPackageCount
	Integer packageCount
	String  dimUnit
	String dropType
	String serviceType
	String packagingType
	String  dateRequest
    static constraints = {
    }
}
