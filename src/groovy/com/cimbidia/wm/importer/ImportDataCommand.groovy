/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.importer

import com.cimbidia.wm.core.Location;

class ImportDataCommand {
	def filename
	def importFile
	def type
	Location location
	def columnMap
	def data
	//def errors
	
	def products = []
	def categories = []
	def inventoryItems = []
	def transaction 
	
	static constraints = {
		filename(nullable:true)
		importFile(nullable:true)
		type(nullable:false)
		location(nullable:false)
		columnMap(nullable:true)
		data(nullable:true)
		products(nullable:true)
		categories(nullable:true)
		inventoryItems(nullable:true)
		transaction(nullable:true)
	}
	
}