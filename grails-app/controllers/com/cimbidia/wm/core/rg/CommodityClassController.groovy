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

class CommodityClassController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commodityClassInstanceList: CommodityClass.list(params), commodityClassInstanceTotal: CommodityClass.count()]
    }

    def create = {
        def commodityClassInstance = new CommodityClass()
        commodityClassInstance.properties = params
        return [commodityClassInstance: commodityClassInstance]
    }

    def save = {
        def commodityClassInstance = new CommodityClass(params)
        if (commodityClassInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), commodityClassInstance.id])}"
            redirect(action: "list", id: commodityClassInstance.id)
        }
        else {
            render(view: "create", model: [commodityClassInstance: commodityClassInstance])
        }
    }

    def show = {
        def commodityClassInstance = CommodityClass.get(params.id)
        if (!commodityClassInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
            redirect(action: "list")
        }
        else {
            [commodityClassInstance: commodityClassInstance]
        }
    }

    def edit = {
        def commodityClassInstance = CommodityClass.get(params.id)
        if (!commodityClassInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [commodityClassInstance: commodityClassInstance]
        }
    }

    def update = {
        def commodityClassInstance = CommodityClass.get(params.id)
        if (commodityClassInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (commodityClassInstance.version > version) {
                    
                    commodityClassInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass')] as Object[], "Another user has updated this CommodityClass while you were editing")
                    render(view: "edit", model: [commodityClassInstance: commodityClassInstance])
                    return
                }
            }
            commodityClassInstance.properties = params
            if (!commodityClassInstance.hasErrors() && commodityClassInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), commodityClassInstance.id])}"
                redirect(action: "list", id: commodityClassInstance.id)
            }
            else {
                render(view: "edit", model: [commodityClassInstance: commodityClassInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def commodityClassInstance = CommodityClass.get(params.id)
        if (commodityClassInstance) {
            try {
                commodityClassInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'commodityClass.label', default: 'CommodityClass'), params.id])}"
            redirect(action: "list")
        }
    }
}
