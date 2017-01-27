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

import com.cimbidia.wm.auth.AuthService;
class Equipment {

	def beforeInsert = {
		createdBy = AuthService.currentUser.get()
	}
	def beforeUpdate ={
		updatedBy = AuthService.currentUser.get()
	}

	String id
	String name
	String code
	String description

	// Auditing
	Date dateCreated;
	Date lastUpdated;
	User createdBy
	User updatedBy
	Integer maxWeight
	Integer maxVolume
	Integer maxPallets
	Float minPerc
	//static hasMany = [ equipmentSizes : EquipmentSize ]

	static mapping = {
		id generator: 'uuid'
		//equipmentSizes cascade: "all-delete-orphan"
		maxWeight column : "max_weight"
		maxVolume column : "max_volume"
		maxPallets column : "max_pallets"
		minPerc column : "min_perc"
	}
	
    static constraints = {
		name(nullable:false, maxSize:255)
		code(nullable:false, maxSize:255)
		description(nullable:true, maxSize:255)
		
		createdBy(nullable:true)
		updatedBy(nullable:true)
    }

	String toString() { return name } 

	public Float getMaxEquipmentWeight(){
		//maxWeight=Equipment.findBy;
		return Mot.MAX_EQP_WT
	}
	public Float getMaxEquipmentVolume(){
		return Mot.MAX_EQP_VOL
	}
}
