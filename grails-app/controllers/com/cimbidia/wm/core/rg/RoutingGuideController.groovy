/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.core.rg

import java.math.BigDecimal;
import java.util.List;

import org.apache.axis.types.NonNegativeInteger;

import com.cimbidia.wm.core.Address
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Mot
import com.cimbidia.wm.core.Location
import com.cimbidia.scm.admin.Company

import grails.converters.JSON
import groovy.json.JsonBuilder

import com.fedex.rate.stub.Dimensions
import com.fedex.rate.stub.LinearUnits;
import com.fedex.rate.stub.Money
import com.fedex.rate.stub.Weight
import com.fedex.rate.stub.WeightUnits;

class RoutingGuideController {

	def routingGuideService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	private formatDates(params)
	{
		if(params.effectiveStartDate)
			params.effectiveStartDate = Date.parse( 'MM/dd/yy', params.effectiveStartDate )
		if(params.effectiveEndDate)
			params.effectiveEndDate = Date.parse( 'MM/dd/yy', params.effectiveEndDate )
	}
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
    	formatDates(params);
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [routingGuideInstanceList: RoutingGuide.list(params), routingGuideInstanceTotal: RoutingGuide.count()]
    }

    def create = {
        def routingGuideInstance = new RoutingGuide()
        routingGuideInstance.properties = params
        return [routingGuideInstance: routingGuideInstance]
    }
    
    def routeLookup = {
    
    	 def routingGuideInstance = new RoutingGuide()
    }
	
	def fedexRateLookup = {
		
			 def routingGuideInstance = new RoutingGuide()
			 render(view: "fedexRateLookup", model: [routingGuideInstance: routingGuideInstance])
		}

	RoutingGuide findRoutingGuide (String id)
	{
		println "ROutingGuideController:findRoutingGuide:id="+ id
		def routingGuideInstance = RoutingGuide.get(id)
		if (!routingGuideInstance) {
	        flash.message = message(code: 'default.not.found.message', args: [message(code: 'routingGuide.label', default: 'Routing Guide'), id])
	        redirect(action: "list")
	        return
	    }
	    return routingGuideInstance
	}
	
    def save = {
    	formatDates(params);
        def routingGuideInstance = new RoutingGuide(params)
        
        if (routingGuideService.saveRoutingGuide(routingGuideInstance)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), routingGuideInstance.id])}"
            redirect(action: "list", id: routingGuideInstance.id)
        }
        else {
            render(view: "create", model: [routingGuideInstance: routingGuideInstance])
        }
    }


	def getMatchingRoutesList = 
	{
	//	println "RoutingGuideController:getMatchingRoutesList:params="+ params
		formatDates(params);
		RoutingGuideSearchCriteria routingGuideSearchInstance = new RoutingGuideSearchCriteria(params);
		Integer companyId = params.companyId ?:  session.companyId
		routingGuideSearchInstance.company = Company.findById(companyId)
		routingGuideSearchInstance.commodityClass = params.commodityClass
		
		ArrayList routingRatingLookupResultList = routingGuideService.getMatchingRoutesList(routingGuideSearchInstance, params?.max);
		//println "routingRatingLookupResultList size is " + routingRatingLookupResultList?.size()
		render(view: "routeLookup", model: [routingRatingLookupResultList: routingRatingLookupResultList, routingGuideSearchInstance : routingGuideSearchInstance])
		//return rgList;
	}
	
	def getFedexMatchingRoutesList = {
		println "RoutingGuideController:getMatchingRoutesList:params="+ params
		formatDates(params);
		FedexRoutingGuideSearchCriteria fedexRoutingGuideSearchCriteria = new FedexRoutingGuideSearchCriteria(params);
		Integer companyId = params.companyId ?:  session.companyId
		fedexRoutingGuideSearchCriteria.company = Company.findById(companyId)
		fedexRoutingGuideSearchCriteria.commodityClass = params.commodityClass
		fedexRoutingGuideSearchCriteria.groupPackageCount = params.groupPackageCount
		fedexRoutingGuideSearchCriteria.packageCount = params.packageCount
		fedexRoutingGuideSearchCriteria.dropType = params.dropType
		fedexRoutingGuideSearchCriteria.serviceType = params.serviceType
		fedexRoutingGuideSearchCriteria.packagingType = params.packagingType
		fedexRoutingGuideSearchCriteria.dateRequest = params.dateRequest
		if (params.weightUnit =='LB')
			fedexRoutingGuideSearchCriteria.weight = new Weight(WeightUnits.LB, new BigDecimal(params.weight));
		else
			fedexRoutingGuideSearchCriteria.weight = new Weight(WeightUnits.KG, new BigDecimal(params.weight));
		
		if (params.dimUnit =='IN')
			fedexRoutingGuideSearchCriteria.dimensions = new Dimensions(new NonNegativeInteger(""+params.dimLength+""), new NonNegativeInteger(""+params.dimWidth+""), new NonNegativeInteger(""+params.dimHeight+""), LinearUnits.IN)
		else
			fedexRoutingGuideSearchCriteria.dimensions = new Dimensions(new NonNegativeInteger(""+params.dimLength+""), new NonNegativeInteger(""+params.dimWidth+""), new NonNegativeInteger(""+params.dimHeight+""), LinearUnits.CM)
		
		List<FedexRate>frl = routingGuideService.getFedexMatchingRoutesList(fedexRoutingGuideSearchCriteria, params?.max);
		//println "routingRatingLookupResultList size is " + routingRatingLookupResultList?.size()
		render(view: "fedexRateLookup", model: [fedexRateList: frl, fedexRoutingGuideSearchCriteria : fedexRoutingGuideSearchCriteria])
		
		
	}
    def show = {
        def routingGuideInstance = RoutingGuide.get(params.id)
        if (!routingGuideInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
            redirect(action: "list")
        }
        else {
            [routingGuideInstance: routingGuideInstance]
        }
    }

    def edit = {
        def routingGuideInstance = RoutingGuide.get(params.id)
        if (!routingGuideInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [routingGuideInstance: routingGuideInstance]
        }
    }

    def update = {
    	formatDates(params);
        def routingGuideInstance = RoutingGuide.get(params.id)
        if (routingGuideInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (routingGuideInstance.version > version) {
                    
                    routingGuideInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide')] as Object[], "Another user has updated this RoutingGuide while you were editing")
                    render(view: "edit", model: [routingGuideInstance: routingGuideInstance])
                    return
                }
            }
            routingGuideInstance.properties = params
            println "routingGuideInstance="+ routingGuideInstance
            if (!routingGuideInstance.hasErrors() && routingGuideService.saveRoutingGuide(routingGuideInstance)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), routingGuideInstance.id])}"
                redirect(action: "list", id: routingGuideInstance.id)
            }
            else {
                render(view: "edit", model: [routingGuideInstance: routingGuideInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def routingGuideInstance = RoutingGuide.get(params.id)
        if (routingGuideInstance) {
            try {
                routingGuideInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide'), params.id])}"
            redirect(action: "list")
        }
    }
    
    def saveRoutingGuideCarrier = {
    
    	println('RoutingGuideController:saveRoutingGuideCarrier:params=' + params)
    	def routingGuideCarrierInstance
    	if(params.routingGuide.id)
    	{

    		def routingGuideInstance = findRoutingGuide(params.routingGuide.id)
 
        	routingGuideInstance.properties = params
	        routingGuideCarrierInstance = new RoutingGuideCarrier(params)
	        println "routingGuideCarrierInstance.id = " + routingGuideCarrierInstance.id
	          
	        if( routingGuideInstance && routingGuideCarrierInstance)
	        {
	        	routingGuideInstance.addToRoutingGuideCarrierList(routingGuideCarrierInstance)
	        	        	
		        if (!routingGuideInstance.hasErrors() && routingGuideService.saveRoutingGuide(routingGuideInstance)) 
		        {
		        	println "routingGuide saved with carrier" + routingGuideCarrierInstance?.carrier?.companyName

	    			JsonBuilder json = new JsonBuilder ()
					def routingGuideCarrierMap = json {
						routingGuideCarrierId routingGuideCarrierInstance?.id
						carrier routingGuideCarrierInstance.carrier?.companyName
						carrierPriority routingGuideCarrierInstance.carrierPriority
						mot routingGuideCarrierInstance.mot?.description
						equipment routingGuideCarrierInstance.equipment?.code
						tempCtrl	routingGuideCarrierInstance.tempCtrl?.description
						serviceLevel routingGuideCarrierInstance.serviceLevel?.description
						frequency routingGuideCarrierInstance.frequency?.description
						commitmentValue routingGuideCarrierInstance.commitmentValue
						capacityValue routingGuideCarrierInstance.capacityValue
					}
					println "after jsonbuilder"
					String result = routingGuideCarrierMap.toString()
					print "RESULT OF JSONBUILDER =" + result
					
		           render routingGuideCarrierMap as JSON 
		           //render routingGuideCarrierInstance as JSON
		        }
		        else 
		        {
		        	println "routingGuideInstance=" + routingGuideInstance
		         	println "routingGuideCarrierInstance not saved" + routingGuideCarrierInstance.errors
	            	render(view: "create", model: [routingGuideInstance: routingGuideInstance])
	        	}
	        }
	        else
	        {
	        	println "could not create routingGuideInstance or routingGuideCarrierInstance"
	        }
	      }
	      else
	      {
				println "routingGuideInstance id not found"      	
	      }
  //  [routingGuideCarrier:routingGuideCarrierInstance]
    println "in saveRoutingGuideCarrier"
    }
}
