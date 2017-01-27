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
import com.cimbidia.wm.customerOrder.CustomerOrder

class SourcingRuleHdrController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sourcingRuleHdrInstanceList: SourcingRuleHdr.list(params), sourcingRuleHdrInstanceTotal: SourcingRuleHdr.count()]
    }

    def create = {
        def sourcingRuleHdrInstance = new SourcingRuleHdr()
        sourcingRuleHdrInstance.properties = params
        return [sourcingRuleHdrInstance: sourcingRuleHdrInstance]
    }
	def source = {
		CustomerOrder co = CustomerOrder.findById("4028810c4564df8d014564e9d45c0002");
		print(co);
		ArrayList cos = new ArrayList<CustomerOrder>();
		cos.add(co);
		SourcingService  service = new SourcingService();
		service.source(cos);
	}
    def save = {
		
        def sourcingRuleHdrInstance = new SourcingRuleHdr(params)
		
		Company company = params.company ? params.company :  session.company
		sourcingRuleHdrInstance.company = company
		sourcingRuleHdrInstance.createdBy = session.user
        if (sourcingRuleHdrInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), sourcingRuleHdrInstance.id])}"
            redirect(action: "list", id: sourcingRuleHdrInstance.id)
        }
        else {
            render(view: "create", model: [sourcingRuleHdrInstance: sourcingRuleHdrInstance])
        }
    }

    def show = {
        def sourcingRuleHdrInstance = SourcingRuleHdr.get(params.id)
        if (!sourcingRuleHdrInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sourcingRuleHdrInstance: sourcingRuleHdrInstance]
        }
    }

    def edit = {
        def sourcingRuleHdrInstance = SourcingRuleHdr.get(params.id)
        if (!sourcingRuleHdrInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "edit", model: [sourcingRuleHdrInstance: sourcingRuleHdrInstance])
        }
    }

    def update = {
		
        def sourcingRuleHdrInstance = SourcingRuleHdr.get(params.id)
		
        if (sourcingRuleHdrInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sourcingRuleHdrInstance.version > version) {
                    
                    sourcingRuleHdrInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr')] as Object[], "Another user has updated this SourcingRuleHdr while you were editing")
                    render(view: "edit", model: [sourcingRuleHdrInstance: sourcingRuleHdrInstance])
                    return
                }
            }
            sourcingRuleHdrInstance.properties = params
            if (!sourcingRuleHdrInstance.hasErrors() && sourcingRuleHdrInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), sourcingRuleHdrInstance.id])}"
                redirect(action: "list", id: sourcingRuleHdrInstance.id)
            }
            else {
                render(view: "edit", model: [sourcingRuleHdrInstance: sourcingRuleHdrInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sourcingRuleHdrInstance = SourcingRuleHdr.get(params.id)
        if (sourcingRuleHdrInstance) {
            try {
                sourcingRuleHdrInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr'), params.id])}"
            redirect(action: "list")
        }
    }
}
