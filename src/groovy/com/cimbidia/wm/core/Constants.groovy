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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
// import java.util.ArrayList;


class Constants {
	
	
	static final controllersWithAuthUserNotRequired = ['api','rxNorm','test']
	static final actionsWithAuthUserNotRequired = ['test', 'login', 'logout', 'handleLogin', 'signup', 'handleSignup', 'json', 'updateAuthUserLocale']
	static final actionsWithLocationNotRequired = ['test', 'login', 'logout', 'handleLogin', 'signup', 'handleSignup', 'chooseLocation', 'json', 'updateAuthUserLocale']
	static final changeActions = ['edit', 'delete', 'create', 'add', 'process','save', 'update','importData', 'receive','showRecordInventory','withdraw', 'cancel', 'change','toggle']
	static final changeControllers = ['createProductFromTemplate']
	static final adminControllers=['createProduct', 'createProductFromTemplate', 'admin']
	static final adminActions = ['product':['create'], 'person': ['list'], 'user':['list'], 'location':['edit'], 'shipper':['create'], 'locationGroup':['create'],'locationType':['create'], '*': ['delete']]
	
	
	static final String DEFAULT_DATE_FORMAT = "dd/MMM/yyyy"
	static final String DEFAULT_DATE_TIME_FORMAT = "dd/MMM/yyyy HH:mm:ss z"
	static final String DEFAULT_TIME_FORMAT = "HH:mm:ss z"
	static final String DEFAULT_MONTH_YEAR_DATE_FORMAT = "MMM yyyy"
	static final String SHORT_MONTH_YEAR_DATE_FORMAT = "MM/yyyy"
	
	static final DateFormat DEFAULT_DATE_FORMATTER = new SimpleDateFormat(DEFAULT_DATE_FORMAT);	

	static final String DEFAULT_WEIGHT_UNITS = "lbs"
	static final String DEFAULT_VOLUME_UNITS = "ft"
	
	static final String DEFAULT_RATING_DISTANCE_UNIT = "Mi"
	static final String DEFAULT_RATING_WEIGHT_UNIT = "Ton"
	
	static final ArrayList WEIGHT_UNITS = ["lbs","kg"]
	static final ArrayList VOLUME_UNITS = ["ft","m"]
	         
	static final Float POUNDS_PER_KILOGRAM = 0.45359237;
	static final Float KILOGRAMS_PER_POUND = 2.20462262;
	                        
	static final ArrayList COLORS = ['FFFFFF','FFDFDF','FFBFBF','FF9F9F','FF7F7F','FF5F5F','FF3F3F','FF1F1F','FF0000','DF1F00','C33B00','A75700','8B7300','6F8F00','53AB00','37C700','1BE300','00FF00','00DF1F','00C33B','00A757','008B73','006F8F','0053AB','0037C7','001BE3','0000FF','0000df','0000c3','0000a7','00008b','00006f','000053','000037','00001b','000000' ];
	      
	static final ArrayList EXPORT_PRODUCT_COLUMNS = ["ID","SKU","Name","Category","Description","Unit of Measure","Manufacturer","Brand","Manufacturer Code","Manufacturer Name","Vendor","Vendor Code","Vendor Name","Cold Chain","UPC","NDC","Date Created","Date Updated"];
	
	// these are direct references to transaction types by primary key
	static final String CONSUMPTION_TRANSACTION_TYPE_ID = "2"
	static final String ADJUSTMENT_CREDIT_TRANSACTION_TYPE_ID = "3"
	static final String EXPIRATION_TRANSACTION_TYPE_ID = "4"
	static final String DAMAGE_TRANSACTION_TYPE_ID = "5"
	static final String INVENTORY_TRANSACTION_TYPE_ID = "7"
	static final String TRANSFER_IN_TRANSACTION_TYPE_ID = "8"
	static final String TRANSFER_OUT_TRANSACTION_TYPE_ID = "9"
	static final String ADJUSTMENT_DEBIT_TRANSACTION_TYPE_ID = "10"
	static final String PRODUCT_INVENTORY_TRANSACTION_TYPE_ID = "11"
	
	// direct references to locations by primary key
	static final String WAREHOUSE_LOCATION_TYPE_ID = "2"
	static final String SUPPLIER_LOCATION_TYPE_ID = "4"
	
	// direct references to containers by primary key
	static final String BOX_CONTAINER_TYPE_ID = "4"	
	
	// Characters that should be included with each of the random number types 	
	static final String RANDOM_IDENTIFIER_ALPHABETIC_CHARACTERS = "ABCDEFGHJKMNPQRSTUVXYZ"
	static final String RANDOM_IDENTIFIER_ALPHANUMERIC_CHARACTERS = "0123456789ABCDEFGHJKMNPQRSTUVXYZ"
	static final String RANDOM_IDENTIFIER_NUMERIC_CHARACTERS = "0123456789"
	
	// Default random number formats
	static final String DEFAULT_ORDER_NUMBER_FORMAT = "NNNLLL"
	static final String DEFAULT_PRODUCT_NUMBER_FORMAT = "LLNN"
	static final String DEFAULT_REQUISITION_NUMBER_FORMAT = "NNNLLL"
	static final String DEFAULT_SHIPMENT_NUMBER_FORMAT = "NNNLLL"
	static final String DEFAULT_TRANSACTION_NUMBER_FORMAT = "AAA-AAA-AAA"
	static final String DEFAULT_TRANSPORTATION_NUMBER_FORMAT = "NNNLLL"
	static final String DEFAULT_BOOKING_NUMBER_FORMAT = "NNNN"

	
	static final String ADDRESS_SEARCH_STRING_DELIMITER = "~"	
}
