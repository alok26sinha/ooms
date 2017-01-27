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

class InventoryDemandTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventoryDemandTypeInstanceList: InventoryDemandType.list(params), inventoryDemandTypeInstanceTotal: InventoryDemandType.count()]
    }

    def create = {
        def inventoryDemandTypeInstance = new InventoryDemandType()
        inventoryDemandTypeInstance.properties = params
        return [inventoryDemandTypeInstance: inventoryDemandTypeInstance]
    }

    def save = {
        def inventoryDemandTypeInstance = new InventoryDemandType(params)
		inventoryDemandTypeInstance.createdBy = session.user;
        if (inventoryDemandTypeInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), inventoryDemandTypeInstance.id])}"
            redirect(action: "list", id: inventoryDemandTypeInstance.id)
        }
        else {
            render(view: "create", model: [inventoryDemandTypeInstance: inventoryDemandTypeInstance])
        }
    }

    def show = {
        def inventoryDemandTypeInstance = InventoryDemandType.get(params.id)
        if (!inventoryDemandTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventoryDemandTypeInstance: inventoryDemandTypeInstance]
        }
    }

    def edit = {
        def inventoryDemandTypeInstance = InventoryDemandType.get(params.id)
        if (!inventoryDemandTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventoryDemandTypeInstance: inventoryDemandTypeInstance]
        }
    }

    def update = {
        def inventoryDemandTypeInstance = InventoryDemandType.get(params.id)
		inventoryDemandTypeInstance.modifiedBy = session.user;
        if (inventoryDemandTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventoryDemandTypeInstance.version > version) {
                    
                    inventoryDemandTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType')] as Object[], "Another user has updated this InventoryDemandType while you were editing")
                    render(view: "edit", model: [inventoryDemandTypeInstance: inventoryDemandTypeInstance])
                    return
                }
            }
            inventoryDemandTypeInstance.properties = params
            if (!inventoryDemandTypeInstance.hasErrors() && inventoryDemandTypeInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), inventoryDemandTypeInstance.id])}"
                redirect(action: "list", id: inventoryDemandTypeInstance.id)
            }
            else {
                render(view: "edit", model: [inventoryDemandTypeInstance: inventoryDemandTypeInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventoryDemandTypeInstance = InventoryDemandType.get(params.id)
        if (inventoryDemandTypeInstance) {
            try {
                inventoryDemandTypeInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType'), params.id])}"
            redirect(action: "list")
        }
    }
}
