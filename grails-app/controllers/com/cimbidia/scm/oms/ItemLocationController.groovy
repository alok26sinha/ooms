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

class ItemLocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [itemLocationInstanceList: ItemLocation.list(params), itemLocationInstanceTotal: ItemLocation.count()]
    }

    def create = {
        def itemLocationInstance = new ItemLocation()
        itemLocationInstance.properties = params
        return [itemLocationInstance: itemLocationInstance]
    }

    def save = {
        def itemLocationInstance = new ItemLocation(params)
        if (itemLocationInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), itemLocationInstance.id])}"
            redirect(action: "list", id: itemLocationInstance.id)
        }
        else {
            render(view: "create", model: [itemLocationInstance: itemLocationInstance])
        }
    }

    def show = {
        def itemLocationInstance = ItemLocation.get(params.id)
        if (!itemLocationInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
            redirect(action: "list")
        }
        else {
            [itemLocationInstance: itemLocationInstance]
        }
    }

    def edit = {
        def itemLocationInstance = ItemLocation.get(params.id)
        if (!itemLocationInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [itemLocationInstance: itemLocationInstance]
        }
    }

    def update = {
        def itemLocationInstance = ItemLocation.get(params.id)
        if (itemLocationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (itemLocationInstance.version > version) {
                    
                    itemLocationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation')] as Object[], "Another user has updated this ItemLocation while you were editing")
                    render(view: "edit", model: [itemLocationInstance: itemLocationInstance])
                    return
                }
            }
            itemLocationInstance.properties = params
            if (!itemLocationInstance.hasErrors() && itemLocationInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), itemLocationInstance.id])}"
                redirect(action: "list", id: itemLocationInstance.id)
            }
            else {
                render(view: "edit", model: [itemLocationInstance: itemLocationInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def itemLocationInstance = ItemLocation.get(params.id)
        if (itemLocationInstance) {
            try {
                itemLocationInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'itemLocation.label', default: 'ItemLocation'), params.id])}"
            redirect(action: "list")
        }
    }
}
