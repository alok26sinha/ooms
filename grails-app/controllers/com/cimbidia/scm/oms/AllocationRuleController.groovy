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

import com.cimbidia.scm.admin.Company

class AllocationRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [allocationRuleInstanceList: AllocationRule.list(params), allocationRuleInstanceTotal: AllocationRule.count()]
    }

    def create = {
        def allocationRuleInstance = new AllocationRule()
        allocationRuleInstance.properties = params
        return [allocationRuleInstance: allocationRuleInstance]
    }

    def save = {
        def allocationRuleInstance = new AllocationRule(params)
		Company company = params.company ? params.company :  session.company
		allocationRuleInstance.company = company
		allocationRuleInstance.createdBy = session.user
        if (allocationRuleInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), allocationRuleInstance.id])}"
            redirect(action: "list", id: allocationRuleInstance.id)
        }
        else {
            render(view: "create", model: [allocationRuleInstance: allocationRuleInstance])
        }
    }

    def show = {
        def allocationRuleInstance = AllocationRule.get(params.id)
        if (!allocationRuleInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [allocationRuleInstance: allocationRuleInstance]
        }
    }

    def edit = {
        def allocationRuleInstance = AllocationRule.get(params.id)
        if (!allocationRuleInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "edit", model: [allocationRuleInstance: allocationRuleInstance])
        }
    }

    def update = {
        def allocationRuleInstance = AllocationRule.get(params.id)
        if (allocationRuleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (allocationRuleInstance.version > version) {
                    
                    allocationRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule')] as Object[], "Another user has updated this AllocationRule while you were editing")
                    render(view: "edit", model: [allocationRuleInstance: allocationRuleInstance])
                    return
                }
            }
            allocationRuleInstance.properties = params
            if (!allocationRuleInstance.hasErrors() && allocationRuleInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), allocationRuleInstance.id])}"
                redirect(action: "list", id: allocationRuleInstance.id)
            }
            else {
                render(view: "edit", model: [allocationRuleInstance: allocationRuleInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def allocationRuleInstance = AllocationRule.get(params.id)
        if (allocationRuleInstance) {
            try {
                allocationRuleInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'allocationRule.label', default: 'AllocationRule'), params.id])}"
            redirect(action: "list")
        }
    }
}
