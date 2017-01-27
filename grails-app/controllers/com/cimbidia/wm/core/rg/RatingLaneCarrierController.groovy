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

class RatingLaneCarrierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ratingLaneCarrierInstanceList: RatingLaneCarrier.list(params), ratingLaneCarrierInstanceTotal: RatingLaneCarrier.count()]
    }

    def create = {
        def ratingLaneCarrierInstance = new RatingLaneCarrier()
        ratingLaneCarrierInstance.properties = params
        return [ratingLaneCarrierInstance: ratingLaneCarrierInstance]
    }

    def save = {
		
		def ratingLane = params. ratingLane.id
        def ratingLaneCarrierInstance = new RatingLaneCarrier(params)
        if (ratingLaneCarrierInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), ratingLaneCarrierInstance.id])}"
            redirect(controller:"ratingLane",action: "edit", id: ratingLane)
        }
        else {
            render(view: "create", model: [ratingLaneCarrierInstance: ratingLaneCarrierInstance])
        }
    }

    def show = {
        def ratingLaneCarrierInstance = RatingLaneCarrier.get(params.id)
        if (!ratingLaneCarrierInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ratingLaneCarrierInstance: ratingLaneCarrierInstance]
        }
    }

	def showRateDtls = {
        def ratingLaneCarrierInstance = RatingLaneCarrier.get(params.id)
        def totalCost = params.totalCost
        List ratingLaneAccessorials = RatingLaneAccessorial.findAllByRatingLaneCarrier(ratingLaneCarrierInstance)
        if(ratingLaneAccessorials)
        	ratingLaneCarrierInstance.ratingLaneAccessorialList = ratingLaneAccessorials
        if (!ratingLaneCarrierInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ratingLaneCarrierInstance: ratingLaneCarrierInstance, totalCost: totalCost]
        }
    }
    
    def edit = {
        def ratingLaneCarrierInstance = RatingLaneCarrier.get(params.id)
        if (!ratingLaneCarrierInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ratingLaneCarrierInstance: ratingLaneCarrierInstance]
        }
    }

    def update = {
		//println params
		def ratingLane = params.id
        def ratingLaneCarrierInstance = RatingLaneCarrier.get(params.id)
        if (ratingLaneCarrierInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ratingLaneCarrierInstance.version > version) {
                    
                    ratingLaneCarrierInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')] as Object[], "Another user has updated this RatingLaneCarrier while you were editing")
                    render(view: "edit", model: [ratingLaneCarrierInstance: ratingLaneCarrierInstance])
                    return
                }
            }
            ratingLaneCarrierInstance.properties = params
			
            if (!ratingLaneCarrierInstance.hasErrors() && ratingLaneCarrierInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), ratingLaneCarrierInstance.id])}"
                 redirect(controller:"ratingLane",action: "edit", id: ratingLane)
            }
            else {
                render(view: "edit", model: [ratingLaneCarrierInstance: ratingLaneCarrierInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ratingLaneCarrierInstance = RatingLaneCarrier.get(params.id)
        if (ratingLaneCarrierInstance) {
            try {
                ratingLaneCarrierInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier'), params.id])}"
            redirect(action: "list")
        }
    }
}
