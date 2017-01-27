/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.asn

import com.cimbidia.scm.admin.Company

class AsnController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [asnInstanceList: Asn.list(params), asnInstanceTotal: Asn.count()]
    }

    def create = {
        def asnInstance = new Asn()
        asnInstance.properties = params
        return [asnInstance: asnInstance]
    }

    def save = {
		
		Integer companyId = params.companyId ? params.companyId :  session.companyId
	
        def asnInstance = new Asn(params)
		asnInstance.companyId = Company.findById( companyId)
        if (asnInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), asnInstance.id])}"
            redirect(action: "list", id: asnInstance.id)
        }
        else {
            render(view: "create", model: [asnInstance: asnInstance])
        }
    }

    def show = {
        def asnInstance = Asn.get(params.id)
        if (!asnInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
            redirect(action: "list")
        }
        else {
            [asnInstance: asnInstance]
        }
    }

    def edit = {
        def asnInstance = Asn.get(params.id)
        if (!asnInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [asnInstance: asnInstance]
        }
    }

    def update = {
		
		
		Integer companyId = params.companyId ? params.companyId :  session.companyId
		
			
			
        def asnInstance = Asn.get(params.id)
        if (asnInstance) {
            if (params.version) {
				asnInstance.companyId = Company.findById( companyId)
                def version = params.version.toLong()
                if (asnInstance.version > version) {
                    
                    asnInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'asn.label', default: 'Asn')] as Object[], "Another user has updated this Asn while you were editing")
                    render(view: "edit", model: [asnInstance: asnInstance])
                    return
                }
            }
            asnInstance.properties = params
			asnInstance.companyId = Company.findById( companyId)
            if (!asnInstance.hasErrors() && asnInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), asnInstance.id])}"
                redirect(action: "list", id: asnInstance.id)
            }
            else {
                render(view: "edit", model: [asnInstance: asnInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def asnInstance = Asn.get(params.id)
        if (asnInstance) {
            try {
                asnInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'asn.label', default: 'Asn'), params.id])}"
            redirect(action: "list")
        }
    }
}
