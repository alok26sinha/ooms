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

//import java.util.Date;
import com.cimbidia.wm.core.Constants
import com.cimbidia.scm.constants.Constants

class Address implements Serializable {
	
	def beforeInsert = {
	
		createSearchString()
	}
	
	def beforeUpdate = {
	
		createSearchString()
	}
	
	public void createSearchString()
	{
		this.searchString = (address? address.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (address2? address2.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (city? city.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (county? county.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (stateOrProvince?stateOrProvince.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (postalCode? postalCode.trim(): "") + com.cimbidia.wm.core.Constants.ADDRESS_SEARCH_STRING_DELIMITER + (country? country.trim(): "");
//		println "searchString created in Address is = " + this.searchString
	}
	
	String id
	String address
	String address2
	String city
	String county
	String stateOrProvince
	String postalCode
	String country
	String searchString

	// Audit fields
	Date dateCreated;
	Date lastUpdated;
	
	static mapping = {
		id generator: 'uuid'
	}
	
	
	static constraints = {
		address(nullable: true, maxSize: 255)
		address2(nullable:true, maxSize: 255)
		city(maxSize: 255)
		county(nullable:true)
		stateOrProvince(maxSize: 255)
		postalCode(nullable:true, maxSize: 255)
		stateOrProvince(nullable:true, maxSize: 255)
		searchString(nullable:true, display:false)
	}
	
	String toString()
	{
		return (this.address?:"") + ", " + (this.address2?:"") + ", " + (this.city?:"") + ", " + (this.county?:"") + ", " + (this.stateOrProvince?:"") + ", " + (this.postalCode?:"") + " " + (this.country?:"")
	}
	
	Address(String address, String address2, String city, String county, String stateOrProvince, String postalCode, String country)
	{
		this.address = address
		this.address2 = address2
		this.city = city
		this.county = county
		this.stateOrProvince = stateOrProvince
		this.postalCode = postalCode
		this.country = country
	}
}
