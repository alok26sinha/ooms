/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm

import grails.converters.JSON
import grails.plugin.cache.CacheEvict
import grails.plugin.cache.Cacheable

import com.cimbidia.wm.core.*

import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.product.ProductGroup
import com.cimbidia.wm.reporting.Indicator
import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.shipment.Container
import com.cimbidia.wm.shipment.ShipmentItem
import com.cimbidia.wm.order.Order
import java.text.SimpleDateFormat
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.core.rg.RoutingGuideSearchCriteria

class JsonController {
	def inventoryService
	def productService
	def localizationService	
	def shipmentService
	def messageSource
    def consoleService

    def evaluateIndicator = {
        def indicator = Indicator.get(params.id)
        if (indicator) {
            def results = consoleService.eval(indicator.expression, true, request)
            render results.result
        }
        else {
            render "error"
        }
    }

/*    def addToRequisitionItems = {

        def requisition = Requisition.get(params.requisitionId)
        def product = Product.get(params.productId);
        def quantity = (params.quantity)?params.int("quantity"):1
        def orderIndex = (params.orderIndex)?params.int("orderIndex"):0
        def requisitionItem = new RequisitionItem()
        if (requisition && product) {
            requisitionItem.product = product
            requisitionItem.quantity = quantity
            requisitionItem.substitutable = false
            requisitionItem.orderIndex = orderIndex
            requisition.addToRequisitionItems(requisitionItem)
            requisition.save(flush: true)
        }
        def json
        if (requisitionItem) {
            json = [success: true, data: requisitionItem.toJson()]
        }
        else {
            json = [success: false, errors: requisitionItem.errors]
        }
        log.info(json as JSON)
        render json as JSON
    }*/

    def getTranslation = {
        def translation = getTranslation(params.text, params.src, params.dest)
        def json = [translation]
        render json as JSON
    }

    def getTranslation(String text, String source, String destination) {
        def translation = ""
        text = text.encodeAsURL()
        def email = "xxx"
        def password = "0p3nb0x3s"
        String urlString = "http://www.syslang.com/frengly/controller?action=translateREST&src=${source.encodeAsHTML()}&dest=${destination}&text=${text.encodeAsHTML()}&email=${email}&password=${password}"
        try {
            println "Before " + urlString
            def url = new URL(urlString)
            def connection = url.openConnection()
            println "content type; " + connection.contentType
            if(connection.responseCode == 200){
                def xml = connection.content.text
                println "XML: " + xml
                def root = new XmlParser(false, true).parseText(xml)
                translation = root.translation.text()
            }
            else {
                println "connection " + connection.responseCode

            }
        } catch (Exception e) {
            log.error("Error trying to translate using syslang API ", e);
            throw new ApiException(message: "Unable to query syslang API: " + e.message)
        }
        return translation
    }

	def getLocalization = { 
		log.info "get localization " + params
		def localization = Localization.get(params.id)
		// Get the localization from the database
		// Create a new localization based on the message source

		if (!localization) {
            localization = new Localization();

            // Get translation from message source
			def message = messageSource.getMessage(params.code, null, params.resolvedMessage, session?.user?.locale?:"en")
		    println "get translation for code " + params.code + ", " + session?.user?.locale + " = " + message

            //try {
            //    localization.translation = getTranslation(message, "en", session?.user?.locale?.toString()?:"en")
            //} catch (Exception e) {
                //localization.translation = message;
            //}
            localization.translation = message
			localization.code = params.code
			localization.text = message

			//localization.args = []
			localization.locale = session.user.locale
		}

        // If the translation message is empty, set it equal to the same as the localization text
        if (!localization.translation)
            localization.translation = localization.text

        println "localization.toJson() = " + (localization.toJson() as JSON)


		render localization.toJson() as JSON;
	}

	def saveLocalization = { 
		log.info "Save localization " + params
		def data = request.JSON
		log.info "Data " + data
		log.info "ID: " + data.id
		def locale = session?.user?.locale
		def localization = Localization.get(data?.id?.toString())
        println "found localization " + localization
		if (!localization) {
            println "Nope.  Looking by code and locale"
			localization = Localization.findByCodeAndLocale(data.code, locale?.toString())
		    if (!localization) {
                println "Nope. Creating empty localization "
			    localization = new Localization();
		    }
        }
		
		//localization.properties = data
		localization.text = data.translation
		localization.code = data.code
		localization.locale = locale

        println localization.id
		println localization.code
		println localization.text
		println localization.locale
		def jsonResponse = []

        // Attempt to save localization
		if (!localization.hasErrors() && localization.save()) {
			jsonResponse = [success: true, data: localization.toJson()]
		}
		else {
			jsonResponse = [success: false, errors: localization.errors]
		}	
		log.info(jsonResponse as JSON)
		render jsonResponse as JSON
		//def localization = new Localization(params)
		return true
	}

    def deleteLocalization = {
        log.info "get localization " + params
        // Get the localization from the database
        def jsonResponse = []
        def localization = Localization.get(params.id)
        try {
            if (localization) {
                localization.delete();
                jsonResponse = [success: true, message: "successfully deleted translation"]
            }
        } catch (Exception e) {
            jsonResponse = [success: false, message: e.message]
        }
        render jsonResponse as JSON
    }

	def getQuantityToReceive = {
		def product = Product.get(params?.product?.id)
		def location = Location.get(params?.location?.id)
		def quantityToReceive = inventoryService.getQuantityToReceive(location, product)
		//println "quantityToReceive(" + params + "): " + quantityToReceive
		render (quantityToReceive?:"0")
	}

	def getQuantityToShip = {
		def product = Product.get(params?.product?.id)
		def location = Location.get(params?.location?.id)
		def quantityToShip = inventoryService.getQuantityToShip(location, product)
		//println "quantityToShip(" + params + "): " + quantityToShip
		render (quantityToShip?:"0")
	}

	def getQuantityOnHand = {
		def product = Product.get(params?.product?.id)
		def location = Location.get(params?.location?.id)
		def quantityOnHand = inventoryService.getQuantityOnHand(location, product)
		//println "quantityOnHand(" + params + "): " + quantityOnHand
        //println "${createLink(controller:'inventoryItem', action: 'showStockCard', id: product.id)}"
		render (quantityOnHand?:"0")
	}

    @Cacheable("dashboardCache")
    def getDashboardAlerts () {
        def location = Location.get(session?.warehouse?.id)
        def dashboardAlerts = inventoryService.getDashboardAlerts(location)

        //def expirationSummary = inventoryService.getExpirationSummary(location)
        //expirationSummary.each { key, value ->
        //    dashboardAlerts[key] = value;
        //}

        //def totalStockSummary = inventoryService.getTotalStockValue(location)
        //dashboardAlerts['totalStockValue'] = g.formatNumber(number: totalStockSummary.totalStockValue, type: 'currency', currencyCode: 'USD')
        //dashboardAlerts['totalStockValue'] = totalStockSummary.totalStockValue
        //dashboardAlerts['hitCount'] = totalStockSummary.hitCount
        //dashboardAlerts['missCount'] = totalStockSummary.missCount
        //dashboardAlerts['totalCount'] = totalStockSummary.totalCount

        render dashboardAlerts as JSON
    }

    @Cacheable("dashboardCache")
    def getDashboardExpiryAlerts () {
        def location = Location.get(session?.warehouse?.id)
        def map = inventoryService.getExpirationSummary(location)
        render map as JSON
    }

    @Cacheable("dashboardCache")
    def getTotalStockValue () {
        def location = Location.get(session?.warehouse?.id)
        def result = inventoryService.getTotalStockValue(location)
        def totalValue = g.formatNumber(number: result.totalStockValue, type: 'currency', currencyCode: 'USD')

        def map = [totalStockValue:result.totalStockValue, hitCount: result.hitCount, missCount: result.missCount, totalCount: result.totalCount]
        render map as JSON
    }

    @Cacheable("dashboardCache")
    def getReconditionedStockCount () {
        def location = Location.get(params?.location?.id)
        def results = inventoryService.getReconditionedStock(location)
        render (results?.keySet()?.size()?:"0")
    }

    @Cacheable("dashboardCache")
    def getTotalStockCount () {
        def location = Location.get(params?.location?.id)
        def results = inventoryService.getTotalStock(location)
        render (results?.keySet()?.size()?:"0")
    }

    @Cacheable("dashboardCache")
    def getInStockCount () {
        def location = Location.get(params?.location?.id)
        def results = inventoryService.getInStock(location)
        //println "in stock: " + results
        render (results?.keySet()?.size()?:"0")
    }

    @Cacheable("dashboardCache")
    def getOutOfStockCount () {
        def location = Location.get(params?.location?.id)
        def results = inventoryService.getOutOfStock(location)
        render (results?.keySet()?.size()?:"0")
    }

    @Cacheable("dashboardCache")
    def getOverStockCount () {
        def location = Location.get(params?.location?.id)
        def results = inventoryService.getOverStock(location)
        render (results?.keySet()?.size()?:"0")
    }

    @Cacheable("dashboardCache")
    def getLowStockCount () {
		def location = Location.get(params?.location?.id)
		def results = inventoryService.getLowStock(location)
        //println "low: " + results
		render (results?.keySet()?.size()?:"0")
	}

    @Cacheable("dashboardCache")
	def getReorderStockCount () {
		def location = Location.get(params?.location?.id)
		def results = inventoryService.getReorderStock(location)
        //println "reorder: " + results
		render (results?.keySet()?.size()?:"0")
	}

    @Cacheable("dashboardCache")
	def getExpiringStockCount () {
		def daysUntilExpiry = Integer.valueOf(params.daysUntilExpiry)
		def location = Location.get(params?.location?.id)
		def results = inventoryService.getExpiringStock(null, location, daysUntilExpiry)
		render ((results)?results?.size():"0")
	}

    @Cacheable("dashboardCache")
	def getExpiredStockCount () {
		//println "expired stock count " + params
		def location = Location.get(params?.location?.id)
		def results = inventoryService.getExpiredStock(null, location)
		render ((results)?results.size():"0")
	}

    def findProductCodes = {
        def searchTerm = params.term + "%";
        def c = Product.createCriteria()
        def products = c.list {
            ilike("productCode", searchTerm)
        }

        //"id": "Netta rufina", "label": "Red-crested Pochard", "value": "Red-crested Pochard" },
        def results = products.unique().collect { [ value: it.productCode, label: it.productCode + " " + it.name ] }
        render results as JSON;
    }


	def findTags = {
		def searchTerm = "%" + params.term + "%";
		def c = Tag.createCriteria()
		def tags = c.list {
			projections { property "tag" }
			ilike("tag", searchTerm)
		}

		def results = tags.unique().collect { [ value: it, label: it ] }
		render results as JSON;
	}

	def autoSuggest = {		
		println "autoSuggest: " + params
		def searchTerm = "%" + params.term + "%";
		def c = Product.createCriteria()
		def results = c.list {
			projections {
				property "${params.field}"
			}
			ilike("${params.field}", searchTerm)
		}		
		results = results.unique().collect { [ value: it, label: it ] }
		render results as JSON;
	}

	def findProductNames = {
		def searchTerm = "%" + params.term + "%";
		def c = Product.createCriteria()
		def productNames = c.list {
			projections {
				property "name"
			}
			ilike("name", searchTerm)
		}
		
		def results = productNames.unique().collect { [ value: it, label: it ] }
		render results as JSON;
	}
	
	/*def findPrograms = {
		println "find programs " + params
		def searchTerm = params.term + "%";
		def c = Requisition.createCriteria()
		
		def names = c.list {
			projections {
				property "recipientProgram"
			}
			ilike("recipientProgram", searchTerm)
		}
		// Try again 
		if (names.isEmpty()) { 
			searchTerm = "%" + params.term + "%";
			c = Requisition.createCriteria()
			names = c.list {
				projections {
					property "recipientProgram"
				}
				ilike("recipientProgram", searchTerm)
			}
		}
			
		if (names.isEmpty()) { 			
			names = []
			names << params.term 
		}
		
		def results = names.collect { [ value: it, label: it ] }		
		render results as JSON;
	}*/
	
	def findRxNormDisplayNames = { 
		println "findRxNormDisplayNames: " + params
		def results = []
		try {
			def url = new URL("http://rxnav.nlm.nih.gov/REST/displaynames")
			def connection = url.openConnection()
			if (connection.responseCode == 200) {
				def xml = connection.content.text
				def list = new XmlParser(false, true).parseText(xml)
				for (item in list.displayTermsList.term) {
					//println "item: " + item
					if (item.text().startsWith(params.term)) { 
						results << item.text()
					}
					
				}
				
				if (results.size() > 10) {
					def remaining = results.size() - 10
					results = results.subList(0,10)
					results << "There are " + remaining + " more items"
				}

			}
		} catch (Exception e) {
			log.error("Error trying to get products from NDC API ", e);
			throw e
		}
		render results as JSON;
	}
	
	
	def getInventoryItem = { 
		render InventoryItem.get(params.id).toJson() as JSON;
	}
	
	def getQuantity = {
		log.info params
		def quantity = 0
		def location = Location.get(session.warehouse.id);
		def lotNumber = (params.lotNumber) ? (params.lotNumber) : "";
		def product = (params.productId) ? Product.get(params.productId) : null;
		
		def inventoryItem = inventoryService.findInventoryItemByProductAndLotNumber(product, lotNumber);
		if (inventoryItem) { 
			quantity = inventoryService.getQuantity(location?.inventory, inventoryItem)
		}
		log.info "quantity by lotnumber '" + lotNumber + "' and product '" + product + "' = " + quantity;
		render quantity ?: "N/A";
	}

	def sortContainers = {
		def container
		params.get("container[]").eachWithIndex { id, index ->
			container = Container.get(id)
			container.sortOrder = index 
			container.save(flush:true);
			println ("container " + container.name + " saved at index " + index)
		}
		container.shipment.refresh()
				
		render(text: "", contentType: "text/plain")
	}

    /*def sortRequisitionItems = {
        println "sort requisition items " + params

        def requisitionItem
        params.get("requisitionItem[]").eachWithIndex { id, index ->
            requisitionItem = RequisitionItem.get(id)
            requisitionItem.orderIndex = index
            requisitionItem.save(flush:true);
            println ("requisitionItem " + id + " saved at index " + index)
        }
        requisitionItem.requisition.refresh()
        render(text: "", contentType: "text/plain")
    }*/

	/**
	 * Ajax method for the Record Inventory page.
	 */
	def getInventoryItems = {
		log.info params
		def productInstance = Product.get(params?.product?.id);
		def inventoryItemList = inventoryService.getInventoryItemsByProduct(productInstance)
		render inventoryItemList as JSON;
	}

	
	/**
	 * Returns inventory items for the given location, lot number, and product.
	 */
	def findInventoryItems = {
		log.info params
		def inventoryItems = []
		def location = Location.get(session.warehouse.id);
		
		log.info "I AM INSIDE THIS PLACE WAHOOOOOO " + location
		
		if (params.term) {
			// Improved the performance of the auto-suggest by moving 
			def tempItems = inventoryService.findInventoryItems(params.term)
			log.info "I AM INSIDE THIS PLACE tempItems " + tempItems
			
			log.info "I AM INSIDE THIS PLACE location?.inventory " + location?.inventory
			
			// Get a map of quantities for all items in inventory
			def quantitiesByInventoryItem = inventoryService.getQuantityForInventory(location?.inventory)
			log.info "I AM INSIDE THIS PLACE quantitiesByInventoryItem " + quantitiesByInventoryItem
			
			if (tempItems) {

				tempItems.each { 
					def quantity = quantitiesByInventoryItem[it]
					log.info "I AM INSIDE THIS PLACE quantity = quantitiesByInventoryItem[it] " + quantity

					
					quantity = (quantity) ?: 0
					
					def localizedName = localizationService.getLocalizedString(it.product.name)
					localizedName = (it.product.productCode?:"----") + " " + localizedName
					if (quantity > 0) { 
						inventoryItems << [
							id: it.id,
							value: it.lotNumber,
							label:  localizedName + " --- Item: " + it.lotNumber + " --- Qty: " + quantity + " --- ",
							valueText: it.lotNumber,
							lotNumber: it.lotNumber,
							product: it.product.id,
							productId: it.product.id,
							productName: localizedName,
							quantity: quantity,
							expirationDate: it.expirationDate
						]
					}	
				}
			}
		}
		if (inventoryItems.size() == 0) { 
			def message = "${warehouse.message(code:'inventory.noItemsFound.message', args: [params.term])}"
			inventoryItems << [id: 'null', value: message]			
		}
		else { 
			inventoryItems.sort { it.productName }
		}
		
		def something = inventoryItems as JSON
		log.info "I AM INSIDE THIS PLACE inventoryItems " + something
		
		render inventoryItems as JSON;
	}

	def findLotsByName = { 
		log.info params
		// Constrain by product id if the productId param is passed in		
		def items = new TreeSet();
		if (params.term) {
			def searchTerm = "%" + params.term + "%";
			items = InventoryItem.withCriteria {
				and { 
					or {
						ilike("lotNumber", searchTerm)
					}
					// Search within the inventory items for a specific product
					if (params?.productId) { 
						eq("product.id", params.productId)
					}
				}
			}
			
			def warehouse = Location.get(session.warehouse.id);
			def quantitiesByInventoryItem = inventoryService.getQuantityForInventory(warehouse?.inventory)
			
			if (items) {
				items = items.collect() { item ->
					def quantity = quantitiesByInventoryItem[item]
					quantity = (quantity) ?: 0
					
					def localizedName = localizationService.getLocalizedString(item.product.name)
					
					[
						id: item.id,
						value: item.lotNumber,
						label:  localizedName + " --- Item: " + item.lotNumber + " --- Qty: " + quantity + " --- ",
						valueText: item.lotNumber,
						lotNumber: item.lotNumber,
						expirationDate: item.expirationDate
					]
				}
			}
		}
		render items as JSON;
	}

	def findPersonByName = {
		log.info "findPersonByName: " + params
		def items = new TreeSet();
		try {
			
			if (params.term) {
						
				def terms = params.term.split(" ")				
				for (term in terms) { 						
					items = Person.withCriteria {
						or {
							ilike("firstName", term + "%")
							ilike("lastName", term + "%")
							ilike("email", term + "%")
						}
					}
				}
							
				if (items) {
					items.unique();
					items = items.collect() {						
						
						[
                            label:  it.name + " (" +  it.email + ") ",
                            value: it.id,
							valueText: it.name,
							desc: (it?.email) ? it.email : "",
						]
					}

				}
				else {
                    /*
                    response.status = 404;
                    render "${warehouse.message(code: 'person.doesNotExist.message', args: [params.term])}"
                    */
					def item =  [
						value: "null",
						valueText : params.term,						
						label: "${warehouse.message(code: 'person.doesNotExist.message', args: [params.term])}",
						desc: params.term,
						icon: ""
					];
					items.add(item)

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		}
        println "returning ${items?.size()} items: " + items
        render items as JSON;


	}

	def findProductByName = {
		
		log.info("find products by name " + params)
		def dateFormat = new SimpleDateFormat(Constants.SHORT_MONTH_YEAR_DATE_FORMAT);
		def products = new TreeSet();
		
		if (params.term) {			
			// Match full name

            products = Product.withCriteria {
                ilike("productCode", params.term + "%")
            }
            if (!products) {
                products = Product.withCriteria {
                    ilike("name", "%" + params.term + "%")
                }
            }
		}
		
		def location = Location.get(params.warehouseId);
		log.info ("warehouse: " + location);
		def quantityMap = [:]

        if (false) {
		    quantityMap = inventoryService.getQuantityForInventory(location?.inventory)
        }

		// FIXME Needed to create a new map with inventory item id as the index 
		// in order to get the quantity below.  For some reason, the inventory item 
		// object was getting toString()'d when used below as a key and therefore
		// the keys were mismatched and the quantity was always null.
		def idQuantityMap = [:]
		quantityMap.keySet().each { 
			idQuantityMap[it.id] = quantityMap[it]
		}
		
		// Convert from products to json objects 
		if (products) {
			// Make sure items are unique
			//products.unique();
			products = products.collect() { product ->
				def productQuantity = 0;
				// We need to check to make sure this is a valid product
				def inventoryItemList = []
				if (product.id) { 
					def inventoryItems = InventoryItem.findAllByProduct(product);
					inventoryItemList = inventoryItems.collect() { inventoryItem ->
						// FIXME Getting the quantity from the inventory map does not work at the moment
						def quantity = idQuantityMap[inventoryItem.id]?:0;
						
						// Create inventory items object
						//if (quantity > 0) { 
							[	
								id: inventoryItem.id?:0, 
								lotNumber: (inventoryItem?.lotNumber)?:"", 
								expirationDate: (inventoryItem?.expirationDate) ? 
									(dateFormat.format(inventoryItem?.expirationDate)) : 
									"${warehouse.message(code: 'default.never.label')}", 
								quantity: quantity
							] 
						//}
					}
					
					// Sort using First-expiry, first out policy
					inventoryItemList = inventoryItemList.sort { it?.expirationDate }
				}
				
				def localizedName = localizationService.getLocalizedString(product.name)
				
				
				// Convert product attributes to JSON object attributes
				[	
					product: product,
					category: product?.category,
					quantity: productQuantity,
                    productCode: product?.productCode,
					value: product.id,
					label: product?.productCode + " " + localizedName,
					valueText: localizedName,
					desc: product.description,
					inventoryItems: inventoryItemList,
					icon: "none"
				]
			}
		}
		
		if (products.size() == 0) { 
			products << [ value: null, label: warehouse.message(code:'product.noProductsFound.message')]
		}

		log.info "Returning " + products.size() + " results for search " + params.term
		render products as JSON;
	}
	
	def productLookup = {
		
		log.info("find products by name " + params)
	
		def products = new TreeSet();
		
		if (params.term) {
			// Match full name

			products = Product.withCriteria {
				ilike("productCode", params.term + "%")
			}
			if (!products) {
				products = Product.withCriteria {
					ilike("name", "%" + params.term + "%")
				}
			}
		}
		

		// Convert from products to json objects
		if (products) {
			// Make sure items are unique
			//products.unique();
			products = products.collect() { product ->
							
				def localizedName = localizationService.getLocalizedString(product.name)
				
				
				// Convert product attributes to JSON object attributes
				[
					product: product,
					productCode: product?.productCode,
					value: product.id,
					label: product?.productCode + " " + localizedName,
					valueText: localizedName,
					desc: product.description,
					icon: "none"
				]
			}
		}
		
		if (products.size() == 0) {
			products << [ value: null, label: warehouse.message(code:'product.noProductsFound.message')]
		}

		log.info "Returning " + products.size() + " results for search " + params.term
		render products as JSON;
	}
	
	def locationLookup = {
		
		log.info("find location by name " + params)
	
		def locations = new TreeSet();
		
		if (params.term) {
			// Match full name

			locations = Location.withCriteria {
				ilike("name", "%" +params.term + "%")
			}
			
		}
		

		// Convert from locations to json objects
		if (locations) {
			// Make sure items are unique
			//products.unique();
			locations = locations.collect() { location ->
							
				def localizedName = localizationService.getLocalizedString(location.name)
				
				
				// Convert product attributes to JSON object attributes
				[
					location: location,
					address: location?.address?.address,
					address2: location?.address?.address2,
					id: location?.address?.id,
					city: location?.address?.city,
					postalCode: location?.address?.postalCode,
					county: location?.address?.county,
					stateOrProvince: location?.address?.stateOrProvince,
					country: location?.address?.country,
					value: location.id,
					label: location?.name + " " + localizedName,
					valueText: localizedName,
					icon: "none"
				]
			}
		}
		
		if (locations.size() == 0) {
			locations << [ value: null, label: warehouse.message(code:'locations.noLocationsFound.message')]
		}

		log.info "Returning " + locations.size() + " results for search " + params.term
		render locations as JSON;
	}
	
	def vendorLookup = {
		
		log.info("find vendor by name " + params)
	
		def vendors = new TreeSet();
		
		if (params.term) {
			// Match full name

			vendors = Company.withCriteria {
				ilike("companyName", "%" +params.term + "%")
				eq("type.id", 9)
			}
			if (!vendors) {
				vendors = Company.withCriteria {
					ilike("description", "%" + params.term + "%")
					eq("type.id", 9)
				}
			}
		}
		

		// Convert from vendors to json objects
		if (vendors) {
			// Make sure items are unique
			//vendors.unique();
			vendors = vendors.collect() { vendor ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					vendor: vendor,
					value: vendor.id,
					label: vendor?.companyName ,
					valueText: vendor?.companyName,
					desc: vendor?.description,
					icon: "none"
				]
			}
		}
		
		if (vendors.size() == 0) {
			vendors << [ value: null, label: warehouse.message(code:'vendors.noVendorFound.message')]
		}

		log.info "Returning " + vendors.size() + " results for search " + params.term
		render vendors as JSON;
	}
	
	def poLookup = {
		
		log.info("find po by po number " + params)
		println("params********"+params)
		def pos = new TreeSet();
		
		if (params.term) {
			// Match full name

			pos = Order.withCriteria {
				ilike("orderNumber", "%" +params.term + "%")
				eq("companyId", session?.companyId?session?.companyId:1)
			}
			
		}
		

		// Convert from pos to json objects
		if (pos) {
			// Make sure items are unique
			
			pos = pos.collect() { po ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					po: po,
					value: po?.orderNumber,
					label: po?.orderNumber ,
					valueText: po?.orderNumber,
					desc: po?.description,
					icon: "none"
				]
			}
		}
		
		if (pos.size() == 0) {
			pos << [ value: null, label: warehouse.message(code:'pos.noPO.message')]
		}

		log.info "Returning " + pos.size() + " results for search " + params.term
		render pos as JSON;
	}
	
	def companyLookup = {
		
		log.info("find vendor by name " + params)
	
		def vendors = new TreeSet();
		
		if (params.term) {
			// Match full name

			vendors = Company.withCriteria {
				ilike("companyName", "%" +params.term + "%")
				
			}
			if (!vendors) {
				vendors = Company.withCriteria {
					ilike("description", "%" + params.term + "%")
				}
			}
		}
		

		// Convert from vendors to json objects
		if (vendors) {
			// Make sure items are unique
			//vendors.unique();
			vendors = vendors.collect() { vendor ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					vendor: vendor,
					value: vendor.id,
					label: vendor?.companyName ,
					valueText: vendor?.companyName,
					desc: vendor?.description,
					icon: "none"
				]
			}
		}
		
		if (vendors.size() == 0) {
			vendors << [ value: null, label: warehouse.message(code:'vendors.noVendorFound.message')]
		}

		log.info "Returning " + vendors.size() + " results for search " + params.term
		render vendors as JSON;
	}
	
	def asnCarrierLookup = {
		
		log.info("find vendor by name " + params)
	
		def carriers = new TreeSet();
		
		if (params.term) {
			// Match full name

			carriers = Company.withCriteria {
				ilike("companyName", "%" +params.term + "%")
				eq("type.id", 10)
			}
			if (!carriers) {
				carriers = Company.withCriteria {
					ilike("description", "%" + params.term + "%")
					eq("type.id", 10)
				}
			}
		}
		

		// Convert from vendors to json objects
		if (carriers) {
			// Make sure items are unique
			//vendors.unique();
			carriers = carriers.collect() { carrier ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					carrier: carrier,
					value: carrier.id,
					label: carrier?.companyName ,
					valueText: carrier?.companyName,
					desc: carrier?.description,
					icon: "none"
				]
			}
		}
		
		if (carriers.size() == 0) {
			carriers << [ value: null, label: warehouse.message(code:'carriers.noCarrierFound.message')]
		}

		log.info "Returning " + carriers.size() + " results for search " + params.term
		render carriers as JSON;
	}
	
	def carrierLookup = {
		
		log.info("find vendor by name " + params)
	
		def carriers = new TreeSet();
		
		if (params.term) {
			// Match full name

			carriers = Company.withCriteria {
				ilike("companyName", "%" +params.term + "%")
				eq("type.id", 10)
			}
			if (!carriers) {
				carriers = Company.withCriteria {
					ilike("description", "%" + params.term + "%")
					eq("type.id", 10)
				}
			}
		}
		

		// Convert from vendors to json objects
		if (carriers) {
			// Make sure items are unique
			//vendors.unique();
			carriers = carriers.collect() { carrier ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					carrier: carrier,
					value: carrier.id,
					label: carrier?.companyName ,
					valueText: carrier?.companyName,
					desc: carrier?.description,
					icon: "none"
				]
			}
		}
		
		if (carriers.size() == 0) {
			carriers << [ value: null, label: warehouse.message(code:'carriers.noCarrierFound.message')]
		}

		log.info "Returning " + carriers.size() + " results for search " + params.term
		render carriers as JSON;
	}
	
	
	def bookingCarrierLookup = {
		
		log.info("find bookingcarrier by name " + params)
	
		def carriers = new TreeSet();
		
		if (params.term) {
			// Match full name
			def mot = Mot.findAllByCode(Mot.OCN);
			println "mot found is ="+mot
			println "params="+ params
			
			RoutingGuideSearchCriteria rgSearch = new RoutingGuideSearchCriteria()
			rgSearch.mot = mot
			//if(rgSearch.
			//getRoutingGuideList()
			
			/*if(mot)
			{
				carriers = CarrierMot.withCriteria {
					ilike("companyName", "%" +params.term + "%")
					eq(,)
					eq("type.id", 10)
				}
				if (!carriers) {
					carriers = Company.withCriteria {
						ilike("description", "%" + params.term + "%")
						eq(,)
						eq("type.id", 10)
					}
				}
			} */
		}
		

		// Convert from vendors to json objects
		if (carriers) {
			// Make sure items are unique
			//vendors.unique();
			carriers = carriers.collect() { carrier ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					carrier: carrier,
					value: carrier.id,
					label: carrier?.companyName ,
					valueText: carrier?.companyName,
					desc: carrier?.description,
					icon: "none"
				]
			}
		}
		
		if (carriers.size() == 0) {
			carriers << [ value: null, label: warehouse.message(code:'carriers.noCarrierFound.message')]
		}

		log.info "Returning " + carriers.size() + " results for search " + params.term
		render carriers as JSON;
	}
	
	
	def shipmentLookup = {
		
		log.info("find vendor by name " + params)
	
		def shipments = new TreeSet();
		
		if (params.term) {
			// Match full name

			shipments = Shipment.withCriteria {
				ilike("shipmentNumber", "%" +params.term + "%")
			}
			
		}
		

		// Convert from vendors to json objects
		if (shipments) {
			// Make sure items are unique
			//vendors.unique();
			shipments = shipments.collect() { shipment ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					shipment: shipment,
					value: shipment.id,
					label: shipment?.shipmentNumber ,
					valueText: shipment?.shipmentNumber, 
					//desc: carrier?.description,
					icon: "none"
				]
			}
		}
		
		if (shipments.size() == 0) {
			shipments << [ value: null, label: warehouse.message(code:'shipments.noshipmentFound.message')]
		}

		log.info "Returning " + shipments.size() + " results for search " + params.term
		render shipments as JSON;
	}
	
	def usersLookup = {
		
		println("find user by name " + params)
	
		def users = new TreeSet();
		if(params.companyId){
			if (params.term) {
				// Match full name
	
				users = User.withCriteria {
					ilike("username", "%" +params.term + "%")
					eq("company.id", new Integer(params.companyId))
					eq("active", true)
				}
				
			}
		}
		else{
			println("find user by name inside else" + params)
			if (params.term) {
				// Match full name
	
				users = User.withCriteria {
					ilike("username", "%" +params.term + "%")
					eq("active", true)
				}
				
			}
		}
		println("found users="+users)
		// Convert from users to json objects
		if (users) {
			// Make sure items are unique
			//vendors.unique();
			users = users.collect() { user ->
							
				
				
				
				// Convert user attributes to JSON object attributes
				[
					user: user,
					value: user.id,
					label: user?.username ,
					valueText: user?.username,
					icon: "none"
				]
			}
		}
		
		if (users.size() == 0) {
			users << [ value: null, label: warehouse.message(code:'nouser.message')]
		}

		log.info "Returning " + users.size() + " results for search " + params.term
		render users as JSON;
	}
	
	
	def findRequestItems = {
		
		log.info("find request items by name " + params)
		
		//def items = new TreeSet();
		def items = []
		if (params.term) {
			// Match full name
			def products = Product.withCriteria {
				ilike("name", "%" + params.term + "%")
			}
			items.addAll(products)

			def productGroups = ProductGroup.withCriteria {
				ilike("description", "%" + params.term + "%")
			}
			productGroups.each { items << [id: it.id, name: it.description, class: it.class] }
			//items.addAll(productGroups)

			
			def categories = Category.withCriteria { 
				ilike("name", "%" + params.term + "%")
			}
			items.addAll(categories)
		}
		
		// Convert from products to json objects
		if (items) {
			// Make sure items are unique
			//items.unique();
			items = items.collect() { item ->
				def type = item.class.simpleName
				def localizedName = localizationService.getLocalizedString(item.name)
				// Convert product attributes to JSON object attributes
				[
					value: type + ":" + item.id,
					type: type,
					label: localizedName + "(" + type + ")",
					valueText: localizedName,
				]
			}
		}
		
		if (items.size() == 0) {
			items << [ value: null, label: warehouse.message(code:'product.noProductsFound.message')]
			//items << [value: null, label: params.term]
		}

		log.info "Returning " + items.size() + " results for search " + params.term
		render items as JSON;
	}

	def moveShipmentItemToContainer = {
		log.info "Move shipment item to container: " + params		
		def shipmentItem = ShipmentItem.get(params.shipmentItem);
		def container = Container.get(params.container);
		
		if (shipmentItem) { 
			log.info "Move item " + shipmentItem + " from " + shipmentItem?.container + " to " + container
			shipmentItem.container = container;
			shipmentItem.save(flush:true);
		}
		render shipmentItem as JSON
	}

    def searchProductPackages = {

        log.info "Search product packages " + params
        def location = Location.get(session.warehouse.id);
        def results = productService.searchProductAndProductGroup(params.term)
        if (!results) {
            results = productService.searchProductAndProductGroup(params.term, true)
        }

        def productIds = results.collect { it[0] }
        def products = productService.getProducts(productIds as String[])

        //def quantities = inventoryService.getQuantityForProducts(location.inventory, productIds)
        // To reference quantities ...
        // quantities[productData[0]]
        def result = []
        def value = ""
        def productPackageName = ""
        products.each { product ->
            //println "productData " + productData
            //if(productData[3] && !result.any{it.id == productData[3] && it.type == "ProductGroup"})
            //result.add([id: productData[3], value: productData[2], type:"ProductGroup", group: ""])
            //result.add([id: productData[0], value: productData[2] + " - " + productData[1], type:"Product", quantity: null, group: ""])
            productPackageName = "EA/1"
            value = product?.productCode + " " + product?.name?.trim() + " (" + productPackageName + ")"
            value = value.trim()

            // Add the EACH level items
            result.add([id: product.id, value: value, type: "Product", quantity: null, group: null])

            // Add the package level items
            /*
            product.packages.each { pkg ->
                productPackageName = pkg?.uom?.code + "/" + pkg?.quantity;
                value = product?.productCode + " " + product?.name?.trim() + " (" + productPackageName + ")"
                value = value.trim()
                result.add([id: product.id, value: value, type: "Product", quantity: null, group: null,
                        productPackageId: pkg?.id, productPackageName: productPackageName, productPackageQty: pkg?.quantity])
            }
            */

        }
        println result
        render result.sort { "${it.group}${it.value}" } as JSON
    }



    def searchProduct = {
        def location = Location.get(session.warehouse.id);
        def results = productService.searchProductAndProductGroup(params.term)
        if (!results) {
            results = productService.searchProductAndProductGroup(params.term, true)
        }

        def productIds = results.collect { it[0] }
        def products = productService.getProducts(productIds as String[])

        //def quantities = inventoryService.getQuantityForProducts(location.inventory, productIds)
        // To reference quantities ...
        // quantities[productData[0]]
        def result = []
        def value = ""
        def productPackageName = ""
        products.each { product ->
            //println "productData " + productData
            //if(productData[3] && !result.any{it.id == productData[3] && it.type == "ProductGroup"})
            //result.add([id: productData[3], value: productData[2], type:"ProductGroup", group: ""])
            //result.add([id: productData[0], value: productData[2] + " - " + productData[1], type:"Product", quantity: null, group: ""])
            productPackageName = "EA/1"
            value = product?.productCode + " " + product?.name?.trim() + " (" + productPackageName + ")"
            value = value.trim()

            // Add the EACH level items
            result.add([id: product.id, value: value, type: "Product", quantity: null, group: null])

            // Add the package level items
            /*
            product.packages.each { pkg ->
                productPackageName = pkg?.uom?.code + "/" + pkg?.quantity;
                value = product?.productCode + " " + product?.name?.trim() + " (" + productPackageName + ")"
                value = value.trim()
                result.add([id: product.id, value: value, type: "Product", quantity: null, group: null,
                        productPackageId: pkg?.id, productPackageName: productPackageName])

            }
            */

        }
        println result
        render result.sort { "${it.group}${it.value}" } as JSON
    }


	def searchPersonByName = {
		def items = []
		def terms = params.term?.split(" ")
		terms?.each{ term ->
			def result = Person.withCriteria {
				or {
					ilike("firstName", term + "%")
					ilike("lastName", term + "%")
					ilike("email", term + "%")
				}
			}
			items.addAll(result)
		}
		items.unique{ it.id }
		def json = items.collect{
			[id: it.id, value: it.name, label: it.name+ " " + it.email]
		}
		render json as JSON
	}

  
	def globalSearch = {
		def items = []
		def terms = params.term?.split(" ")
		terms?.each{ term ->
			
			// Get all products that match terms
			/*
			def personResults = Person.withCriteria {
				or {
					ilike("firstName", term + "%")
					ilike("lastName", term + "%")
					ilike("email", term + "%")
				}
			}
			items.addAll(personResults)
			*/
			
			// Get all inventory items that match terms
			//def inventoryItemResults = InventoryItem.withCriteria { 
			//	or { 
			//		ilike("lotNumber", term + "%")
			//	}
			//}
			//items.addAll(inventoryItemResults)

            // Get all products that match terms
            def inventory = Location.get(session.warehouse.id).inventory
            def productResults = inventoryService.getProductsByTermsAndCategories(terms, [], true, inventory, 25, 0)
            items.addAll(productResults)

			// Get all shipments that match terms
			/*
			def shipmentResults = Shipment.withCriteria {
				or {
					ilike("name", term + "%")
				}
			}
			items.addAll(shipmentResults)
			*/
		}
		
		items.unique{ it.id }
		def json = items.collect{
			def type = it.class.simpleName.toLowerCase()
			[   id: it.id,
                type: it.class,
                url: request.contextPath + "/" + type  + "/redirect/" + it.id,
				value: it.name,
                label: it.productCode + " " + it.name + " [" + (it.manufacturer?it.manufacturer.trim():"${warehouse.message(code:'default.none.label')}") + "]" ]
		}
		render json as JSON
	}
	
	def customerLookup = {
		
		log.info("find vendor by name " + params)
	
		def customers = new TreeSet();
		
		if (params.term) {
			// Match full name

			customers = Company.withCriteria {
				ilike("companyName", "%" +params.term + "%")
				eq("type.id", 11)
			}
			if (!customers) {
				customers = Company.withCriteria {
					ilike("description", "%" + params.term + "%")
					eq("type.id", 11)
				}
			}
		}
		

		// Convert from vendors to json objects
		if (customers) {
			// Make sure items are unique
			//vendors.unique();
			customers = customers.collect() { customer ->
							
				
				
				
				// Convert vendor attributes to JSON object attributes
				[
					customer: customer,
					value: customer.id,
					label: customer?.companyName ,
					valueText: customer?.companyName,
					desc: customer?.description,
					icon: "none"
				]
			}
		}
		
		if (customers.size() == 0) {
			customers << [ value: null, label: warehouse.message(code:'vendors.noVendorFound.message')]
		}

		log.info "Returning " + customers.size() + " results for search " + params.term
		render customers as JSON;
	}
}
