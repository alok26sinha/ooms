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

class InvAvailSafetyFactorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invAvailSafetyFactorInstanceList: InvAvailSafetyFactor.list(params), invAvailSafetyFactorInstanceTotal: InvAvailSafetyFactor.count()]
    }

    def create = {
        def invAvailSafetyFactorInstance = new InvAvailSafetyFactor()
        invAvailSafetyFactorInstance.properties = params
        return [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance]
    }

    def save = {
		
        def invAvailSafetyFactorInstance = new InvAvailSafetyFactor(params)
		
		invAvailSafetyFactorInstance.createdBy = params.user;
        if (invAvailSafetyFactorInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), invAvailSafetyFactorInstance.id])}"
            redirect(action: "list", id: invAvailSafetyFactorInstance.id)
        }
        else {
            render(view: "create", model: [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance])
        }
    }

    def show = {
        def invAvailSafetyFactorInstance = InvAvailSafetyFactor.get(params.id)
        if (!invAvailSafetyFactorInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
            redirect(action: "list")
        }
        else {
            [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance]
        }
    }

    def edit = {
        def invAvailSafetyFactorInstance = InvAvailSafetyFactor.get(params.id)
        if (!invAvailSafetyFactorInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance]
        }
    }

    def update = {
        def invAvailSafetyFactorInstance = InvAvailSafetyFactor.get(params.id)
		invAvailSafetyFactorInstance.modifiedBy = params.user;
        if (invAvailSafetyFactorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (invAvailSafetyFactorInstance.version > version) {
                    
                    invAvailSafetyFactorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor')] as Object[], "Another user has updated this InvAvailSafetyFactor while you were editing")
                    render(view: "edit", model: [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance])
                    return
                }
            }
            invAvailSafetyFactorInstance.properties = params
            if (!invAvailSafetyFactorInstance.hasErrors() && invAvailSafetyFactorInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), invAvailSafetyFactorInstance.id])}"
                redirect(action: "list", id: invAvailSafetyFactorInstance.id)
            }
            else {
                render(view: "edit", model: [invAvailSafetyFactorInstance: invAvailSafetyFactorInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def invAvailSafetyFactorInstance = InvAvailSafetyFactor.get(params.id)
        if (invAvailSafetyFactorInstance) {
            try {
                invAvailSafetyFactorInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'invAvailSafetyFactor.label', default: 'InvAvailSafetyFactor'), params.id])}"
            redirect(action: "list")
        }
    }
}
