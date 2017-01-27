/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core

class EquipmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [equipmentInstanceList: Equipment.list(params), equipmentInstanceTotal: Equipment.count()]
    }

    def create = {
        def equipmentInstance = new Equipment()
        equipmentInstance.properties = params
        return [equipmentInstance: equipmentInstance]
    }

    def save = {
        def equipmentInstance = new Equipment(params)
        if (equipmentInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])}"
            redirect(action: "list", id: equipmentInstance.id)
        }
        else {
            render(view: "create", model: [equipmentInstance: equipmentInstance])
        }
    }

    def show = {
        def equipmentInstance = Equipment.get(params.id)
        if (!equipmentInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [equipmentInstance: equipmentInstance]
        }
    }

    def edit = {
        def equipmentInstance = Equipment.get(params.id)
        if (!equipmentInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [equipmentInstance: equipmentInstance]
        }
    }

    def update = {
        def equipmentInstance = Equipment.get(params.id)
        if (equipmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (equipmentInstance.version > version) {
                    
                    equipmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'equipment.label', default: 'Equipment')] as Object[], "Another user has updated this Equipment while you were editing")
                    render(view: "edit", model: [equipmentInstance: equipmentInstance])
                    return
                }
            }
            equipmentInstance.properties = params
            if (!equipmentInstance.hasErrors() && equipmentInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), equipmentInstance.id])}"
                redirect(action: "list", id: equipmentInstance.id)
            }
            else {
                render(view: "edit", model: [equipmentInstance: equipmentInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def equipmentInstance = Equipment.get(params.id)
        if (equipmentInstance) {
            try {
                equipmentInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipment.label', default: 'Equipment'), params.id])}"
            redirect(action: "list")
        }
    }
}
