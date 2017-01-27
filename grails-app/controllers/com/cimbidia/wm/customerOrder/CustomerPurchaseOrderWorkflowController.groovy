/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.customerOrder

import com.cimbidia.wm.product.Category
import com.cimbidia.wm.product.Product

import org.springframework.dao.DataIntegrityViolationException

import com.cimbidia.wm.core.Person;
import com.cimbidia.wm.core.UnitOfMeasure;
import com.cimbidia.wm.order.Order;
import com.cimbidia.wm.order.OrderItem;

class CustomerPurchaseOrderWorkflowController {

	def orderService;
	
	//def index = { redirect(action:"purchaseOrder") }
	def index = {
		redirect(controller: 'order', action: 'create');
	}
	def purchaseOrderFlow = {		
		
		start {
			action {
				log.info("Starting order workflow " + params)
				
				flow.suppliers = orderService.getSuppliers();
				// create a new shipment instance if we don't have one already
				if (params.id) {
					
					flow.order = Order.get(params.id)
					flow.order.attach()
				}
				else {
					
					def order = new Order();
					
					order.orderedBy = Person.get(session.user.id)
					
					flow.order = order;
					
				}
				
				def uomList = UnitOfMeasure.findAllByInheritOnOrderIsNotNull([sort:"inheritOnOrder", order:"asc"])
				flow.orderSizesInherited = uomList
				println " flow.orderSizesInherited HETE 1121212 uomList is " + flow.orderSizesInherited
			
			
				
				if (params.skipTo) {
					if (params.skipTo == 'details') return success()
					else if (params.skipTo == 'items') return showOrderItems()
					//else if (params.skipTo == 'confirm') return confirmOrder()
					
				}
				
				return success()
			}
			on("success").to("enterOrderDetails")
			on("showOrderItems").to("showOrderItems")
			//on("confirmOrder").to("confirmOrder")			
		}
		
		
		enterOrderDetails {
			on("next") {
				
				log.info params
				
				flow.order.properties = params
				
				try {
					flow.order.clearErrors()
					
					if (!orderService.saveOrder(flow.order)) {
						return error()
					}
				} catch (Exception e) { 
					return error()
				}
			}.to("showOrderItems")
			on("saveonly") {   
				 log.info params
				 
    flow.order.properties = params
    try { 
     if (!orderService.saveOrder(flow.order)) {
      return error()
     }
    } catch (Exception e) { 
     return error()
    }}.to("finish")
			on("cancel").to("cancel")
			on("finish").to("finish")
		}
		showOrderItems {
			
			on("back") { 
				log.info "saving items " + params
				flow.order.properties = params
				if (!orderService.saveOrder(flow.order)) {
					return error()
				}

			}.to("enterOrderDetails")
			
			on("deleteItem") { 
				log.info "deleting an item " + params
				def orderItem = OrderItem.get(params.id)
				if (orderItem) { 
					flow.order.removeFromOrderItems(orderItem);
					orderItem.delete();
				}
			}.to("showOrderItems")
			
			on("editItem") { 
				def orderItem = OrderItem.get(params.id)
				if (orderItem) { 
					flow.orderItem = orderItem;
				}
			}.to("showOrderItems")
			
			on("addItem") {
				log.info "adding an item " + params
				if(!flow.order.orderItems) flow.order.orderItems = [] as HashSet
				
				def orderItem = OrderItem.get(params?.orderItem?.id)
				if (orderItem) { 
					orderItem.properties = params
				} 
				else { 
					orderItem = new OrderItem(params);
				}				
				
				
				
				orderItem.requestedBy = Person.get(session.user.id)
				
				if (params?.product?.id && params?.category?.id) { 
					log.info("error with product and category")
					orderItem.errors.rejectValue("product.id", "Please choose a product OR a category OR enter a description")
					flow.orderItem = orderItem
					return error()
				}				
				else if (params?.product?.id) { 
					def product = Product.get(params?.product?.id)
					if (product) { 
						orderItem.description = product.name
						orderItem.category = product.category
					}
				} else if ( params?.product?.name ) {
					def product = Product.findByName( params?.product?.name )
					if (product) { 
						orderItem.description = product.name
						orderItem.category = product.category
						orderItem.product = product
					}
				}
				else if (params?.category?.id) { 
					def category = Category.get(params?.category?.id) 
					if (category) {
						orderItem.description = category.name
						//orderItem.category = category
					}
				} else {
					println "*********I AM TOTALLY outside WITH ERROR params= " + params
				}
				
				if (!orderItem.validate() || orderItem.hasErrors()) { 
					flow.orderItem = orderItem
					return error();
				}
				flow.order.addToOrderItems(orderItem);
				if (!orderService.saveOrder(flow.order)) {
					return error()
				}
				flow.orderItem = null
				
			}.to("showOrderItems")
			
			on("next") {
				log.info "confirm order " + params
				flow.order.properties = params
				
				log.info("order " + flow.order)
			

					
			}.to("finish")

			on("cancel").to("cancel")
			on("finish").to("finish")
			on("error").to("showOrderItems")
		}
		/*
		confirmOrder  {
			on("back").to("showOrderItems")
			on("next").to("finish")
			on("error").to("confirmOrder")
			on(Exception).to("confirmOrder")
		}
		*/
		finish {
			
			action {
				log.info("Finishing workflow, save order object " + flow.order)
				// def order = flow.order;

				try {
					
					if (!orderService.saveOrder(flow.order)) {
						return error()
					}
					else { 
						return success()
					} 
					
				} catch (DataIntegrityViolationException e) {
					log.info ("data integrity exception")
					return error();
				}
			}
			on("success").to("showOrder")
		}
		cancel { 
			redirect(controller:"order", action: "list")
		}
		showOrder { 
			redirect(controller:"order", action : "show", params : [ "id" : flow.order.id ?: '' ])
		}
		
		handleError()
	}
}
