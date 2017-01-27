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

import com.cimbidia.scm.admin.Company

class FulfillmentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [fulfillmentTypeInstanceList: FulfillmentType.list(params), fulfillmentTypeInstanceTotal: FulfillmentType.count()]
    }

    def create = {
        def fulfillmentTypeInstance = new FulfillmentType()
        fulfillmentTypeInstance.properties = params
        return [fulfillmentTypeInstance: fulfillmentTypeInstance]
    }

    def save = {
        def fulfillmentTypeInstance = new FulfillmentType(params)
		Company company = params.company ? params.company :  session.company
		fulfillmentTypeInstance.company = company
		fulfillmentTypeInstance.createdBy = session.user
        if (fulfillmentTypeInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), fulfillmentTypeInstance.id])}"
            redirect(action: "list", id: fulfillmentTypeInstance.id)
        }
        else {
            render(view: "create", model: [fulfillmentTypeInstance: fulfillmentTypeInstance])
        }
    }

    def show = {
        def fulfillmentTypeInstance = FulfillmentType.get(params.id)
        if (!fulfillmentTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [fulfillmentTypeInstance: fulfillmentTypeInstance]
        }
    }

    def edit = {
        def fulfillmentTypeInstance = FulfillmentType.get(params.id)
        if (!fulfillmentTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [fulfillmentTypeInstance: fulfillmentTypeInstance]
        }
    }

    def update = {
        def fulfillmentTypeInstance = FulfillmentType.get(params.id)
        if (fulfillmentTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (fulfillmentTypeInstance.version > version) {
                    
                    fulfillmentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType')] as Object[], "Another user has updated this FulfillmentType while you were editing")
                    render(view: "edit", model: [fulfillmentTypeInstance: fulfillmentTypeInstance])
                    return
                }
            }
            fulfillmentTypeInstance.properties = params
            if (!fulfillmentTypeInstance.hasErrors() && fulfillmentTypeInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), fulfillmentTypeInstance.id])}"
                redirect(action: "list", id: fulfillmentTypeInstance.id)
            }
            else {
                render(view: "edit", model: [fulfillmentTypeInstance: fulfillmentTypeInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def fulfillmentTypeInstance = FulfillmentType.get(params.id)
        if (fulfillmentTypeInstance) {
            try {
                fulfillmentTypeInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'fulfillmentType.label', default: 'FulfillmentType'), params.id])}"
            redirect(action: "list")
        }
    }
}
