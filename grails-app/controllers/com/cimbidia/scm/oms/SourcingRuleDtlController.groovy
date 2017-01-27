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

class SourcingRuleDtlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sourcingRuleDtlInstanceList: SourcingRuleDtl.list(params), sourcingRuleDtlInstanceTotal: SourcingRuleDtl.count()]
    }

    def create = {
        def sourcingRuleDtlInstance = new SourcingRuleDtl()
        sourcingRuleDtlInstance.properties = params
        return [sourcingRuleDtlInstance: sourcingRuleDtlInstance]
    }

    def save = {
        def sourcingRuleDtlInstance = new SourcingRuleDtl(params)
        if (sourcingRuleDtlInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), sourcingRuleDtlInstance.id])}"
            redirect(action: "list", id: sourcingRuleDtlInstance.id)
        }
        else {
            render(view: "create", model: [sourcingRuleDtlInstance: sourcingRuleDtlInstance])
        }
    }

    def show = {
        def sourcingRuleDtlInstance = SourcingRuleDtl.get(params.id)
        if (!sourcingRuleDtlInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sourcingRuleDtlInstance: sourcingRuleDtlInstance]
        }
    }

    def edit = {
        def sourcingRuleDtlInstance = SourcingRuleDtl.get(params.id)
        if (!sourcingRuleDtlInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sourcingRuleDtlInstance: sourcingRuleDtlInstance]
        }
    }

    def update = {
        def sourcingRuleDtlInstance = SourcingRuleDtl.get(params.id)
        if (sourcingRuleDtlInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sourcingRuleDtlInstance.version > version) {
                    
                    sourcingRuleDtlInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl')] as Object[], "Another user has updated this SourcingRuleDtl while you were editing")
                    render(view: "edit", model: [sourcingRuleDtlInstance: sourcingRuleDtlInstance])
                    return
                }
            }
            sourcingRuleDtlInstance.properties = params
            if (!sourcingRuleDtlInstance.hasErrors() && sourcingRuleDtlInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), sourcingRuleDtlInstance.id])}"
                redirect(action: "list", id: sourcingRuleDtlInstance.id)
            }
            else {
                render(view: "edit", model: [sourcingRuleDtlInstance: sourcingRuleDtlInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sourcingRuleDtlInstance = SourcingRuleDtl.get(params.id)
        if (sourcingRuleDtlInstance) {
            try {
                sourcingRuleDtlInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleDtl.label', default: 'SourcingRuleDtl'), params.id])}"
            redirect(action: "list")
        }
    }
}
