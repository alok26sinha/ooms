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

class RatingLaneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ratingLaneInstanceList: RatingLane.list(params), ratingLaneInstanceTotal: RatingLane.count()]
    }

    def create = {
        def ratingLaneInstance = new RatingLane()
        ratingLaneInstance.properties = params
        return [ratingLaneInstance: ratingLaneInstance]
    }

    def save = {
        def ratingLaneInstance = new RatingLane(params)
        if (ratingLaneInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), ratingLaneInstance.id])}"
            redirect(action: "list", id: ratingLaneInstance.id)
        }
        else {
            render(view: "create", model: [ratingLaneInstance: ratingLaneInstance])
        }
    }

    def show = {
        def ratingLaneInstance = RatingLane.get(params.id)
        if (!ratingLaneInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ratingLaneInstance: ratingLaneInstance]
        }
    }

    def edit = {
        def ratingLaneInstance = RatingLane.get(params.id)
        if (!ratingLaneInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ratingLaneInstance: ratingLaneInstance]
        }
    }

    def update = {
        def ratingLaneInstance = RatingLane.get(params.id)
        if (ratingLaneInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ratingLaneInstance.version > version) {
                    
                    ratingLaneInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'ratingLane.label', default: 'RatingLane')] as Object[], "Another user has updated this RatingLane while you were editing")
                    render(view: "edit", model: [ratingLaneInstance: ratingLaneInstance])
                    return
                }
            }
            ratingLaneInstance.properties = params
            if (!ratingLaneInstance.hasErrors() && ratingLaneInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), ratingLaneInstance.id])}"
                redirect(action: "list", id: ratingLaneInstance.id)
            }
            else {
                render(view: "edit", model: [ratingLaneInstance: ratingLaneInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ratingLaneInstance = RatingLane.get(params.id)
        if (ratingLaneInstance) {
            try {
                ratingLaneInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'ratingLane.label', default: 'RatingLane'), params.id])}"
            redirect(action: "list")
        }
    }
}
