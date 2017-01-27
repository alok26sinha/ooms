/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.shipment

class ShipperController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shipperInstanceList: Shipper.list(params), shipperInstanceTotal: Shipper.count()]
    }

    def create = {
        def shipperInstance = new Shipper()
        shipperInstance.properties = params
        return [shipperInstance: shipperInstance]
    }

    def save = {
        def shipperInstance = new Shipper(params)
        if (shipperInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), shipperInstance.id])}"
            redirect(action: "list", id: shipperInstance.id)
        }
        else {
            render(view: "create", model: [shipperInstance: shipperInstance])
        }
    }

    def show = {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipperInstance: shipperInstance]
        }
    }

    def edit = {
        def shipperInstance = Shipper.get(params.id)
        if (!shipperInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipperInstance: shipperInstance]
        }
    }

    def update = {
        def shipperInstance = Shipper.get(params.id)
        if (shipperInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipperInstance.version > version) {
                    
                    shipperInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'shipper.label', default: 'Shipper')] as Object[], "Another user has updated this Shipper while you were editing")
                    render(view: "edit", model: [shipperInstance: shipperInstance])
                    return
                }
            }
            shipperInstance.properties = params
            if (!shipperInstance.hasErrors() && shipperInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), shipperInstance.id])}"
                redirect(action: "list", id: shipperInstance.id)
            }
            else {
                render(view: "edit", model: [shipperInstance: shipperInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipperInstance = Shipper.get(params.id)
        if (shipperInstance) {
            try {
                shipperInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipper.label', default: 'Shipper'), params.id])}"
            redirect(action: "list")
        }
    }
}
