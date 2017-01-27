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

class InventorySupplyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventorySupplyInstanceList: InventorySupply.list(params), inventorySupplyInstanceTotal: InventorySupply.count()]
    }

    def create = {
        def inventorySupplyInstance = new InventorySupply()
        inventorySupplyInstance.properties = params
        return [inventorySupplyInstance: inventorySupplyInstance]
    }

    def save = {
        def inventorySupplyInstance = new InventorySupply(params)
        if (inventorySupplyInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), inventorySupplyInstance.id])}"
            redirect(action: "list", id: inventorySupplyInstance.id)
        }
        else {
            render(view: "create", model: [inventorySupplyInstance: inventorySupplyInstance])
        }
    }

    def show = {
        def inventorySupplyInstance = InventorySupply.get(params.id)
        if (!inventorySupplyInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventorySupplyInstance: inventorySupplyInstance]
        }
    }

    def edit = {
        def inventorySupplyInstance = InventorySupply.get(params.id)
        if (!inventorySupplyInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventorySupplyInstance: inventorySupplyInstance]
        }
    }

    def update = {
        def inventorySupplyInstance = InventorySupply.get(params.id)
        if (inventorySupplyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventorySupplyInstance.version > version) {
                    
                    inventorySupplyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply')] as Object[], "Another user has updated this InventorySupply while you were editing")
                    render(view: "edit", model: [inventorySupplyInstance: inventorySupplyInstance])
                    return
                }
            }
            inventorySupplyInstance.properties = params
            if (!inventorySupplyInstance.hasErrors() && inventorySupplyInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), inventorySupplyInstance.id])}"
                redirect(action: "list", id: inventorySupplyInstance.id)
            }
            else {
                render(view: "edit", model: [inventorySupplyInstance: inventorySupplyInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventorySupplyInstance = InventorySupply.get(params.id)
        if (inventorySupplyInstance) {
            try {
                inventorySupplyInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply'), params.id])}"
            redirect(action: "list")
        }
    }
}
