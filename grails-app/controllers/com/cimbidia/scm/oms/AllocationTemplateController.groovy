/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.oms

import java.util.Map;

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.customerOrder.CustomerOrder
import com.cimbidia.wm.customerOrder.CustomerOrderService;

class AllocationTemplateController {
	def customerOrderService
	def sourcingService
	
	def allocationService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [allocationTemplateInstanceList: AllocationTemplate.list(params), allocationTemplateInstanceTotal: AllocationTemplate.count()]
    }

    def create = {
        def allocationTemplateInstance = new AllocationTemplate()
        allocationTemplateInstance.properties = params
        return [allocationTemplateInstance: allocationTemplateInstance]
    }

    def save = {
		
		//println("params****************"+params)
        def allocationTemplateInstance = new AllocationTemplate(params)
		Company company = params.company ? params.company :  session.company
		allocationTemplateInstance.company = company
		allocationTemplateInstance.createdBy = session.user
		if(allocationTemplateInstance.validate() && !allocationTemplateInstance.hasErrors()){
        if (allocationTemplateInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), allocationTemplateInstance.id])}"
            redirect(action: "list", id: allocationTemplateInstance.id)
        }
        else {
            render(view: "create", model: [allocationTemplateInstance: allocationTemplateInstance])
        }
		}
		else{
			println("error********")
		}
		//redirect(action: "run", params: params)
    }
	
	def run = {
		//println " Run Called "
		params.max = Math.min(params.max ? params.int('max') : 10, 100);
		def allocationTemplateInstance = new AllocationTemplate(params)
		Company company = params.company ? params.company :  session.company
		allocationTemplateInstance.company = company
		allocationTemplateInstance.createdBy = session.user
		
		def destination = params.destination ? Location.get(params.destination) : null
		def orderNumber = params.orderNumber
		//Integer seller = params.seller? new Integer(params.seller.id):3
		
		def status = params.status ? Enum.valueOf(CustomerOrderStatus.class, params.status) : null
		def dueDate = params.dueDate ? Date.parse("MM/dd/yyyy", params.dueDate) : null
		Integer cust = null
		if(params.customer != null && params.customer?.trim().length()>0){
		cust = Integer.parseInt(params.customer)
		}
		List<CustomerOrder> customerOrders = customerOrderService.getCustomerOrderByFilter(company?.id,orderNumber,destination,status,cust,dueDate)
		
		Map<Inventory, Inventory> inventoryMap = new HashMap<Inventory, Inventory>();
		
		HashMap<String, SourcingHelper> sourcingHelpers = sourcingService.source(customerOrders, inventoryMap);
	
		allocationService.allocate(sourcingHelpers, inventoryMap, params.rule?.id)
		flash.message = "Following customer orders processed";
		render(view: "allocation", model:[customerOrders:customerOrders,customerTotal:customerOrders?.size()]);
	}

	
	def loadCustOrders = {
		
		
		def allocationTemplateInstance = new AllocationTemplate(params)
		Company company = params.company ? params.company :  session.company
		allocationTemplateInstance.company = company
		allocationTemplateInstance.createdBy = session.user
		
		def destination = params.destination ? Location.get(params.destination) : null
		def orderNumber = params.orderNumber
		//Integer seller = params.seller? new Integer(params.seller.id):3
		
		def status = params.status ? Enum.valueOf(CustomerOrderStatus.class, params.status) : null
		def dueDate = params.dueDate ? Date.parse("MM/dd/yyyy", params.dueDate) : null
		Integer cust = null
		if(params.customer != null && params.customer.trim().length()>0){
		cust = Integer.parseInt(params.customer)
		}
		
		
		
		
		List<CustomerOrder> customerOrders = customerOrderService.getCustomerOrderByFilter(company?.id,orderNumber,destination,status,cust,dueDate)
		
		render(template: 'filteredOrderlist', model: [customerOrders: customerOrders])
		
	}

    def show = {
        def allocationTemplateInstance = AllocationTemplate.get(params.id)
        if (!allocationTemplateInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [allocationTemplateInstance: allocationTemplateInstance]
        }
    }

    def edit = {
        def allocationTemplateInstance = AllocationTemplate.get(params.id)
        if (!allocationTemplateInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
            redirect(action: "list")
        }
        else {
             render(view: "edit", model: [allocationTemplateInstance: allocationTemplateInstance])
        }
    }

    def update = {
        def allocationTemplateInstance = AllocationTemplate.get(params.id)
        if (allocationTemplateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (allocationTemplateInstance.version > version) {
                    
                    allocationTemplateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate')] as Object[], "Another user has updated this AllocationTemplate while you were editing")
                    render(view: "edit", model: [allocationTemplateInstance: allocationTemplateInstance])
                    return
                }
            }
            allocationTemplateInstance.properties = params
            if (!allocationTemplateInstance.hasErrors() && allocationTemplateInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), allocationTemplateInstance.id])}"
                redirect(action: "list", id: allocationTemplateInstance.id)
            }
            else {
                render(view: "edit", model: [allocationTemplateInstance: allocationTemplateInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def allocationTemplateInstance = AllocationTemplate.get(params.id)
        if (allocationTemplateInstance) {
            try {
                allocationTemplateInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def createTOFromCO = {
		println "Called Allocation temp controller "+params;
		def  ids = params.selectedCheck;
		def  idArray  = ids.substring(1, ids.size());
		def str = idArray.split(",")
		println "str" +str;
		List<CustomerOrder> custList = new ArrayList<CustomerOrder>()
		for(int i=0; i<str.length; i++){
			def customerOrder = CustomerOrder.findById(str[i])
			println " To Release "+customerOrder.toString()
			if(customerOrder){
				println " Status "+customerOrder.status.toString()
				if(customerOrder.status.toString().equals("ALLOCATED")){
					customerOrder.status = "RELEASED"
					customerOrder.hasErrors() && customerOrder.save(flush: true)
					customerOrderService.createTOFromCustomerOrder(customerOrder);
					custList.add(customerOrder)
				}
		}
		
		}
		
		render(view: "allocation",model:[ customerOrders: custList])
	
		//render(view: "edit", model: [customerOrderInstance : customerOrder])
	}
}
