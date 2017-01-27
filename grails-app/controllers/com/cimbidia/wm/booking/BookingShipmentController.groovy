/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.booking

class BookingShipmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookingShipmentInstanceList: BookingShipment.list(params), bookingShipmentInstanceTotal: BookingShipment.count()]
    }

    def create = {
        def bookingShipmentInstance = new BookingShipment()
        bookingShipmentInstance.properties = params
        return [bookingShipmentInstance: bookingShipmentInstance]
    }

    def save = {
        def bookingShipmentInstance = new BookingShipment(params)
        if (bookingShipmentInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), bookingShipmentInstance.id])}"
            redirect(action: "list", id: bookingShipmentInstance.id)
        }
        else {
            render(view: "create", model: [bookingShipmentInstance: bookingShipmentInstance])
        }
    }

    def show = {
        def bookingShipmentInstance = BookingShipment.get(params.id)
        if (!bookingShipmentInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookingShipmentInstance: bookingShipmentInstance]
        }
    }

    def edit = {
        def bookingShipmentInstance = BookingShipment.get(params.id)
        if (!bookingShipmentInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookingShipmentInstance: bookingShipmentInstance]
        }
    }

    def update = {
        def bookingShipmentInstance = BookingShipment.get(params.id)
        if (bookingShipmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookingShipmentInstance.version > version) {
                    
                    bookingShipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment')] as Object[], "Another user has updated this BookingShipment while you were editing")
                    render(view: "edit", model: [bookingShipmentInstance: bookingShipmentInstance])
                    return
                }
            }
            bookingShipmentInstance.properties = params
            if (!bookingShipmentInstance.hasErrors() && bookingShipmentInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), bookingShipmentInstance.id])}"
                redirect(action: "list", id: bookingShipmentInstance.id)
            }
            else {
                render(view: "edit", model: [bookingShipmentInstance: bookingShipmentInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookingShipmentInstance = BookingShipment.get(params.id)
        if (bookingShipmentInstance) {
            try {
                bookingShipmentInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingShipment.label', default: 'BookingShipment'), params.id])}"
            redirect(action: "list")
        }
    }
}
