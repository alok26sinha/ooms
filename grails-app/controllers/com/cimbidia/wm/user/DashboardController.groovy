/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.user

import grails.converters.JSON
import java.text.SimpleDateFormat
//import grails.plugin.springcache.annotations.CacheFlush
//import grails.plugin.springcache.annotations.Cacheable



import com.cimbidia.scm.dashboard.Dashboard
import com.cimbidia.wm.order.Order
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.receiving.Receipt

import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.util.LocalizationUtil

import com.cimbidia.wm.core.Comment;
import com.cimbidia.wm.core.Location;
import com.cimbidia.wm.core.Tag;
import com.cimbidia.wm.core.User;
import com.cimbidia.wm.customerOrder.CustomerOrder;
import com.cimbidia.scm.oms.Inventory;
import com.cimbidia.scm.oms.ItemLocation
import com.cimbidia.scm.admin.Company
class DashboardController {
	
	def dataSource
	
	def orderService
	def shipmentService
	def inventoryService
	def productService
       
	def sessionFactory
	
	def showCacheStatistics = {
		def statistics = sessionFactory.statistics
		log.info(statistics)
		render statistics
	}

    /*def showRequisitionStatistics = {
        def user = User.get(session.user.id)
        def location = Location.get(session?.warehouse?.id);
        def statistics = requisitionService.getRequisitionStatistics(location,null,user)
        render statistics as JSON
    }

    def showRequisitionMadeStatistics = {
        def user = User.get(session.user.id)
        def location = Location.get(session?.warehouse?.id);
        def statistics = requisitionService.getRequisitionStatistics(null,location,user)
        render statistics as JSON
    }
*/
    def globalSearch = {
		
		/*def transaction = Transaction.findByTransactionNumber(params.searchTerms)
		if (transaction) { 
			redirect(controller: "inventory", action: "showTransaction", id: transaction.id)
			return;
		}*/
		
		def product = Product.findByProductCodeOrId(params.searchTerms, params.searchTerms)
		if (product) {
			redirect(controller: "inventoryItem", action: "showStockCard", id: product.id)
			return;
		}
		
		/*def requisition = Requisition.findByRequestNumber(params.searchTerms)
		if (requisition) {
			redirect(controller: "requisition", action: "show", id: requisition.id)
			return;
		}*/
		
		def shipment = Shipment.findByShipmentNumber(params.searchTerms)
		if (shipment) {
			redirect(controller: "shipment", action: "showDetails", id: shipment.id)
			return;
		}

		redirect(controller: "inventory", action: "browse", params:params)
			
	}

	def index = {
		redirect(controller: "dashboard", action: "dashboard")
	}
//	@Cacheable("dashboardCache")
	def index1 = {
	log.info "InsideDASHBOARD 12121212121 00000000000"
        def startTime = System.currentTimeMillis()
		if (!session.warehouse) {
			log.info "Location not selected, redirect to chooseLocation"	
			redirect(action: "chooseLocation")			
		}
		
	    def currentUser = User.get(session?.user?.id)
		
		def location = Location.get(session?.warehouse?.id);
		//def recentOutgoingShipments = shipmentService.getRecentOutgoingShipments(location?.id, 7, 7)
		//def recentIncomingShipments = shipmentService.getRecentIncomingShipments(location?.id, 7, 7)
		//def allOutgoingShipments = shipmentService.getShipmentsByOrigin(location)
		//def allIncomingShipments = shipmentService.getShipmentsByDestination(location)
		
		//def expiredStock = inventoryService.getExpiredStock(null, location)
		//def expiringStockWithin30Days = inventoryService.getExpiringStock(null, location, 30)
		//def expiringStockWithin90Days = inventoryService.getExpiringStock(null, location, 90)
		//def expiringStockWithin180Days = inventoryService.getExpiringStock(null, location, 180)
		//def expiringStockWithin365Days = inventoryService.getExpiringStock(null, location, 365)
		//def lowStock = inventoryService.getLowStock(location)
		//def reorderStock = inventoryService.getReorderStock(location)

        // Days to include for activity list
        def daysToInclude = params.daysToInclude?Integer.parseInt(params.daysToInclude):3
        def activityList = []
        def messagesList = []

        // Find recent requisition activity
        /*def requisitions = Requisition.executeQuery("""select distinct r from Requisition r where (r.isTemplate = false or r.isTemplate is null) and r.lastUpdated >= :lastUpdated and (r.origin = :origin or r.destination = :destination)""",
                ['lastUpdated':new Date()-daysToInclude, 'origin':location, 'destination': location])
        requisitions.each {
            def link = "${createLink(controller: 'requisition', action: 'show', id: it.id)}"
            def user = (it.dateCreated == it.lastUpdated) ? it?.createdBy : it?.updatedBy
            def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
            def username = user?.name ?: "${warehouse.message(code: 'default.nobody.label', default: 'nobody')}"
            activityType = "${warehouse.message(code: activityType)}"
            activityList << new DashboardActivityCommand(
                    type: "basket",
                    label: "${warehouse.message(code:'dashboard.activity.requisition.label', args: [link, it.name, activityType, username])}",
                    url: link,
                    dateCreated: it.dateCreated,
                    lastUpdated: it.lastUpdated,
                    requisition: it)
        }*/
				
        // Add recent shipments
		/*def shipments = Shipment.executeQuery( "select distinct s from Shipment s where s.lastUpdated >= :lastUpdated and \
			(s.origin = :origin or s.destination = :destination)", ['lastUpdated':new Date()-daysToInclude, 'origin':location, 'destination':location] );
		shipments.each { 
			def link = "${createLink(controller: 'shipment', action: 'showDetails', id: it.id)}"
			def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
			activityType = "${warehouse.message(code: activityType)}"	
			activityList << new DashboardActivityCommand(
				type: "lorry",
				label: "${warehouse.message(code:'dashboard.activity.shipment.label', args: [link, it.name, activityType])}", 
				url: link,
				dateCreated: it.dateCreated, 
				lastUpdated: it.lastUpdated, 
				shipment: it)
		}*/
		//order by e.createdDate desc
		//[max:params.max.toInteger(), offset:params.offset.toInteger ()]
/*		def shippedShipments = Shipment.executeQuery("SELECT s FROM Shipment s JOIN s.events e WHERE e.eventDate >= :eventDate and e.eventType.eventCode = 'SHIPPED'", ['eventDate':new Date()-daysToInclude])
		shippedShipments.each {
			def link = "${createLink(controller: 'shipment', action: 'showDetails', id: it.id)}"
			def activityType = "dashboard.activity.shipped.label"
			activityType = "${warehouse.message(code: activityType, args: [link, it.name, activityType, it.destination.name])}"
			activityList << new DashboardActivityCommand(
				type: "lorry_go",
				label: activityType,
				url: link,
				dateCreated: it.dateCreated,
				lastUpdated: it.lastUpdated,
				shipment: it)
		}
		def receivedShipment = Shipment.executeQuery("SELECT s FROM Shipment s JOIN s.events e WHERE e.eventDate >= :eventDate and e.eventType.eventCode = 'RECEIVED'", ['eventDate':new Date()-daysToInclude])
		receivedShipment.each {
			def link = "${createLink(controller: 'shipment', action: 'showDetails', id: it.id)}"
			def activityType = "dashboard.activity.received.label"
			activityType = "${warehouse.message(code: activityType, args: [link, it.name, activityType, it.origin.name])}"
			activityList << new DashboardActivityCommand(
				type: "lorry_stop",
				label: activityType,
				url: link,
				dateCreated: it.dateCreated,
				lastUpdated: it.lastUpdated,
				shipment: it)
		}
*/
		def products = Product.executeQuery( "select distinct p from Product p where p.lastUpdated >= :lastUpdated", ['lastUpdated':new Date()-daysToInclude] );
		products.each { 
			def link = "${createLink(controller: 'inventoryItem', action: 'showStockCard', params:['product.id': it.id])}"
			def user = (it.dateCreated == it.lastUpdated) ? it?.createdBy : it.updatedBy
			def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
			activityType = "${warehouse.message(code: activityType)}"
			def username = user?.name ?: "${warehouse.message(code: 'default.nobody.label', default: 'nobody')}"
			activityList << new DashboardActivityCommand(
				type: "package",
				label: "${warehouse.message(code:'dashboard.activity.product.label', args: [link, it.name, activityType, username])}",
				url: link,
				dateCreated: it.dateCreated,
				lastUpdated: it.lastUpdated,
				product: it)
		}
		
		// If the current location has an inventory, add recent transactions associated with that location to the activity list
		/*if (location?.inventory) { 
			def transactions = Transaction.executeQuery("select distinct t from Transaction t where t.lastUpdated >= :lastUpdated and \
				t.inventory = :inventory", ['lastUpdated':new Date()-daysToInclude, 'inventory':location?.inventory] );
			
			transactions.each { 
				def link = "${createLink(controller: 'inventory', action: 'showTransaction', id: it.id)}"
				def user = (it.dateCreated == it.lastUpdated) ? it?.createdBy : it?.updatedBy
				def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
				activityType = "${warehouse.message(code: activityType)}"
				def label = LocalizationUtil.getLocalizedString(it)
				def username = user?.name ?: "${warehouse.message(code: 'default.nobody.label', default: 'nobody')}"
				activityList << new DashboardActivityCommand(
					type: "arrow_switch_bluegreen",
					label: "${warehouse.message(code:'dashboard.activity.transaction.label', args: [link, label, activityType, username])}",
					url: link,
					dateCreated: it.dateCreated,
					lastUpdated: it.lastUpdated,
					transaction: it)
			}
		}*/
		log.info "2183092034120 ACTIVYTUT TOTAL = " + activityList.size()
				
		def users = User.executeQuery( "select distinct u from User u where u.lastUpdated >= :lastUpdated", ['lastUpdated':new Date()-daysToInclude], [max: 10] );
		users.each { 
			def link = "${createLink(controller: 'user', action: 'show', id: it.id)}"
			def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
			if (it.lastUpdated == it.lastLoginDate) { 
				activityType = "dashboard.activity.loggedIn.label"
			}
			activityType = "${warehouse.message(code: activityType)}"

			
			activityList << new DashboardActivityCommand(
				type: "user",
				label: "${warehouse.message(code:'dashboard.activity.user.label', args: [link, it.username, activityType])}",				
				url: link,
				dateCreated: it.dateCreated,
				lastUpdated: it.lastUpdated,
				user: it)
		}


		log.info "BODSODSODSKDOKSODKSODDSDSSDS"
		log.info "111111111 ACTIVYTUT TOTAL = " + activityList.size()
		
		
		
/*		def shipmentsComments = Shipment.createCriteria().listDistinct { 
			comments {
				gt ( "dateCreated", new Date() - 103 )
			}
		}*/

		
		//log.info " J38403204 " + shipmentsComments
		
		/*shipmentsComments.each {
			def shipment = it
			shipment.comments.each {
			
				def shipmentName = shipment.shipmentNumber
				def link = "${createLink(controller: 'shipment', action: 'show', id: shipment.id)}"
				
				def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
				activityType = "${warehouse.message(code: activityType)}"
	
				def messageComment = it.sender?.toString() + " said '" + it.comment.toString() + "' on Shipment <a href=${createLink(controller: 'shipment', action: 'show', id: shipment.id)}>" + shipment.shipmentNumber + "</a>"
				log.info " MESASHAKSH = " + messageComment
				
				messagesList << new DashboardActivityCommand(
					user: it.sender,
					type: "comment",
					label: messageComment ,				
					url: link,
					dateCreated: it.dateCreated,
					lastUpdated: it.lastUpdated,
					comment: it)
			}
		}
		*/


		/*def orderComments = Order.createCriteria().listDistinct { 
			comments {
				gt ( "dateCreated", new Date() - 103 )
			}
		}*/

		
		//log.info " J38403204 orderComments = " + orderComments
		
		/*orderComments.each {
			def order = it
			order.comments.each {
			
				def orderName = order.description
				def link = "${createLink(controller: 'order', action: 'show', id: order.id)}"
				
				def activityType = (it.dateCreated == it.lastUpdated) ? "dashboard.activity.created.label" : "dashboard.activity.updated.label"
				activityType = "${warehouse.message(code: activityType)}"
	
				def messageComment = it.sender?.toString() + " said '" + it.comment.toString() + "' on Order <a href=${createLink(controller: 'order', action: 'show', id: order.id)}>" + order.description + "</a>"
				log.info " MESASHAKSH = " + messageComment
				
				messagesList << new DashboardActivityCommand(
					user: it.sender,
					type: "comment",
					label: messageComment ,				
					url: link,
					dateCreated: it.dateCreated,
					lastUpdated: it.lastUpdated,
					comment: it)
			}
		}*/
		

		log.info " BOOOOOOOOOOOOO Comment FOund "
		
		

		//activityList = activityList.groupBy { it.lastUpdated }
        def activityListTotal = 0
		def startIndex = 0
        def endIndex = 0
        log.info "I AM HEREEEEEEEEEE1" + activityList.size()
/*	activityList.each {
		
		log.info "Message Type ====================== " + it.type
		log.info "Message itself ****************** " + it.label
		if ( it.type == "comment" )
			messagesList.add ( it )
			
	}
*/	if ( messagesList )
		messagesList = messagesList.sort{ it.lastUpdated }.reverse()
	def messagesListTotal = messagesList?.size()

        if (activityList) {
        	log.info "I AM HEREEEEEE2321321E = " + activityList.size()
            activityList = activityList.sort { it.lastUpdated }.reverse()
            activityListTotal = activityList.size()
            startIndex = params.offset?Integer.valueOf(params.offset):0
            endIndex = (startIndex + (params.max?Integer.valueOf(params.max):10))
            if (endIndex > activityListTotal) endIndex = activityListTotal
            endIndex -= 1
    	    activityList = activityList[startIndex..endIndex]
        }

	
    		log.info "39209 ACTIVYTUT LIST = " + activityList
    		
    		log.info "48482 ACTIVYTUT LIST TOTAL = " + activityList.size()

        log.info "dashboard.index Response time: " + (System.currentTimeMillis() - startTime) + " ms"
		//def outgoingOrders = orderService.getOutgoingOrders(location)
		//def incomingOrders = orderService.getIncomingOrders(location)
		log.info "BOOMM BOOM COMING OUT Response time: " + (System.currentTimeMillis() - startTime) + " ms"

		
		[ 	//outgoingShipments : recentOutgoingShipments, 
			//incomingShipments : recentIncomingShipments,
			//allOutgoingShipments : allOutgoingShipments,
			//allIncomingShipments : allIncomingShipments,
			//outgoingOrders : outgoingOrders,
			//incomingOrders : incomingOrders,
			//expiredStock : expiredStock,
			//expiringStockWithin30Days : expiringStockWithin30Days,
			//expiringStockWithin90Days : expiringStockWithin90Days,
			//expiringStockWithin180Days : expiringStockWithin180Days,
			//expiringStockWithin365Days : expiringStockWithin365Days,
			//lowStock: lowStock,
			//reorderStock: reorderStock,
			rootCategory : productService.getRootCategory(),

            /*requisitionStatistics: requisitionService.getRequisitionStatistics(location, null, params.onlyShowMine?currentUser:null),
            requisitions: [],*/
            //requisitions:  requisitionService.getAllRequisitions(session.warehouse),

            //outgoingOrdersByStatus: orderService.getOrdersByStatus(outgoingOrders),
			//incomingOrdersByStatus: orderService.getOrdersByStatus(incomingOrders),
			//outgoingShipmentsByStatus : shipmentService.getShipmentsByStatus(recentOutgoingShipments),
			//incomingShipmentsByStatus : shipmentService.getShipmentsByStatus(recentIncomingShipments),

			activityList : activityList,
			activityListTotal : activityListTotal,
			messagesList : messagesList,
			messagesListTotal : messagesListTotal,
			startIndex: startIndex,
			endIndex: endIndex,
			daysToInclude: daysToInclude,
            		tags:productService?.getAllTags()?.sort { it.tag }
		]
		
	}


    def expirationSummary = {
        def location = Location.get(session.warehouse.id)
        def results = inventoryService.getExpirationSummary(location)

        render results as JSON
    }

    def hideTag = {
        Tag tag = Tag.get(params.id)
        tag.isActive = false
        tag.save(flush:true)
        redirect(controller: "dashboard", action: "index", params: [editTags:true])
    }
	
	def dashboard = {
		Dashboard dashboard = new Dashboard()
		dashboard.newOrderCount = Order.countByStatus("NEW")
		dashboard.inTansitShipCount = Shipment.countByShipStatus("InTransit")
		dashboard.committedCustOrderCount = CustomerOrder.countByStatus("ALLOCATED")
		dashboard.acknowledgeCustOrderCount = CustomerOrder.countByStatus("NEW")
		dashboard.unCommittedCustomerOrderCount = CustomerOrder.countByStatus("ACKNOWLEDGED")
		dashboard.backOrderedCustomerOrderCount = CustomerOrder.countByStatus("BACKORDERED")
		dashboard.belowSafetyStock = 0.0//Inventory.countByDeltaLessThan("0.0d")
		dashboard.daysOpen =  Order.countByDaysOpenGreaterThan("30")
		dashboard.unassignedShipmentCount =  Shipment.countByCarrierCompany(null)
		//dashboard.committedCustOrderCount = CustomerOrder.countByStatus("ALLOCATED")
		//print("**************"+dashboard.newOrderCount)
		
		def company = session?.company
		def locations=Location.findAllByCompany(company)
		def date = new Date()
		def sku =  params.skuList
		
		
		def itemLocations = ItemLocation.createCriteria().list{
			projections {
				property("id", "id")
			}
			
		}
	
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		
		for(int i=1; i<10; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int x=0; x<itemLocations.size(); x++){
				oh = map.get(itemLocations.get(x))
				Inventory inv = inventoryService.getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
				oh=inv.net;
				map.put(itemLocations.get(x), oh)
				inventories.add(inv);
			}
		}
		HashSet<String> skuList = null;
		String dailyChart =  inventoryService.getDailyData(inventories,date,sku, skuList)
		
		String weeklyChart =   inventoryService.getDailyData(inventories,date, sku, skuList)
	
		//render(template: "/dashboard/chart",model : [locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList])

		
		
		
		render(view: "dashboard", model: [dashboard: dashboard, locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList]);
	}
	
	
	def dashboard2 = {
		Dashboard dashboard = new Dashboard()
		dashboard.newOrderCount = Order.countByStatus("NEW")
		dashboard.inTansitShipCount = Shipment.countByShipStatus("InTransit")
		dashboard.committedCustOrderCount = CustomerOrder.countByStatus("ALLOCATED")
		dashboard.acknowledgeCustOrderCount = CustomerOrder.countByStatus("NEW")
		dashboard.unCommittedCustomerOrderCount = CustomerOrder.countByStatus("ACKNOWLEDGED")
		dashboard.backOrderedCustomerOrderCount = CustomerOrder.countByStatus("BACKORDERED")
		dashboard.belowSafetyStock = 0.0//Inventory.countByDeltaLessThan("0.0d")
		dashboard.daysOpen =  Order.countByDaysOpenGreaterThan("30")
		dashboard.unassignedShipmentCount =  Shipment.countByCarrierCompany(null)
		//dashboard.committedCustOrderCount = CustomerOrder.countByStatus("ALLOCATED")
		//print("**************"+dashboard.newOrderCount)
		
		def company = session?.company
		def locations=Location.findAllByCompany(company)
		def date = new Date()
		def sku =  params.skuList
		
		
		def itemLocations = ItemLocation.createCriteria().list{
			projections {
				property("id", "id")
			}
			
		}
	
		HashMap<ItemLocation, Double> map = new HashMap<ItemLocation, Double>();
		for(int i=0; i<itemLocations.size(); i++){
				map.put(itemLocations.get(i), null)
		}
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy")
		def inventories = new ArrayList<Inventory>();
		Date d = date;
		date= d.minus(1)
		Double oh = null
		
		for(int i=1; i<10; i++){
			d = date.plus(i);
			
			String stringDate  = formatter.format(d);
			
			for(int x=0; x<itemLocations.size(); x++){
				oh = map.get(itemLocations.get(x))
				Inventory inv = inventoryService.getSafetyStockForDateSequential(stringDate, itemLocations.get(x), oh);
				oh=inv.net;
				map.put(itemLocations.get(x), oh)
				inventories.add(inv);
			}
		}
		HashSet<String> skuList = null;
		String dailyChart =  inventoryService.getDailyData(inventories,date,sku, skuList)
		
		String weeklyChart =   inventoryService.getDailyData(inventories,date, sku, skuList)
	
		//render(template: "/dashboard/chart",model : [locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList])

		
		
		
		render(view: "dashboard2", model: [dashboard: dashboard, locations : locations,productList:Product.getAll(),inventoryInstanceList: inventories, inventoryInstanceTotal: inventories.size(),chartdate:dailyChart,weeklyChart:weeklyChart,skuList:skuList]);
	}
	def message = {
		Dashboard dashboard = new Dashboard()
		render(view: "../message/loadMessage", model: [dashboard: dashboard]);
	}
	def status = { 
	
		log.info "BODSODSODSKDOKSODKSODDSDSSDS"
		
		def admin = User.get(1)
		def comments = Comment.findAllBySenderAndRecipient(admin, admin) 
		log.info " J38403204 " + comments
		
		def results = comments.collect {
			if (it.dateSent > new Date()) { 
				[ id: it.id, comment: warehouse.message(code:it.comment, args: [format.datetime(obj: it.dateSent)]), dateSent: it.dateSent ]
			}
		}
		render results as JSON
	}

//    @Cacheable("megamenuCache")
	def megamenu = {
	
        long currentTime = System.currentTimeMillis()
        log.info "BOBBOOOO1  dashboard " + (System.currentTimeMillis() - currentTime) + " ms"

        def user = User.get(session?.user?.id)
        def location = Location.get(session?.warehouse?.id)

      //   def startTime = System.currentTimeMillis()

        // Shipments
		//def incomingShipments = Shipment.findAllByDestination(location).groupBy{it.status.code}.sort()
        //def incomingShipmentsCount = Shipment.countByDestination(location)

		//def outgoingShipments = Shipment.findAllByOrigin(location).groupBy{it.status.code}.sort();
        //def outgoingShipmentsCount = Shipment.countByOrigin(location)
        // Orders
		//def incomingOrders = Order.executeQuery('select o.status, count(*) from Order as o where o.destination = ? group by o.status', [location])


        log.info "BOBBOOOO2  dashboard " + (System.currentTimeMillis() - currentTime) + " ms"

        // Requisitions
        //def incomingRequests = requisitionService.getRequisitions(session?.warehouse).groupBy{it?.status}.sort()
		//def outgoingRequests = requisitionService.getRequisitions(session?.warehouse).groupBy{it?.status}.sort()
        //def incomingRequests = [:] //requisitionService.getAllRequisitions(session.warehouse).groupBy{it?.status}.sort()
        //def outgoingRequests = []
        //def requisitionTemplates = [] //requisitionService.getAllRequisitionTemplates(session.warehouse)
        //Requisition requisition = new Requisition(destination: session?.warehouse, requestedBy:  session?.user)
        //def myRequisitions = requisitionService.getRequisitions(requisition, [:])
        //def requisitionStatistics = requisitionService.getRequisitionStatistics(location,null,user)

        def categories = []
		def category = productService.getRootCategory()		
		categories = category.categories
		categories = categories.groupBy { it?.parentCategory }

        //println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Megamenu: " + (System.currentTimeMillis() - startTime) + " ms"

		[
			categories: categories,
			//incomingShipments: incomingShipments,
            //incomingShipmentsCount: incomingShipmentsCount,
           // outgoingShipments: outgoingShipments,
			//outgoingShipmentsCount: outgoingShipmentsCount,
			//incomingOrders: incomingOrders,
            //requisitionStatistics: requisitionStatistics,
			//incomingRequests: incomingRequests,
			//outgoingRequests: outgoingRequests,
            //requisitionTemplates: requisitionTemplates,
            //myRequisitions: myRequisitions,
			quickCategories:productService.getQuickCategories(),
			tags:productService.getAllTags()
		]

		
	}
	
	
	def menu = { 
		//def incomingShipments = Shipment.findAllByDestination(session?.warehouse).groupBy{it.status.code}.sort()
		//def outgoingShipments = Shipment.findAllByOrigin(session?.warehouse).groupBy{it.status.code}.sort();
		def incomingOrders = Order.executeQuery('select o.status, count(*) from Order as o where o.destination = ? group by o.status', [session?.warehouse])
		/*def incomingRequests = Requisition.findAllByDestination(session?.warehouse).groupBy{it.status}.sort()
		def outgoingRequests = Requisition.findAllByOrigin(session?.warehouse).groupBy{it.status}.sort()
		*/
		[//incomingShipments: incomingShipments, 
			//outgoingShipments: outgoingShipments, 
			incomingOrders: incomingOrders, 
			incomingRequests: incomingRequests,
			outgoingRequests: outgoingRequests,
			quickCategories:productService.getQuickCategories()]
	}

//    @CacheFlush(["dashboardCache", "megamenuCache"])
    def flushCache = {
        flash.message = "Cache has been flushed"
        redirect(action: "index")
    }

	def chooseLayout = {
		if (params.layout) { 
			session.layout = params.layout
		}
		redirect(controller:'dashboard', action:'index')
	}
	
	def chooseLocation = {
		log.info params
		def warehouse = null;
			
		// If the user has selected a new location from the topnav bar, we need 
		// to retrieve the location to make sure it exists
		if (params.id != 'null') {			
			warehouse = Location.get(params.id);
		}

		// If a warehouse has been selected
		if (warehouse) {
			
			// Reset the locations displayed in the topnav
			session.loginLocations = null
			
			// Save the warehouse selection to the session
			session.warehouse = warehouse;
			
			// Save the warehouse selection for "last logged into" information
			if (session.user) {
				def userInstance = User.get(session.user.id);
				userInstance.rememberLastLocation = Boolean.valueOf(params.rememberLastLocation)
				userInstance.lastLoginDate = new Date();
				if (userInstance.rememberLastLocation) { 
					userInstance.warehouse = warehouse 
				}
				userInstance.save(flush:true);
				session.user = userInstance;
			}			
			
			// Successfully logged in and selected a warehouse
			// Try to redirect to the previous action before session timeout
			if (session.targetUri || params.targetUri) {
				log.info("session.targetUri: " + session.targetUri)
				log.info("params.targetUri: " + params.targetUri)
				def targetUri = params.targetUri ?: session.targetUri 
				log.info("Redirecting to " + targetUri);
				if (targetUri && !targetUri.contains("chooseLocation")) { 
					redirect(uri: targetUri);
					return;
				}
			}
			log.info("Redirecting to dashboard");
			redirect(controller:'dashboard', action:'index')
		}
		else {	
			List warehouses = Location.findAllWhere("active":true)
			render(view: "chooseLocation", model: [warehouses: warehouses])
		}
		
	}
    
}


class DashboardCommand { 
	
	List<DashboardActivityCommand> activityList;
	
	
}


class DashboardActivityCommand { 

	String label
	String type	
	String url
	
	User user
	Shipment shipment
	Receipt receipt

	Product product
	
	Comment	comment
	
	Date lastUpdated
	Date dateCreated
	
	
	String getActivityType() { 
		return lastUpdated == dateCreated ? "created" : "updated"
	}
	
	String toString() {
		return 
			user?.userid ":" +
			comment?.comment
	}
}