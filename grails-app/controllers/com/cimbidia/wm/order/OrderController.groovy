/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.order


import org.apache.commons.lang.RandomStringUtils

import com.cimbidia.wm.core.Address
import com.cimbidia.wm.core.Comment
import com.cimbidia.wm.core.Document
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.OrderSizes
import com.cimbidia.wm.core.Person
import com.cimbidia.wm.core.UnitOfMeasure
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.ShipmentItem
import com.cimbidia.wm.shipment.ShipmentType
import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.collab.Message

// import java.util.Date

class OrderController {
	
	def userService
	def orderService
	def shipmentService
	def transportationOrderService
    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
	
	def count(String status){
		
	}

    def list = {
		
		def suppliers = orderService.getSuppliers().sort();
		def locations = []
		def locationsArray = Location.createCriteria().listDistinct{
			or {
				eq ("manager", session.user )
				manager {
					locationRoles {
					'in' ( 'user',session.user)
					}
				}
				employees {
					locationRoles {
					'in' ( 'user',session.user)
					}
				}
			}
		
		}
		
		
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		
		
		locationsArray.each{
			locations << it
		}
		
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		
		def destination = params.destination ? Location.get(params.destination) : null
		def orderNumber = params.orderNumber
		Integer seller = 0
		try{
			  seller = new Integer(params?.seller?.id)
		}
		catch(NumberFormatException nfe){
			
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		
		def origin = params.origin ? Location.get(params.origin) : null
		def status = params.status ? Enum.valueOf(OrderStatus.class, params.status) : null
		def statusStartDate = params.statusStartDate ? Date.parse("MM/dd/yyyy", params.statusStartDate) : null
		def statusEndDate = params.statusEndDate ? Date.parse("MM/dd/yyyy", params.statusEndDate) : null
		//def priority = params.priorityNumber
		def mode=params.shipmentType
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
	
		
		def orders
		def totalsize = 0;
		if ( origin || destination ) {
			orders = orderService.getOrdersPlacedByLocation(companyId, seller, origin, destination, status, statusStartDate, statusEndDate, orderBy, colName);
			totalsize = orders?.size();
			def highIndex = lowerIndex + 10;
			if(highIndex > totalsize) highIndex = totalsize;
			if(orders?.size() >10)
				orders = orders.subList(lowerIndex, highIndex);
			
		} else {	
			orders = orderService.getOrders(companyId, orderNumber, seller, locations,status, statusStartDate, statusEndDate, orderBy, colName);
			totalsize = orders?.size();
			def highIndex = lowerIndex + 10;
			if(highIndex > totalsize) highIndex = totalsize;
			if(orders?.size() >10)
				orders = orders.subList(lowerIndex,highIndex);
		}
		log.info "WER E ATHE TWORLD = " + orders?.size()
		
		// sort by order date
		/*orders = orders.sort( { a, b ->
			return b.dateOrdered <=> a.dateOrdered
		} )*/

		render (view: "list", model:[ orders:orders, origin:origin?.id, destination:destination?.id,
		  status:status, statusStartDate:statusStartDate, statusEndDate:statusEndDate,
		  suppliers : suppliers, orderInstanceTotal:totalsize
		]);
    }
    
	def listByDaysOpen = {
		def daysOpen = params.daysOpen? params.daysOpen: 30;
		
		def pos = Order.createCriteria().list {
			and  {
				gt("daysOpen", 30)
				}
			
		}
		
		 render(view: "list", model: [orders: pos, orderInstanceTotal:pos.size()])
	}
    def listNewMessages = {
    	    
		def orders = Order.createCriteria().listDistinct {
			and {
				comments { gt("dateCreated", new Date() - 3) }
				if (userService.isUserSupplier(com.cimbidia.wm.auth.AuthService.currentUser.get())){ ne("status", OrderStatus.NEW) }
			}
		}
		def result = [orders: orders]
		// sort by order date
		orders = orders.sort( { a, b ->
			return b.dateOrdered <=> a.dateOrdered
		} )

		            render(view: "list", model: 
		            		[ orders:orders
		])
		
		//render result as grails.converters.JSON
  	    
    }

	/*def listOrderItems = { 
		def orderItems = OrderItem.getAll().findAll { !it.isCompletelyFulfilled() } ;		
		return [orderItems : orderItems]		
	}*/
	
   /* def create = {
		redirect(controller: 'purchaseOrderWorkflow', action: 'index');
    }*/
	def create = {
		def orderInstance = new Order()
		orderInstance.properties = params
		return [orderInstance: orderInstance]
	}
	def createtest = {
		def orderInstance = new Order()
		orderInstance.properties = params
		render(view: "createtest", model: [orderInstance: orderInstance])
	}
	
	
    def save = {
		
		
        def orderInstance = new Order(params)
		
		Integer companyId = params.companyId ? params.companyId : 1
		orderInstance.company=Company.findById( companyId)
		//orderInstance.company.id=companyId
		
	     //orderInstance.id = abc++			
		def _toBeRemoved = orderInstance.orderItems.findAll {!it}

		// if there are orderItems to be removed
		if (_toBeRemoved) {
			orderInstance.orderItems.removeAll(_toBeRemoved)
		 }
		
		//update my indexes
		orderInstance.orderItems.eachWithIndex(){oi, i ->
			
			if(oi){
				//orderInstance.addToOrderItems(oi)
				println(oi)
			}
			/*if ( oi.productName ) {
				
				def product = Product.findByName( oi.productName )
				if (product) {
					oi.description = product.name
					oi.category = product.category
					oi.product = product
				}
			}
			else if (params?.category?.id) {
				def category = Category.get(params?.category?.id)
				if (category) {
					orderItem.description = category.name
					//orderItem.category = category
				}
			} else {
				println "errors with product/category " + params
			}*/
		}
		/*
		if (!orderService.saveOrder(orderInstance)) {
			return error()
			
		}*/
		
		if(orderInstance.validate() && !orderInstance.hasErrors()){
			
			if (orderInstance?.toAddress?.id !=null) {
				//println("to address ***********"+orderInstance?.toAddress?.id)
				def toAdd = Address.findById(orderInstance?.toAddress?.id?.trim())
				//println("toAdd"+toAdd)
				orderInstance.toAddress = toAdd
				//orderInstance.toAddress.attach();
				
			}
			
			if (orderInstance?.fromAddress?.id!= null) {
				//println("fromAddress ***********"+orderInstance?.fromAddress?.id)
				def fromAdd = Address.findById(orderInstance?.fromAddress?.id?.trim())
				//println("fromAdd"+fromAdd)
				orderInstance.fromAddress = fromAdd
				//orderInstance.fromAddress.attach();
				
			}
			
	        if (orderService.saveOrder(orderInstance)) {
	
	            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
	            redirect(action: "show", id: orderInstance.id)
	        }
		}
        else {
            render(view: "create", model: [orderInstance: orderInstance])
        }
		
		
    }
	
    def show = {
		
		def orderInstance = Order.get(params.id)
		 if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
        else {
			def uomList = UnitOfMeasure.findAllByInheritOnOrderIsNotNull([sort:"inheritOnOrder", order:"asc"])
			log.info(" uomList is "+uomList.size())
            [orderInstance: orderInstance, uomList: uomList ]
        }
    }

    def edit = {
		
		
        def orderInstance = Order.get(params.id)
		/*orderInstance.orderItems.eachWithIndex(){oi, i ->
			if(oi.product)
			oi.productName=oi.product.name
			
		}*/
        if (!orderInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [orderInstance: orderInstance]
        }
    }

	def placeOrder = { 
		def orderInstance = Order.get(params.id)
		if (orderInstance) {
			
			if (orderInstance?.orderItems?.size() > 0) { 
				orderInstance.status = OrderStatus.PLACED;
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'order.orderHasBeenPlacedWithVendor.message', args: [orderInstance?.description, orderInstance?.origin?.name])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					flash.message = "${warehouse.message(code: 'order.errorPlacingOrder.message')}"
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
			else { 
				flash.message = "${warehouse.message(code: 'order.order.mustContainAtLeastOneItem.message.message')}"
				redirect(action: "show", id: orderInstance.id)
			}
		}
		else { 
			redirect("show", id: orderInstance?.id)
			
		}
				
	}

	def acceptOrder = { 
		def orderInstance = Order.get(params.id)
		if (orderInstance) {

			if (orderInstance?.orderItems?.size() > 0) { 
				orderInstance.status = OrderStatus.ACCEPTED;
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'order.orderHasBeenPlacedWithVendor.message', args: [orderInstance?.description, orderInstance?.origin?.name])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					flash.message = "${warehouse.message(code: 'order.errorPlacingOrder.message')}"
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
			else { 
				flash.message = "${warehouse.message(code: 'order.order.mustContainAtLeastOneItem.message.message')}"
				redirect(action: "show", id: orderInstance.id)
			}
		}
		else { 
			redirect("show", id: orderInstance?.id)

		}

	}
	

	def markReadyToShip = { 
		def orderInstance = Order.get(params.id)
		if (orderInstance) {
			orderInstance.orderItems?.each() { orderitem -> 
				log.info "Inside the called function DINK DINK"
				log.info "params: " + params
		
				def orderRTS = new RTS( )
				orderRTS.rtsQuantity = orderitem.quantity
				orderRTS.rtsWeight = orderitem.weight
				orderRTS.rtsVolume = orderitem.volume
				orderRTS.pickupStart = orderInstance.dateOrdered
				orderRTS.pickupEnd = orderInstance.dateOrdered + 1				
				log.info "Order Item = " + orderitem
				
				orderRTS.description = orderitem.description
				orderRTS.product = orderitem.product
				orderInstance.addToOrderItemsRTS(orderRTS)

				
			}
			if (!orderService.saveOrder(orderInstance)) {
				return error()
			} 
			else {
				flash.message = "${warehouse.message(code: 'order.orderHasBeenMarkedReadyToShip.message', args: [orderInstance?.description, orderInstance?.origin?.name])}"
				redirect(action: "show", id: orderInstance.id)
			}

		}

	}

	def createTransportationOrder = { 
		def orderInstance = Order.get(params.id)
		if (orderInstance) {
			orderInstance.orderItems?.each() { orderitem -> 
				log.info "Inside the called function DINK DINK"
				log.info "params: " + params
		
				def orderDelivery = new OrderDelivery( )
				orderDelivery.deliveryQuantity = orderitem.quantity
				orderDelivery.size1 = orderitem.size1
				orderDelivery.size2 = orderitem.size2
				orderDelivery.size3 = orderitem.size3
				orderDelivery.pickupDt = orderInstance.dateOrdered
				orderDelivery.deliveryDt = orderInstance.dateOrdered + 15 //TBD put this on the Product Parameter.				
				log.info "Order Item = " + orderitem
				orderDelivery.requestedBy = Person.get(session.user.id)
				orderDelivery.category = orderitem.category
				orderDelivery.description = orderitem.description
				orderDelivery.product = orderitem.product
				orderDelivery.inventoryItem = orderitem.inventoryItem
				orderDelivery.status = DeliveryStatus.UNPLANNED

				orderInstance.addToOrderDelivery(orderDelivery)

				
			}
			if (!orderService.saveOrder(orderInstance)) {
				return error()
			} 
			else {
				flash.message = "${warehouse.message(code: 'order.orderHasBeenMarkedReadyToShip.message', args: [orderInstance?.description, orderInstance?.origin?.name])}"
				redirect(action: "show", id: orderInstance.id)
			}

		}

	}
	def releasePO = {
		def orderInstance = Order.get(params.id)
		orderInstance.setStatus(OrderStatus.RELEASED)
		if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
			
			flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
			redirect(action: "show", id: orderInstance.id)
		}
		else {
			
			render(view: "edit", model: [orderInstance: orderInstance])
		}
	}
	def counterPO = {
		def orderInstance = Order.get(params.id)
		orderInstance.setStatus(OrderStatus.COUNTERED)
		if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
			
			flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
			redirect(action: "show", id: orderInstance.id)
		}
		else {
			
			render(view: "edit", model: [orderInstance: orderInstance])
		}
	}
	def rejectPO = {
		def orderInstance = Order.get(params.id)
		orderInstance.setStatus(OrderStatus.REJECTED)
		if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
			
			flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
			redirect(action: "show", id: orderInstance.id)
		}
		else {
			
			render(view: "edit", model: [orderInstance: orderInstance])
		}
	}
	def acceptPO = {
		def orderInstance = Order.get(params.id)
		orderInstance.setStatus(OrderStatus.OPEN)
		if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
			
			flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
			redirect(action: "show", id: orderInstance.id)
		}
		else {
			
			render(view: "edit", model: [orderInstance: orderInstance])
		}
	}
    def update = {
		
        def orderInstance = Order.get(params.id)
		
		//orderInstance.id = abc++
		def _toBeRemoved = orderInstance?.orderItems?.findAll {!it}

		// if there are orderItems to be removed
		if (_toBeRemoved) {
			orderInstance?.orderItems?.removeAll(_toBeRemoved)
		 }
		
		
		
		//update my indexes
		/*orderInstance?.orderItems?.eachWithIndex(){oi, i ->
			
			if(oi){
				oi.order_items_index = i
			}
			if ( oi.productName ) {
				def product = Product.findByName( oi.productName )
				
				if (product) {
					oi.description = product.name
					oi.category = product.category
					oi.product = product
				}
			}
			else {
				println "errors with product/category " + params
			}
		}*/
        if (orderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (orderInstance.version > version) {
                    
                    orderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'order.label', default: 'Order')] as Object[], "Another user has updated this Order while you were editing")
                    render(view: "edit", model: [orderInstance: orderInstance])
                    return
                }
            }
            orderInstance.properties = params
					
			// find the items that are marked for deletion
			def _toBeDeleted = orderInstance.orderItems.findAll {it?.deleted || !it}

			// if there are items to be deleted remove them all
			if (_toBeDeleted) {
				orderInstance.orderItems.removeAll(_toBeDeleted)
			}
			
			//update my indexes
			/*orderInstance.orderItems.eachWithIndex(){oi, i ->
				if(oi)
					oi.order_items_index = i
			}*/
			if (!orderInstance.hasErrors()){
				
				if (orderInstance?.toAddress?.id !=null) {
					//println("to address ***********"+orderInstance?.toAddress?.id)
					def toAdd = Address.findById(orderInstance?.toAddress?.id?.trim())
					//println("toAdd"+toAdd)
					orderInstance.toAddress = toAdd
					//orderInstance.toAddress.attach();
					
				}
				
				if (orderInstance?.fromAddress?.id!= null) {
					//println("fromAddress ***********"+orderInstance?.fromAddress?.id)
					def fromAdd = Address.findById(orderInstance?.fromAddress?.id?.trim())
					//println("fromAdd"+fromAdd)
					orderInstance.fromAddress = fromAdd
					//orderInstance.fromAddress.attach();
					
				}
	            if ( orderInstance.save(flush: true)) {
								
	                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
	                redirect(action: "show", id: orderInstance.id)
	            }
	            else {
					println(orderInstance.errors)		
	                render(view: "edit", model: [orderInstance: orderInstance])
	            }
			}
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
    }


	
	
    def delete = {
        def orderInstance = Order.get(params.id)
        if (orderInstance) {
            try {
                orderInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
    }
	
	

	
	def addComment = { 
        def orderInstance = Order.get(params?.id)
        if (!orderInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [orderInstance: orderInstance, commentInstance: new Comment()]
        }
	}
	
	def editComment = {
		def orderInstance = Order.get(params?.order?.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else {
			def commentInstance = Comment.get(params?.id)
			if (!commentInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), commentInstance.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			render(view: "addComment", model: [orderInstance: orderInstance, commentInstance: commentInstance])
		}
	}
	
	def deleteComment = { 
		def orderInstance = Order.get(params.order.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.order.id])}"
			redirect(action: "list")
		}
		else {
			def commentInstance = Comment.get(params?.id)
			if (!commentInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), params.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			else { 
				orderInstance.removeFromComments(commentInstance);
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
		}		
	}

	def deleteRTSLine = { 
		def orderInstance = Order.get(params.order.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.order.id])}"
			redirect(action: "list")
		}
		else {
			def rtsInstance = RTS.get(params?.id)
			if (!rtsInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), params.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			else { 
				orderInstance.removeFromOrderItemsRTS(rtsInstance);
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
		}		
	}

	def deleteDelivery = { 
		def orderInstance = Order.get(params.order.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.order.id])}"
			redirect(action: "list")
		}
		else {
			def deliveryInstance = OrderDelivery.get(params?.id)
			if (!deliveryInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), params.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			else { 
				orderInstance.removeFromOrderDelivery(deliveryInstance);
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
		}		
	}
	
	def saveComment = { 
		log.info(params)
		
		def orderInstance = Order.get(params?.order?.id)
		if (orderInstance) { 
			def commentInstance = Comment.get(params?.id)
			if (commentInstance) { 
				commentInstance.properties = params
				commentInstance.sender = com.cimbidia.wm.auth.AuthService.currentUser.get()
				if (!commentInstance.hasErrors() && commentInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), commentInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "addComment", model: [orderInstance: orderInstance, commentInstance: commentInstance])
				}
			}
			else { 
				commentInstance = new Comment(params)
				commentInstance.sender = com.cimbidia.wm.auth.AuthService.currentUser.get()
				orderInstance.addToComments(commentInstance);
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "addComment", model: [orderInstance: orderInstance, commentInstance:commentInstance])
				}
			}
		}	
		else { 
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		
	}

	def addDocument = {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [orderInstance: orderInstance]
		}
	}
	
	def editDocument = {
		def orderInstance = Order.get(params?.order?.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else {
			def documentInstance = Document.get(params?.id)
			if (!documentInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'document.label', default: 'Document'), documentInstance.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			render(view: "addDocument", model: [orderInstance: orderInstance, documentInstance: documentInstance])
		}
	}
	
	def deleteDocument = {
		def orderInstance = Order.get(params.order.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.order.id])}"
			redirect(action: "list")
		}
		else {
			def documentInstance = Document.get(params?.id)
			if (!documentInstance) {
				flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'comment.label', default: 'Comment'), params.id])}"
				redirect(action: "show", id: orderInstance?.id)
			}
			else {
				orderInstance.removeFromDocuments(documentInstance);
				if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
					flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), orderInstance.id])}"
					redirect(action: "show", id: orderInstance.id)
				}
				else {
					render(view: "show", model: [orderInstance: orderInstance])
				}
			}
		}
	}
	
	def receive = {		
		def orderCommand = orderService.getOrder(params.id, session.user.id)
		if (!orderCommand.order) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else { 
			return [orderCommand: orderCommand]
		}
	}
	
	def saveOrderShipment = { OrderCommand command ->	
		bindData(command, params)		
		def orderInstance = Order.get(params?.order?.id);
		command.order = orderInstance;
		
		orderService.saveOrderShipment(command)
		
		// If the shipment was saved, let's redirect back to the order received page
		if (!command?.shipment?.hasErrors() && command?.shipment?.id) {
			redirect(controller: "order", action: "receive", id: params?.order?.id)
		}
		
		// Otherwise, we want to display the errors, so we need to render the page.
		render(view: "receive", model: [orderCommand: command])
	}

	def addOrderShipment = {  
		def orderCommand = orderService.getOrder(params.id, session.user.id)
		int index = Integer.valueOf(params?.index)
		def orderItemToCopy = orderCommand?.orderItems[index]
		if (orderItemToCopy) { 
			def orderItemToAdd = new OrderItemCommand();
			orderItemToAdd.setPrimary(false)
			orderItemToAdd.setType(orderItemToCopy.type)
			orderItemToAdd.setDescription(orderItemToCopy.description)
			orderItemToAdd.setLotNumber(orderItemToCopy.lotNumber);
			orderItemToAdd.setOrderItem(orderItemToCopy.orderItem)
			orderItemToAdd.setProductReceived(orderItemToCopy.productReceived)
			orderItemToAdd.setQuantityOrdered(orderItemToCopy.quantityOrdered)
			
			orderCommand?.orderItems?.add(index+1, orderItemToAdd);
		}
		render(view: "receive", model: [orderCommand: orderCommand])
		//redirect(action: "receive")
	} 
	
	def removeOrderShipment = { 
		log.info("Remove order shipment " + params)
		def orderCommand = session.orderCommand
		int index = Integer.valueOf(params?.index)
		orderCommand.orderItems.remove(index)

		//render(view: "receive", model: [orderCommand: orderCommand])
		redirect(action: "receive")
	}
		

	def fulfill = {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [orderInstance: orderInstance]
		}
	}

	def addOrderItemToShipment = { 
		
		def orderInstance = Order.get(params?.id)
		def orderItem = OrderItem.get(params?.orderItem?.id)
		def shipmentInstance = Shipment.get(params?.shipment?.id)
		
		if (orderItem) { 
			def shipmentItem = new ShipmentItem(orderItem.properties)
			shipmentInstance.addToShipmentItems(shipmentItem);
			if (!shipmentInstance.hasErrors() && shipmentInstance?.save(flush:true)) { 
				
	//			def orderShipment = OrderShipment.link(orderItem, shipmentItem);
				/*
				if (!orderShipment.hasErrors() && orderShipment.save(flush:true)) { 
					flash.message = "success"
				}
				else { 
					flash.message = "order shipment error(s)"
					render(view: "fulfill", model: [orderShipment: orderShipment, orderItemInstance: orderItem, shipmentInstance: shipmentInstance])
					return;
				}*/
			}
			else { 
				flash.message = "${warehouse.message(code: 'order.shipmentItemErrors.message')}"
				render(view: "fulfill", model: [orderItemInstance: orderItem, shipmentInstance: shipmentInstance])
				return;
			}
		}
		
		redirect(action: "fulfill", id: orderInstance?.id)
		
	}

	def createshipments = {
	
		def maxQuantity = 10000f
		def maxSize1 = 10000f
		def maxSize2 = 10000f
		def maxSize3 = 10000f

		def equipmentList = Equipment.findAll();
		
		equipmentList?.each{
			log.info "Iterating through Equipments" + it
			def equipmentSizes = it.equipmentSizes
			
			equipmentSizes?.each {
				log.info "Iterating through equipment sizes for the equipments" + it
				def uom = it.uom
				if (uom.inheritOnOrder.equals(OrderSizes.SIZE1))
					maxSize1 = it.value
				else if (uom.inheritOnOrder.equals(OrderSizes.SIZE2))
					maxSize2 = it.value
				else  if (uom.inheritOnOrder.equals(OrderSizes.SIZE3))
					maxSize3 = it.value
				log.info "uom code is " + uom.code
				log.info "equip size value is " + it.value
			}
		}		
		log.info "maxSize1=" + maxSize1 
		log.info "maxSize2=" + maxSize2
		log.info "maxSize3=" + maxSize3
		def destination = Location.get(session.warehouse.id)

		def orders = Order.createCriteria().listDistinct { 
			and {
				or { 
					eq("origin", destination) 
					eq("destination", destination) 
				}
				orderDelivery {
					eq ("status", DeliveryStatus.UNPLANNED )
				}
				eq ( "status", OrderStatus.ACCEPTED )
			}
		}			
		
		orders.each {
			println "CREATE SHIPMENT 1 = " + it
			def originLocation = it.origin
			def destinationLocation = it.destination
			
			def orderTotalQuantity = 0
			def orderTotalSize1 = 0
			def orderTotalSize2 = 0
			def orderTotalSize3 = 0
			
			it.orderDelivery?.findAll {
				orderTotalQuantity += it.deliveryQuantity
				orderTotalSize1 += it.size1?:0
				orderTotalSize2 += it.size2?:0
				orderTotalSize3 += it.size3?:0
			}
			
			log.info "ordertotalquantity = " + orderTotalQuantity
			log.info "orderTotalSize1 = " + orderTotalSize1
			log.info "orderTotalSize2 = " + orderTotalSize2
			log.info "orderTotalSize3 = " + orderTotalSize3
			
			log.info "MY QUANITY = " + (maxQuantity - orderTotalQuantity)
			
			def shipmentsWithNoStatus = Shipment.createCriteria().listDistinct { 
				and {
					eq("origin", originLocation) 
					eq("destination", destination)
				}
			}
			
			log.info "ALL SHIPMENTS NO STATUS = " + shipmentsWithNoStatus
			
			def shipments = shipmentsWithNoStatus?.find {
				((it.status.code == com.cimbidia.wm.shipment.ShipmentStatusCode.CREATED
				|| it.status.code == com.cimbidia.wm.shipment.ShipmentStatusCode.PENDING ) &&
				(it.shipmentItems.sum { it.quantity } < (maxQuantity - orderTotalQuantity)) &&
				(it.orderDeliveryShipments.orderDelivery.sum { it.size1?:0 } < (maxSize1 - orderTotalSize1)) &&
				(it.orderDeliveryShipments.orderDelivery.sum { it.size2?:0 } < (maxSize2 - orderTotalSize2)) &&
				(it.orderDeliveryShipments.orderDelivery.sum { it.size3?:0 } < (maxSize3 - orderTotalSize3))
			)
				
			}
			log.info "ALL SHIPMENTS LEFT = " + shipments


			
			//def shipments = Shipment.findAllByOriginAndDestination( it.origin, destination )
			def shipmentInstance 

			if ( shipments == null ) {
				shipmentInstance = new Shipment (  )
				shipmentInstance.destination = it.destination
				shipmentInstance.origin = it.origin
				String charset = (('A'..'Z') + ('0'..'9')).join()
				def length = 15
				def randomString = RandomStringUtils.random(length, charset.toCharArray())
				shipmentInstance.name = "S" + randomString
				shipmentInstance.shipmentNumber = shipmentInstance.name
				shipmentInstance.recipient = it.recipient
				shipmentInstance.expectedShippingDate = new Date()
				shipmentInstance.expectedDeliveryDate = shipmentInstance.expectedShippingDate + 10
				shipmentInstance.shipmentType = ShipmentType.findByName("Land")
				//shipmentInstance.totalValue = 0.0
			} 
			else {
				shipmentInstance = shipments
			}
			if ( shipmentInstance?.shipmentType == null )
				shipmentInstance?.shipmentType = it.shipmentType
			
			def orderDeliveryItems = it.orderDelivery
			orderDeliveryItems.each {
				def orderDeliveryItem = it
				def orderItemTwo = orderDeliveryItem.order.orderItems.find { it.product = orderDeliveryItem.product }
				
				def shipmentItem = new ShipmentItem()

				//shipmentItem.lotNumber = orderItemCommand.lotNumber
				//shipmentItem.expirationDate = orderItemCommand.expirationDate

				shipmentItem.product = orderDeliveryItem.product;
				shipmentItem.quantity = orderDeliveryItem.deliveryQuantity;
				shipmentItem.recipient = shipmentInstance.recipient;

				shipmentItem.inventoryItem = orderDeliveryItem.inventoryItem
				shipmentInstance.totalValue += shipmentItem.quantity * orderItemTwo.unitPrice
				
				log.info "SHIPMENT_ITEM = " + shipmentItem.product

				def orderShipment = new OrderShipment(shipmentItem:shipmentItem, orderItem:orderItemTwo)
				def orderDeliveryShipment = new OrderDeliveryShipment(orderDelivery:orderDeliveryItem, shipment:shipmentInstance )
				
				shipmentItem.addToOrderShipments(orderShipment)
				shipmentInstance.addToShipmentItems(shipmentItem);
				
				shipmentInstance.addToOrderDeliveryShipments(orderDeliveryShipment)
				
				log.info "order delivery shipment = " + orderDeliveryShipment.id
					
				orderDeliveryItem.status = DeliveryStatus.PLANNED
			}
			log.info "CREATED SHIPMENT = " + shipmentInstance
			shipmentService.saveShipment(shipmentInstance)
			it.save()
		}
		redirect(controller: "shipment", action: "list")
	}
	
	def saveOrderItemRTS = {
			
			log.info "params: " + params
			def orderRTS = new RTS( params )
			
			def order = Order.get( params.orderid )
			log.info "Order ==== " + order
					
			def orderitem = OrderItem.get( params.itemid )
			
			log.info "Order Item = " + orderitem
			
			orderRTS.description = orderitem.description
			orderRTS.product = orderitem.product
			orderRTS.origin = orderitem.origin?orderitem.origin:order.origin
			orderRTS.destination = orderitem.destination?orderitem.destination:order.destination
			//orderRTS.rtsSize4Uom = orderitem.size4Uom
			//orderRTS.rtsSize5Uom = orderitem.size5Uom
			orderRTS.orderLineNum = orderitem.lineNum
			orderRTS.pc = orderitem.pc
			orderRTS.bu = order.bu
			orderRTS.companyId = order.companyId
			orderRTS.orderNumber = order.orderNumber
			//orderRTS.bu = order.orderNumber
			orderRTS.incoterm = order.incoterm
			orderRTS.mot = order.mot
			orderRTS.transResp = order.transResp
			orderRTS.carrier = order.carrier
			orderRTS.mst = order.mst
			orderRTS.fromAddress = order.fromAddress
			orderRTS.toAddress = order.toAddress
			orderRTS.deliveryStart = order.deliveryStart
			orderRTS.deliveryEnd = order.deliveryEnd
			
			//orderRTS.rtsWeight = orderitem.weight
			//orderRTS.rtsVolume = orderitem.volume
			//orderRTS.rtsSize4 = orderitem.size4
			//orderRTS.rtsSize5 = orderitem.size5
			//
			order.addToOrderItemsRTS(orderRTS)
			
			if (!orderService.saveOrder(order)) {
				return error()
			}
			else{
				//create to
				transportationOrderService.addTransportationOrder(orderRTS,  params.orderid)
				render(status: 200, text: 'success')
				
			}
			
	}
		
	
	def saveOrderDelivery = {
			log.info "Inside the called function YAHOOOO"
			log.info "params: " + params
			def orderDelivery = new OrderDelivery( params )
			def order = Order.get( params.orderid )
			log.info "Order ==== " + order
			def orderitem = RTS.get( params.itemid )
			log.info "Order Item = " + orderitem
			orderDelivery.requestedBy = Person.get(session.user.id)
			orderDelivery.category = orderitem.category
			orderDelivery.description = orderitem.description
			orderDelivery.product = orderitem.product
			orderDelivery.inventoryItem = orderitem.inventoryItem
			orderDelivery.status = DeliveryStatus.UNPLANNED
			
			order.addToOrderDelivery(orderDelivery)
			
			if (!orderService.saveOrder(order)) {
				return error()
			}
			
	}


	def duplicateOrder = {

			def order = Order.get( params.id )
			def orderInstance = orderService.cloneOrder( order )
			
			redirect(controller: "purchaseOrderWorkflow", action: "purchaseOrder", id: orderInstance.id)
			
	}

	def retrieveLatestMessages() {
		def messages = Message.createCriteria().list{/* 
			or { 
				eq("sender", session.userName) 
				eq("receiver", session.userName)
				} */
					maxResults(10) 
					order("date", "desc")
					}
		
		[messages:messages.reverse()]
	}
	def submitMessage(String message, String receivers, String object, String context, String objectId) {
		String[] recvrs = receivers.split(",");
		for(int i=0; i< recvrs.size(); i++){
		new Message(sender: session.userName, message:message, companyId:session.companyId, object:object, receiver:recvrs[i]?.trim(), context:context, objectId:objectId ).save(flush: true, failOnError: true)
		}
		render "<script>retrieveLatestMessages()</script>"
	}

}
