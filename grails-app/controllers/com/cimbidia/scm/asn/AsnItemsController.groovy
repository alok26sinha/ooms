/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.asn

class AsnItemsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [asnItemsInstanceList: AsnItems.list(params), asnItemsInstanceTotal: AsnItems.count()]
    }

    def create = {
        def asnItemsInstance = new AsnItems()
        asnItemsInstance.properties = params
        return [asnItemsInstance: asnItemsInstance]
    }

    def save = {
        def asnItemsInstance = new AsnItems(params)
        if (asnItemsInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), asnItemsInstance.id])}"
            redirect(action: "list", id: asnItemsInstance.id)
        }
        else {
            render(view: "create", model: [asnItemsInstance: asnItemsInstance])
        }
    }

    def show = {
        def asnItemsInstance = AsnItems.get(params.id)
        if (!asnItemsInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
            redirect(action: "list")
        }
        else {
            [asnItemsInstance: asnItemsInstance]
        }
    }

    def edit = {
        def asnItemsInstance = AsnItems.get(params.id)
        if (!asnItemsInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [asnItemsInstance: asnItemsInstance]
        }
    }

    def update = {
        def asnItemsInstance = AsnItems.get(params.id)
        if (asnItemsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (asnItemsInstance.version > version) {
                    
                    asnItemsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'asnItems.label', default: 'AsnItems')] as Object[], "Another user has updated this AsnItems while you were editing")
                    render(view: "edit", model: [asnItemsInstance: asnItemsInstance])
                    return
                }
            }
            asnItemsInstance.properties = params
            if (!asnItemsInstance.hasErrors() && asnItemsInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), asnItemsInstance.id])}"
                redirect(action: "list", id: asnItemsInstance.id)
            }
            else {
                render(view: "edit", model: [asnItemsInstance: asnItemsInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def asnItemsInstance = AsnItems.get(params.id)
        if (asnItemsInstance) {
            try {
                asnItemsInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asnItems.label', default: 'AsnItems'), params.id])}"
            redirect(action: "list")
        }
    }
}
