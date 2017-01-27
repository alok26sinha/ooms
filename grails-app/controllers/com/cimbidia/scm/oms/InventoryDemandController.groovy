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

import grails.converters.JSON

class InventoryDemandController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventoryDemandInstanceList: InventoryDemand.list(params), inventoryDemandInstanceTotal: InventoryDemand.count()]
    }

    def create = {
        def inventoryDemandInstance = new InventoryDemand()
        inventoryDemandInstance.properties = params
        return [inventoryDemandInstance: inventoryDemandInstance]
    }

    def save = {
        def inventoryDemandInstance = new InventoryDemand(params)
        if (inventoryDemandInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), inventoryDemandInstance.id])}"
            redirect(action: "list", id: inventoryDemandInstance.id)
        }
        else {
            render(view: "create", model: [inventoryDemandInstance: inventoryDemandInstance])
        }
    }

    def show = {
        def inventoryDemandInstance = InventoryDemand.get(params.id)
        if (!inventoryDemandInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventoryDemandInstance: inventoryDemandInstance]
        }
    }

    def edit = {
        def inventoryDemandInstance = InventoryDemand.get(params.id)
        if (!inventoryDemandInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventoryDemandInstance: inventoryDemandInstance]
        }
    }

    def update = {
        def inventoryDemandInstance = InventoryDemand.get(params.id)
        if (inventoryDemandInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventoryDemandInstance.version > version) {
                    
                    inventoryDemandInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand')] as Object[], "Another user has updated this InventoryDemand while you were editing")
                    render(view: "edit", model: [inventoryDemandInstance: inventoryDemandInstance])
                    return
                }
            }
            inventoryDemandInstance.properties = params
            if (!inventoryDemandInstance.hasErrors() && inventoryDemandInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), inventoryDemandInstance.id])}"
                redirect(action: "list", id: inventoryDemandInstance.id)
            }
            else {
                render(view: "edit", model: [inventoryDemandInstance: inventoryDemandInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventoryDemandInstance = InventoryDemand.get(params.id)
        if (inventoryDemandInstance) {
            try {
                inventoryDemandInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def publish (shipment){
		def message = [id: shipment.id, shipmentNumber:shipment.shipmentNumber] as JSON
		rabbitSend 'shipmentEx', null, message.toString()
  }
}
