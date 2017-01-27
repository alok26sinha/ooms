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

class InventorySupplyTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventorySupplyTypeInstanceList: InventorySupplyType.list(params), inventorySupplyTypeInstanceTotal: InventorySupplyType.count()]
    }

    def create = {
        def inventorySupplyTypeInstance = new InventorySupplyType()
		
        inventorySupplyTypeInstance.properties = params
        return [inventorySupplyTypeInstance: inventorySupplyTypeInstance]
    }

    def save = {
        def inventorySupplyTypeInstance = new InventorySupplyType(params)
		inventorySupplyTypeInstance.createdBy = session.user;
        if (inventorySupplyTypeInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), inventorySupplyTypeInstance.id])}"
            redirect(action: "list", id: inventorySupplyTypeInstance.id)
        }
        else {
            render(view: "create", model: [inventorySupplyTypeInstance: inventorySupplyTypeInstance])
        }
    }

    def show = {
        def inventorySupplyTypeInstance = InventorySupplyType.get(params.id)
        if (!inventorySupplyTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventorySupplyTypeInstance: inventorySupplyTypeInstance]
        }
    }

    def edit = {
        def inventorySupplyTypeInstance = InventorySupplyType.get(params.id)
        if (!inventorySupplyTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventorySupplyTypeInstance: inventorySupplyTypeInstance]
        }
    }

    def update = {
        def inventorySupplyTypeInstance = InventorySupplyType.get(params.id)
		inventorySupplyTypeInstance.modifiedBy = session.user;
        if (inventorySupplyTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventorySupplyTypeInstance.version > version) {
                    
                    inventorySupplyTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType')] as Object[], "Another user has updated this InventorySupplyType while you were editing")
                    render(view: "edit", model: [inventorySupplyTypeInstance: inventorySupplyTypeInstance])
                    return
                }
            }
            inventorySupplyTypeInstance.properties = params
            if (!inventorySupplyTypeInstance.hasErrors() && inventorySupplyTypeInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), inventorySupplyTypeInstance.id])}"
                redirect(action: "list", id: inventorySupplyTypeInstance.id)
            }
            else {
                render(view: "edit", model: [inventorySupplyTypeInstance: inventorySupplyTypeInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventorySupplyTypeInstance = InventorySupplyType.get(params.id)
        if (inventorySupplyTypeInstance) {
            try {
                inventorySupplyTypeInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType'), params.id])}"
            redirect(action: "list")
        }
    }
}
