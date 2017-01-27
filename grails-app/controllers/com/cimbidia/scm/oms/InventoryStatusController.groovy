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

class InventoryStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventoryStatusInstanceList: InventoryStatus.list(params), inventoryStatusInstanceTotal: InventoryStatus.count()]
    }

    def create = {
        def inventoryStatusInstance = new InventoryStatus()
        inventoryStatusInstance.properties = params
        return [inventoryStatusInstance: inventoryStatusInstance]
    }

    def save = {
        def inventoryStatusInstance = new InventoryStatus(params)
        if (inventoryStatusInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), inventoryStatusInstance.id])}"
            redirect(action: "list", id: inventoryStatusInstance.id)
        }
        else {
            render(view: "create", model: [inventoryStatusInstance: inventoryStatusInstance])
        }
    }

    def show = {
        def inventoryStatusInstance = InventoryStatus.get(params.id)
        if (!inventoryStatusInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventoryStatusInstance: inventoryStatusInstance]
        }
    }

    def edit = {
        def inventoryStatusInstance = InventoryStatus.get(params.id)
        if (!inventoryStatusInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventoryStatusInstance: inventoryStatusInstance]
        }
    }

    def update = {
        def inventoryStatusInstance = InventoryStatus.get(params.id)
        if (inventoryStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventoryStatusInstance.version > version) {
                    
                    inventoryStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus')] as Object[], "Another user has updated this InventoryStatus while you were editing")
                    render(view: "edit", model: [inventoryStatusInstance: inventoryStatusInstance])
                    return
                }
            }
            inventoryStatusInstance.properties = params
            if (!inventoryStatusInstance.hasErrors() && inventoryStatusInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), inventoryStatusInstance.id])}"
                redirect(action: "list", id: inventoryStatusInstance.id)
            }
            else {
                render(view: "edit", model: [inventoryStatusInstance: inventoryStatusInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventoryStatusInstance = InventoryStatus.get(params.id)
        if (inventoryStatusInstance) {
            try {
                inventoryStatusInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
