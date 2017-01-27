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

class RatingLaneLtlRatesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ratingLaneLtlRatesInstanceList: RatingLaneLtlRates.list(params), ratingLaneLtlRatesInstanceTotal: RatingLaneLtlRates.count()]
    }

    def create = {
        def ratingLaneLtlRatesInstance = new RatingLaneLtlRates()
        ratingLaneLtlRatesInstance.properties = params
        return [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance]
    }

    def save = {
		
		def ratingLaneCarrier = params.ratingLaneCarrier.id
        def ratingLaneLtlRatesInstance = new RatingLaneLtlRates(params)
        if (ratingLaneLtlRatesInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), ratingLaneLtlRatesInstance.id])}"
            redirect(controller:"ratingLaneCarrier", action: "edit", id: ratingLaneCarrier)
        }
        else {
            render(view: "create", model: [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance])
        }
    }

    def show = {
        def ratingLaneLtlRatesInstance = RatingLaneLtlRates.get(params.id)
        if (!ratingLaneLtlRatesInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance]
        }
    }

    def edit = {
        def ratingLaneLtlRatesInstance = RatingLaneLtlRates.get(params.id)
        if (!ratingLaneLtlRatesInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance]
        }
    }

    def update = {
		//println params
		def ratingLaneCarrier = params.ratingLaneCarrier.id
		println " ratingLaneCarrier "+ratingLaneCarrier
        def ratingLaneLtlRatesInstance = RatingLaneLtlRates.get(params.id)
        if (ratingLaneLtlRatesInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ratingLaneLtlRatesInstance.version > version) {
                    
                    ratingLaneLtlRatesInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates')] as Object[], "Another user has updated this RatingLaneLtlRates while you were editing")
                    render(view: "edit", model: [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance])
                    return
                }
            }
            ratingLaneLtlRatesInstance.properties = params
			
            if (!ratingLaneLtlRatesInstance.hasErrors() && ratingLaneLtlRatesInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), ratingLaneLtlRatesInstance.id])}"
                redirect(controller:"ratingLaneCarrier", action: "edit", id: ratingLaneCarrier)
            }
            else {
                render(view: "edit", model: [ratingLaneLtlRatesInstance: ratingLaneLtlRatesInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ratingLaneLtlRatesInstance = RatingLaneLtlRates.get(params.id)
        if (ratingLaneLtlRatesInstance) {
            try {
                ratingLaneLtlRatesInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates'), params.id])}"
            redirect(action: "list")
        }
    }
}
