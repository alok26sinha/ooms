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

class InventoryIdentifierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [inventoryIdentifierInstanceList: InventoryIdentifier.list(params), inventoryIdentifierInstanceTotal: InventoryIdentifier.count()]
    }

    def create = {
        def inventoryIdentifierInstance = new InventoryIdentifier()
        inventoryIdentifierInstance.properties = params
        return [inventoryIdentifierInstance: inventoryIdentifierInstance]
    }

    def save = {
        def inventoryIdentifierInstance = new InventoryIdentifier(params)
        if (inventoryIdentifierInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), inventoryIdentifierInstance.id])}"
            redirect(action: "list", id: inventoryIdentifierInstance.id)
        }
        else {
            render(view: "create", model: [inventoryIdentifierInstance: inventoryIdentifierInstance])
        }
    }

    def show = {
        def inventoryIdentifierInstance = InventoryIdentifier.get(params.id)
        if (!inventoryIdentifierInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
            redirect(action: "list")
        }
        else {
            [inventoryIdentifierInstance: inventoryIdentifierInstance]
        }
    }

    def edit = {
        def inventoryIdentifierInstance = InventoryIdentifier.get(params.id)
        if (!inventoryIdentifierInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [inventoryIdentifierInstance: inventoryIdentifierInstance]
        }
    }

    def update = {
        def inventoryIdentifierInstance = InventoryIdentifier.get(params.id)
        if (inventoryIdentifierInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (inventoryIdentifierInstance.version > version) {
                    
                    inventoryIdentifierInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier')] as Object[], "Another user has updated this InventoryIdentifier while you were editing")
                    render(view: "edit", model: [inventoryIdentifierInstance: inventoryIdentifierInstance])
                    return
                }
            }
            inventoryIdentifierInstance.properties = params
            if (!inventoryIdentifierInstance.hasErrors() && inventoryIdentifierInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), inventoryIdentifierInstance.id])}"
                redirect(action: "list", id: inventoryIdentifierInstance.id)
            }
            else {
                render(view: "edit", model: [inventoryIdentifierInstance: inventoryIdentifierInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def inventoryIdentifierInstance = InventoryIdentifier.get(params.id)
        if (inventoryIdentifierInstance) {
            try {
                inventoryIdentifierInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier'), params.id])}"
            redirect(action: "list")
        }
    }
}
