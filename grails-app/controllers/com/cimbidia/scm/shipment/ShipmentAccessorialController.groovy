/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.shipment

import java.util.List;

import  com.cimbidia.scm.shipment.ShipmentAccessorial;
import com.cimbidia.wm.shipment.Shipment;
import com.cimbidia.wm.shipment.ShipmentCarrier;
class ShipmentAccessorialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def shipmentService
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		List<ShipmentAccessorial> shipmentAccessorials = shipmentService.getAccessorialsForShipment("4028810c45a8369f0145a857aeb80054");
       
		[shipmentAccessorialInstanceList: shipmentAccessorials, shipmentAccessorialInstanceTotal: ShipmentAccessorial.count()]
    }

    def create = {
        def shipmentAccessorialInstance = new ShipmentAccessorial()
        shipmentAccessorialInstance.properties = params
        return [shipmentAccessorialInstance: shipmentAccessorialInstance]
    }

    def save = {
		println("Save Called");
        def shipmentAccessorialInstance = new ShipmentAccessorial(params)
        if (shipmentAccessorialInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), shipmentAccessorialInstance.id])}"
            redirect(action: "list", id: shipmentAccessorialInstance.id)
        }
        else {
            render(view: "create", model: [shipmentAccessorialInstance: shipmentAccessorialInstance])
        }
    }

    def show = {
        def shipmentAccessorialInstance = ShipmentAccessorial.get(params.id)
        if (!shipmentAccessorialInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shipmentAccessorialInstance: shipmentAccessorialInstance]
        }
    }

    def edit = {
        def shipmentAccessorialInstance = ShipmentAccessorial.get(params.id)
        if (!shipmentAccessorialInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shipmentAccessorialInstance: shipmentAccessorialInstance]
        }
    }

    def update = {
        def shipmentAccessorialInstance = ShipmentAccessorial.get(params.id)
        if (shipmentAccessorialInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shipmentAccessorialInstance.version > version) {
                    
                    shipmentAccessorialInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial')] as Object[], "Another user has updated this ShipmentAccessorial while you were editing")
                    render(view: "edit", model: [shipmentAccessorialInstance: shipmentAccessorialInstance])
                    return
                }
            }
            shipmentAccessorialInstance.properties = params
            if (!shipmentAccessorialInstance.hasErrors() && shipmentAccessorialInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), shipmentAccessorialInstance.id])}"
                redirect(action: "list", id: shipmentAccessorialInstance.id)
            }
            else {
                render(view: "edit", model: [shipmentAccessorialInstance: shipmentAccessorialInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shipmentAccessorialInstance = ShipmentAccessorial.get(params.id)
        if (shipmentAccessorialInstance) {
            try {
                shipmentAccessorialInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def saveAll = {
		println "params : "+params
		def shipAcc = params.id;
		def rate = params.rateid;
		def grandtotal = params.grandtotal;
		def shipmentAccessorialInstance = ShipmentAccessorial.findById(params.id);
		def shipment=Shipment.findById(shipmentAccessorialInstance.shipment.id)
		shipment.carrierPrice=Float.parseFloat(grandtotal)
		def shipmentCarrier=ShipmentCarrier.findById(params.shipCarrier)
		shipmentCarrier.totalCost=Float.parseFloat(grandtotal)
		//render(view: "shipment/edit", model: [shipmentInstance: shipment])
		redirect(controller: 'shipment', action:'showDetails',model: [id: shipment.id])
		/*for(int i=0; i < shipAcc.size(); i++){
			def shipmentAccessorialInstance = ShipmentAccessorial.get(shipAcc[i]);
			shipmentAccessorialInstance.rate =     Double.parseDouble(rate[i]);
			if (shipmentAccessorialInstance) {
				if (!shipmentAccessorialInstance.save(flush: true)) {
					
					return error();
				}
			}
		}
		
		render(status: 200, text: 'success');*/
	}
	
	def saveAcc = {
		println "params : "+params
	}
}
