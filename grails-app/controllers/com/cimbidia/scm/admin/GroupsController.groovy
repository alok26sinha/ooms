/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.admin

class GroupsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [groupsInstanceList: Groups.list(params), groupsInstanceTotal: Groups.count()]
    }

    def create = {
        def groupsInstance = new Groups()
        groupsInstance.properties = params
        return [groupsInstance: groupsInstance]
    }

    def save = {
        def groupsInstance = new Groups(params)
        if (groupsInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), groupsInstance.id])}"
            redirect(action: "list", id: groupsInstance.id)
        }
        else {
            render(view: "create", model: [groupsInstance: groupsInstance])
        }
    }

    def show = {
        def groupsInstance = Groups.get(params.id)
        if (!groupsInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groupsInstance: groupsInstance]
        }
    }

    def edit = {
        def groupsInstance = Groups.get(params.id)
        if (!groupsInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groupsInstance: groupsInstance]
        }
    }

    def update = {
        def groupsInstance = Groups.get(params.id)
        if (groupsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groupsInstance.version > version) {
                    
                    groupsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'groups.label', default: 'Groups')] as Object[], "Another user has updated this Groups while you were editing")
                    render(view: "edit", model: [groupsInstance: groupsInstance])
                    return
                }
            }
            groupsInstance.properties = params
            if (!groupsInstance.hasErrors() && groupsInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), groupsInstance.id])}"
                redirect(action: "list", id: groupsInstance.id)
            }
            else {
                render(view: "edit", model: [groupsInstance: groupsInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groupsInstance = Groups.get(params.id)
        if (groupsInstance) {
            try {
                groupsInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'groups.label', default: 'Groups'), params.id])}"
            redirect(action: "list")
        }
    }
}
