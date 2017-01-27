package com.cimbidia.wm.core.rg

import com.fedex.rate.stub.PackagingType;

class FedexRate {

	String carrier
	com.fedex.rate.stub.ReturnedRateType rateType
	com.fedex.rate.stub.Weight weight
	com.fedex.rate.stub.Money surcharge
	com.fedex.rate.stub.Money totalCharge
	com.fedex.rate.stub.Money baseCharge
	com.fedex.rate.stub.Money totalSurcharges
	PackagingType packagingType
	String deliveryDate
	int deliveryTimeStamp
	String message
	String transitTime
  
}