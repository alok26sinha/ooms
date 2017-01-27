/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core.rg

class LtlRatesZoneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ltlRatesZoneInstanceList: LtlRatesZone.list(params), ltlRatesZoneInstanceTotal: LtlRatesZone.count()]
    }

    def create = {
        def ltlRatesZoneInstance = new LtlRatesZone()
        ltlRatesZoneInstance.properties = params
        return [ltlRatesZoneInstance: ltlRatesZoneInstance]
    }

    def save = {
        def ltlRatesZoneInstance = new LtlRatesZone(params)
        if (ltlRatesZoneInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), ltlRatesZoneInstance.id])}"
            redirect(action: "list", id: ltlRatesZoneInstance.id)
        }
        else {
            render(view: "create", model: [ltlRatesZoneInstance: ltlRatesZoneInstance])
        }
    }

    def show = {
        def ltlRatesZoneInstance = LtlRatesZone.get(params.id)
        if (!ltlRatesZoneInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ltlRatesZoneInstance: ltlRatesZoneInstance]
        }
    }

    def edit = {
        def ltlRatesZoneInstance = LtlRatesZone.get(params.id)
        if (!ltlRatesZoneInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ltlRatesZoneInstance: ltlRatesZoneInstance]
        }
    }

    def update = {
        def ltlRatesZoneInstance = LtlRatesZone.get(params.id)
        if (ltlRatesZoneInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ltlRatesZoneInstance.version > version) {
                    
                    ltlRatesZoneInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone')] as Object[], "Another user has updated this LtlRatesZone while you were editing")
                    render(view: "edit", model: [ltlRatesZoneInstance: ltlRatesZoneInstance])
                    return
                }
            }
            ltlRatesZoneInstance.properties = params
            if (!ltlRatesZoneInstance.hasErrors() && ltlRatesZoneInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), ltlRatesZoneInstance.id])}"
                redirect(action: "list", id: ltlRatesZoneInstance.id)
            }
            else {
                render(view: "edit", model: [ltlRatesZoneInstance: ltlRatesZoneInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ltlRatesZoneInstance = LtlRatesZone.get(params.id)
        if (ltlRatesZoneInstance) {
            try {
                ltlRatesZoneInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ltlRatesZone.label', default: 'LtlRatesZone'), params.id])}"
            redirect(action: "list")
        }
    }
}
