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


import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

import org.apache.commons.lang.RandomStringUtils

import com.cimbidia.wm.core.Address
import com.cimbidia.wm.core.Comment
import com.cimbidia.wm.core.Document
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.OrderSizes
import com.cimbidia.wm.core.Person
import com.cimbidia.wm.core.UnitOfMeasure
import com.cimbidia.wm.order.OrderCommand
import com.cimbidia.wm.order.OrderItemCommand
import com.cimbidia.wm.product.Product
import com.cimbidia.wm.shipment.Shipment
import com.cimbidia.wm.shipment.ShipmentItem
import com.cimbidia.wm.shipment.ShipmentType
import com.cimbidia.scm.admin.Company
import com.cimbidia.scm.collab.Message

// import java.util.Date

class CustomerOrderController {
	
	def userService
	def customerOrderService
	def shipmentService
	def transportationOrderService
    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def suppliers = customerOrderService.getSuppliers().sort();
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
		
		println locationsArray
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		
		
		locationsArray.each{
			locations << it
		}
		def orderBy = params.order? params.order: null;
		def colName = params.sort? params.sort: null;
		
		def destination = params.destination ? Location.get(params.destination) : null
		def orderNumber = params.orderNumber
		//Integer seller = params.seller? new Integer(params.seller.id):3
		
		def origin = params.origin ? Location.get(params.origin) : null
		def status = params.status ? Enum.valueOf(CustomerOrderStatus.class, params.status) : null
		println "status: " + status
		def statusStartDate = params.statusStartDate ? Date.parse("MM/dd/yyyy", params.statusStartDate) : null
		def statusEndDate = params.statusEndDate ? Date.parse("MM/dd/yyyy", params.statusEndDate) : null
		//def priority = params.priorityNumber
		def mode=params.shipmentType
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		
		def totalsize =0;
		def customerOrders
		
		if ( origin || destination ) {
			customerOrders = customerOrderService.getOrdersPlacedByLocation(companyId, "", origin, destination, status, statusStartDate, statusEndDate,orderBy,colName)
			totalsize = customerOrders?.size();
			def highIndex = lowerIndex + 10;
			if(highIndex > totalsize) highIndex = totalsize;
			if(customerOrders?.size() >10)
				customerOrders = customerOrders.subList(lowerIndex, highIndex);
		} else {	
			customerOrders = customerOrderService.getOrders(companyId, orderNumber, "", locations,status, statusStartDate, statusEndDate,orderBy,colName)
			//orders = orderService.getOrdersByStatus(params.status)
			totalsize = customerOrders?.size();
			def highIndex = lowerIndex + 10;
			if(highIndex > totalsize) highIndex = totalsize;
			if(customerOrders?.size() >10)
				customerOrders = customerOrders.subList(lowerIndex, highIndex);
		}
		log.info "WER E ATHE TWORLD = " + customerOrders?.size()
		
		// sort by order date
		/*customerOrders = customerOrders.sort( { a, b ->
			return b.dateOrdered <=> a.dateOrdered
		} )*/

		render (view: "list", model:[ customerOrders:customerOrders, origin:origin?.id, destination:destination?.id,
		  status:status, statusStartDate:statusStartDate, statusEndDate:statusEndDate,
		  suppliers : suppliers, customerOrderTotal:totalsize
		]);
    }
    
  
	
	def create = {
		def orderInstance = new CustomerOrder()
		orderInstance.properties = params
		return [orderInstance: orderInstance]
	}
	def createtest = {
		def orderInstance = new CustomerOrder()
		orderInstance.properties = params
		render(view: "createtest", model: [orderInstance: orderInstance])
	}
	
	
    def save = {
		
		println "params : "+params
        def customerOrderInstance = new CustomerOrder(params)
		customerOrderInstance.pickupStart=getDateTimeFormat(params.pickupStart)
		customerOrderInstance.pickupEnd=getDateTimeFormat(params.pickupEnd)
		customerOrderInstance.deliveryStart=getDateTimeFormat(params.deliveryStart)
		customerOrderInstance.deliveryEnd=getDateTimeFormat(params.deliveryEnd)
		Integer companyId = params.companyId ? params.companyId : 1
		customerOrderInstance.companyId=companyId
		//orderInstance.id = abc++
		def _toBeRemoved = customerOrderInstance.orderItems.findAll {!it}

		// if there are orderItems to be removed
		if (_toBeRemoved) {
			customerOrderInstance.orderItems.removeAll(_toBeRemoved)
		 }
		
		//update my indexes
		customerOrderInstance.orderItems.eachWithIndex(){oi, i ->
			
			if(oi){
				//orderInstance.addToOrderItems(oi)
				println(oi)
			}
			
		}
		
		if(customerOrderInstance.validate() && !customerOrderInstance.hasErrors()){
			
			if (customerOrderService.saveOrder(customerOrderInstance)) {
	
	            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'order.label', default: 'Order'), customerOrderInstance.id])}"
	            redirect(action: "edit", id: customerOrderInstance.id)
	        }
		}
        else {
			
            render(view: "create", model: [customerOrderInstance: customerOrderInstance])
        }
		
		
    }
	
    def show = {
		println "show"
		def customerOrderInstance = CustomerOrder.get(params.id)
		 if (!customerOrderInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
        else {
			def uomList = UnitOfMeasure.findAllByInheritOnOrderIsNotNull([sort:"inheritOnOrder", order:"asc"])
			log.info(" uomList is "+uomList.size())
            [customerOrderInstance: customerOrderInstance, uomList: uomList ]
        }
    }

    def edit = {
		
		 def customerOrderInstance = CustomerOrder.get(params.id)
		
        if (!customerOrderInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'order.label', default: 'Order'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [customerOrderInstance: customerOrderInstance]
        }
    }


    def update = {
		def customerOrderInstance = CustomerOrder.get(params.id)
		
		if (customerOrderInstance) {
			if (params.version) {
                def version = params.version.toLong()
                if (customerOrderInstance.version > version) {
                    
                    customerOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'order.label', default: 'Order')] as Object[], "Another user has updated this Order while you were editing")
                    render(view: "edit", model: [customerOrderInstance: customerOrderInstance])
                    return
                }
            }
			
            customerOrderInstance.properties = params
			for(int i=0; i< customerOrderInstance.orderItems.size(); i++)
			{
				println " size "+i
				println "customerOrderInstance.orderItems[i].origin"+customerOrderInstance.orderItems[i].origin+"fgdertuug";
				try{
					Location orig = Location.findById(customerOrderInstance.orderItems[i].origin.id)
					println "orig==" + orig
					if (orig == null){
						println "inside if "
						//customerOrderInstance.orderItems[i].origin.id = null;
						customerOrderInstance.orderItems[i].origin = null;
					}
				}catch(Exception e){
					customerOrderInstance.orderItems[i].origin = null;
				}
			}
			
			customerOrderInstance.pickupStart=getDateTimeFormat(params.pickupStart)
			customerOrderInstance.pickupEnd=getDateTimeFormat(params.pickupEnd)
			customerOrderInstance.deliveryStart=getDateTimeFormat(params.deliveryStart)
			customerOrderInstance.deliveryEnd=getDateTimeFormat(params.deliveryEnd)
			for(int i=0; i< customerOrderInstance.orderItems.size(); i++)
			{
				//println "customerOrderInstance.orderItems[i].origin"+customerOrderInstance.orderItems[i].origin+"sdfsd";
				//println "customerOrderInstance.orderItems[i].origin id"+customerOrderInstance.orderItems[i].origin?.id+"sdfsd";
				
			}

			
				if (customerOrderInstance.validate() && !customerOrderInstance.hasErrors()){
				
				
	            if ( customerOrderInstance.save(flush: true,failOnError: true)) {
								println "save"
	                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'order.label', default: 'Order'), customerOrderInstance.id])}"
	                redirect(action: "edit", id: customerOrderInstance.id)
	            }
	            else {
					println(customerOrderInstance.errors)		
	                render(view: "edit", model: [customerOrderInstance: customerOrderInstance])
	            }
			}else {
					println(customerOrderInstance.errors)		
	                render(view: "edit", model: [customerOrderInstance: customerOrderInstance])
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
	

	def showChart = {
		def location=Location.findById(Integer.parseInt(params.id))
		def productList=Product.getAll()
		render(view: "showChartByValue", model : [productList : productList,location:location])
	}
	
	def createTOFromCO = {
		def customerOrder = CustomerOrder.findById(params.id)
		if(customerOrder.status.toString().equals("ACKNOWLEDGED")){
		customerOrder.status = "ALLOCATED"
		}
		customerOrderService.createTOFromCustomerOrder(customerOrder);
		redirect(action: "edit", id: customerOrder.id)
		//render(view: "edit", model: [customerOrderInstance : customerOrder])
	}
	def committedCustomerOrder = {
		def committedCustomerOrderList=customerOrderService.committedCustomerOrder(CustomerOrderStatus.COMMITTED)
		render(view: "list", model: [customerOrders : committedCustomerOrderList])
	}
	def acknowledgeCO = {
		def customerOrder = CustomerOrder.findById(params.id)
		println "status"+customerOrder.status.toString().equals("NEW")
		if(customerOrder.status.toString().equals("NEW")){
			customerOrder.status = "ACKNOWLEDGED"
		}
		redirect(action: "edit", id: customerOrder.id)
	}
	
	def coListByFilter = {
		println(params);
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def destination = Location.get(params.destination)
		def orderNumber=params.orderNumber
		def status=params.status ? Enum.valueOf(CustomerOrderStatus.class, params.status) : null
		def dueDate=params.dueDate ? getDateFormat(params.dueDate) : null
		println "params.customer : "+params.customer+" : "+params.dueDate+" status : "+status
		def customer=params.customer?.id?Integer.parseInt(params.customer?.id):null
	
		def lowerIndex = params.offset ? params.offset.toInteger() : 0;
		
		

		Integer companyId = params.companyId ? params.companyId :  session.companyId
		def customerOrders = customerOrderService.getCustomerOrderByFilter(companyId,orderNumber,destination,status,customer,dueDate);
		def totalsize = customerOrders?.size();
		def highIndex = lowerIndex + 10;
		if(highIndex > totalsize) highIndex = totalsize;
		if(customerOrders?.size() >10)
			customerOrders = customerOrders.subList(lowerIndex, highIndex);
		render(view: "list", model: [
			customerOrders:customerOrders,
			orderNumber:orderNumber,
			destination:destination?.id,
			status:status,
			customerOrderTotal:totalsize
		])
		
	}
	public Date getDateTimeFormat(String strDate){
		
		Date date = null;
		if(strDate.trim().length() >0){
			DateFormat readFormat = new SimpleDateFormat( "MM/dd/yyyy HH:mm");
		
			try {
				date = readFormat.parse( strDate )
			}catch(Exception e ){
				e.printStackTrace();
			}
			//System.out.println(date);
		}
		return date
	}
	public Date getDateFormat(String strDate){
		Date date = null;
		if(strDate.trim().length() >0){
			DateFormat readFormat = new SimpleDateFormat( "MM/dd/yyyy");
		
			try {
				date = readFormat.parse( strDate )
			}catch(Exception e ){
				e.printStackTrace();
			}
			//System.out.println(date);
		}
		return date
	}
}
