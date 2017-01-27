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

class EquipmentSizeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [equipmentSizeInstanceList: EquipmentSize.list(params), equipmentSizeInstanceTotal: EquipmentSize.count()]
    }

    def create = {
        def equipmentSizeInstance = new EquipmentSize()
        equipmentSizeInstance.equipment = Equipment.get(params.id)
        equipmentSizeInstance.properties = params
        return [equipmentSizeInstance: equipmentSizeInstance]
    }

    def save = {
        def equipmentSizeInstance = new EquipmentSize(params)
        if (equipmentSizeInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), equipmentSizeInstance.id])}"
            redirect(controller: "equipment", action: "show", id: equipmentSizeInstance.equipment.id)
        }
        else {
            render(view: "create", model: [equipmentSizeInstance: equipmentSizeInstance])
        }
    }

    def show = {
        def equipmentSizeInstance = EquipmentSize.get(params.id)
        if (!equipmentSizeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
            redirect(action: "list")
        }
        else {
            [equipmentSizeInstance: equipmentSizeInstance]
        }
    }

    def edit = {
        def equipmentSizeInstance = EquipmentSize.get(params.id)
        if (!equipmentSizeInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [equipmentSizeInstance: equipmentSizeInstance]
        }
    }

    def update = {
        def equipmentSizeInstance = EquipmentSize.get(params.id)
        if (equipmentSizeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (equipmentSizeInstance.version > version) {
                    
                    equipmentSizeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize')] as Object[], "Another user has updated this EquipmentSize while you were editing")
                    render(view: "edit", model: [equipmentSizeInstance: equipmentSizeInstance])
                    return
                }
            }
            equipmentSizeInstance.properties = params
            if (!equipmentSizeInstance.hasErrors() && equipmentSizeInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), equipmentSizeInstance.id])}"
                redirect(action: "list", id: equipmentSizeInstance.id)
            }
            else {
                render(view: "edit", model: [equipmentSizeInstance: equipmentSizeInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def equipmentSizeInstance = EquipmentSize.get(params.id)
        if (equipmentSizeInstance) {
            try {
                equipmentSizeInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'equipmentSize.label', default: 'EquipmentSize'), params.id])}"
            redirect(action: "list")
        }
    }
}
