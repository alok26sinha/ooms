/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.scm.rs

import com.cimbidia.scm.admin.Company

class RsDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rsDetailInstanceList: RsDetail.list(params), rsDetailInstanceTotal: RsDetail.count()]
    }

    def create = {
        def rsDetailInstance = new RsDetail()
        rsDetailInstance.properties = params
        return [rsDetailInstance: rsDetailInstance]
    }

	def loadCreate = {
		def rsDetailInstance = new RsDetail()
		render(view:"create", model: [rsDetailInstance: rsDetailInstance])
	}
    def save = {
        def rsDetailInstance = new RsDetail(params)
		
		Company company = params.company ? params.company :  session.company
		rsDetailInstance.parentId = company?.id
        if (rsDetailInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), rsDetailInstance.id])}"
            redirect(action: "list", id: rsDetailInstance.id)
        }
        else {
            render(view: "create", model: [rsDetailInstance: rsDetailInstance])
        }
    }

    def show = {
        def rsDetailInstance = RsDetail.get(params.id)
        if (!rsDetailInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            [rsDetailInstance: rsDetailInstance]
        }
    }

    def edit = {
        def rsDetailInstance = RsDetail.get(params.id)
        if (!rsDetailInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [rsDetailInstance: rsDetailInstance]
        }
    }

    def update = {
        def rsDetailInstance = RsDetail.get(params.id)
        if (rsDetailInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (rsDetailInstance.version > version) {
                    
                    rsDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'rsDetail.label', default: 'RsDetail')] as Object[], "Another user has updated this RsDetail while you were editing")
                    render(view: "edit", model: [rsDetailInstance: rsDetailInstance])
                    return
                }
            }
            rsDetailInstance.properties = params
            if (!rsDetailInstance.hasErrors() && rsDetailInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), rsDetailInstance.id])}"
                redirect(action: "list", id: rsDetailInstance.id)
            }
            else {
                render(view: "edit", model: [rsDetailInstance: rsDetailInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		def  ids = params.selectedCheck;
		
		def  idArray  = ids.substring(1, ids.size());
		def str = idArray.split(",")	
		
		try {
			for(int i=0; i< str.size();i++)
			{
				
		
				def rsDetailInstance = RsDetail.get(str[i])
				if (rsDetailInstance) {
					rsDetailInstance.delete(flush: true)
					flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
				}       
				
			}
			redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        
        /*else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
            redirect(action: "list")
        }*/
    }
}
