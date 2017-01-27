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

class OptimizationTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [optimizationTypeInstanceList: OptimizationType.list(params), optimizationTypeInstanceTotal: OptimizationType.count()]
    }

    def create = {
        def optimizationTypeInstance = new OptimizationType()
        optimizationTypeInstance.properties = params
        return [optimizationTypeInstance: optimizationTypeInstance]
    }

    def save = {
        def optimizationTypeInstance = new OptimizationType(params)
        if (optimizationTypeInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), optimizationTypeInstance.id])}"
            redirect(action: "list", id: optimizationTypeInstance.id)
        }
        else {
            render(view: "create", model: [optimizationTypeInstance: optimizationTypeInstance])
        }
    }

    def show = {
        def optimizationTypeInstance = OptimizationType.get(params.id)
        if (!optimizationTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [optimizationTypeInstance: optimizationTypeInstance]
        }
    }

    def edit = {
        def optimizationTypeInstance = OptimizationType.get(params.id)
        if (!optimizationTypeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [optimizationTypeInstance: optimizationTypeInstance]
        }
    }

    def update = {
        def optimizationTypeInstance = OptimizationType.get(params.id)
        if (optimizationTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (optimizationTypeInstance.version > version) {
                    
                    optimizationTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType')] as Object[], "Another user has updated this OptimizationType while you were editing")
                    render(view: "edit", model: [optimizationTypeInstance: optimizationTypeInstance])
                    return
                }
            }
            optimizationTypeInstance.properties = params
            if (!optimizationTypeInstance.hasErrors() && optimizationTypeInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), optimizationTypeInstance.id])}"
                redirect(action: "list", id: optimizationTypeInstance.id)
            }
            else {
                render(view: "edit", model: [optimizationTypeInstance: optimizationTypeInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def optimizationTypeInstance = OptimizationType.get(params.id)
        if (optimizationTypeInstance) {
            try {
                optimizationTypeInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'optimizationType.label', default: 'OptimizationType'), params.id])}"
            redirect(action: "list")
        }
    }
}
