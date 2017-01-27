/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.booking

import com.cimbidia.wm.core.Constants
import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.rg.*
import com.cimbidia.wm.core.Mot

class BookingForecastController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def bookingService
	def bookingForecastService
	def identifierService
	def routingGuideService
	
	private formatDates(params)
    {
    		if(params.forecastDate)
			params.forecastDate = Date.parse( 'MM/dd/yy', params.forecastDate )   
    }
    
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookingForecastInstanceList: BookingForecast.list(params), bookingForecastInstanceTotal: BookingForecast.count()]
    }

	def summary = {
		println "summary:params:"+params
		Company company 
		Integer companyId = session?.companyId
		if(companyId)
		{
			company = Company.findById(companyId)
        }
        BookingForecast bookingForecastSearchInstance = new BookingForecast(params);
        
	    params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //[bookingForecastInstanceList: BookingForecast.list(params), bookingForecastInstanceTotal: BookingForecast.count()]
    	def bookingForecastSummaryList = bookingForecastService.getBookingForecastList(company, bookingForecastSearchInstance) 
		[bookingForecastSearchInstance: bookingForecastSearchInstance ,bookingForecastSummaryList: bookingForecastSummaryList, bookingForecastSummaryTotal: bookingForecastSummaryList.size()]
	}
    def create = {
        def bookingForecastInstance = new BookingForecast()
        bookingForecastInstance.properties = params
        return [bookingForecastInstance: bookingForecastInstance]
    }

    def save = {
    	formatDates(params)
        def bookingForecastInstance = new BookingForecast(params)
        if (bookingForecastInstance.save(flush: true)) {
            flash.message = "${warehouse.message(code: 'default.created.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), bookingForecastInstance.id])}"
            redirect(action: "list", id: bookingForecastInstance.id)
        }
        else {
            render(view: "create", model: [bookingForecastInstance: bookingForecastInstance])
        }
    }

    def show = {
        def bookingForecastInstance = BookingForecast.get(params.id)
        if (!bookingForecastInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookingForecastInstance: bookingForecastInstance]
        }
    }

    def edit = {
        def bookingForecastInstance = BookingForecast.get(params.id)
        if (!bookingForecastInstance) {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookingForecastInstance: bookingForecastInstance]
        }
    }

    def update = {
        def bookingForecastInstance = BookingForecast.get(params.id)
        if (bookingForecastInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookingForecastInstance.version > version) {
                    
                    bookingForecastInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast')] as Object[], "Another user has updated this BookingForecast while you were editing")
                    render(view: "edit", model: [bookingForecastInstance: bookingForecastInstance])
                    return
                }
            }
            bookingForecastInstance.properties = params
            if (!bookingForecastInstance.hasErrors() && bookingForecastInstance.save(flush: true)) {
                flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), bookingForecastInstance.id])}"
                redirect(action: "list", id: bookingForecastInstance.id)
            }
            else {
                render(view: "edit", model: [bookingForecastInstance: bookingForecastInstance])
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookingForecastInstance = BookingForecast.get(params.id)
        if (bookingForecastInstance) {
            try {
                bookingForecastInstance.delete(flush: true)
                flash.message = "${warehouse.message(code: 'default.deleted.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast'), params.id])}"
            redirect(action: "list")
        }
    }
    
    private RoutingGuideSearchCriteria createRoutingGuideSearchCriteria(BookingForecast bookingForecastInstance){
		def routingGuideSearchInstance =new  RoutingGuideSearchCriteria()
		routingGuideSearchInstance.company=bookingForecastInstance.company
		//routingGuideSearchInstance.businessUnit=bookingForecastInstance.businessUnit
		routingGuideSearchInstance.origin=bookingForecastInstance.originPort
		routingGuideSearchInstance.destination=bookingForecastInstance.destinationPort
		routingGuideSearchInstance.mot=Mot.findById(Mot.OCEAN)
		routingGuideSearchInstance.routingDate=bookingForecastInstance.forecastDate
		routingGuideSearchInstance.orderBy="TC"
		return routingGuideSearchInstance
	}
    
    def createBookingFromForecast = {
    
    	print "BookingForecast:createBookingFromForecast"
    	Integer companyId = session?.companyId
		Company company 
		Company carrier = null
		if(companyId)
		{
			company = Company.findById(companyId)
        }
    	//def bookingForecastInstance = BookingForecast.get("ff8081814648de8601464914cfdd0005")

		List bookingForecastList = bookingForecastService.getUnprocessedBookingForecastList(company)
		println "bookingForecastList size="+ bookingForecastList.size()
		
		List<Booking> bookingInstanceList = new ArrayList<Booking>();
		List<String> bookingForecastIds =  new ArrayList<String>();
		
		if(bookingForecastList)
		{
			for ( bookingForecastInstance in bookingForecastList)
			{
				println "in loop for bookingforecast***********"
		     	Booking bookingInstance = new Booking()
		    	
		        def randomNum = identifierService.generateIdentifier(Constants.DEFAULT_BOOKING_NUMBER_FORMAT)
				bookingInstance.bookingNumber = "BK-" + randomNum
				bookingInstance.bookingStatus = BookingStatus.NEW

				//Get carrier from RoutingGuide				
		        RoutingGuideSearchCriteria routingGuideSearchCriteria = createRoutingGuideSearchCriteria(bookingForecastInstance);
		        def list=routingGuideService.getMatchingRoutesList(routingGuideSearchCriteria,5)
				if(list.size>0){
						def routingRatingLookupResult=(RoutingRatingLookupResult)list[0]
						carrier = routingRatingLookupResult.routingGuideCarrier.carrier
					}
					
				
		        bookingInstance.bookingAgent = company
				bookingInstance.shipFrom = bookingForecastInstance.shipFrom
				bookingInstance.shipTo = bookingForecastInstance.shipTo
				bookingInstance.originPort = bookingForecastInstance.originPort
				bookingInstance.destinationPort = bookingForecastInstance.destinationPort
				bookingInstance.earliestDepartureDate = bookingForecastInstance.forecastDate
				//bookingInstance.hazmat
				bookingInstance.productClass = bookingForecastInstance.productClass
				//bookingInstance.unCode
				//bookingInstance.incoterms
				//bookingInstance.supplier
				bookingInstance.carrier = carrier
				
				bookingInstance.shipper = bookingForecastInstance.company
				//bookingInstance.customer
				//bookingInstance.consignee
				//bookingInstance.bookingAgent
				//specialHandling
				bookingInstance.comments = "Autogenerated from forecast"
		    	bookingInstance.bookingForecastId = bookingForecastInstance.id
		    	
		    	BookingEquipment bookingEquipment = new BookingEquipment()
		    	bookingEquipment.equipmentType = bookingForecastInstance.equipmentType
				bookingEquipment.numOfContainers = bookingForecastInstance.numberOfEquipments
				bookingEquipment.transportationService = com.cimbidia.scm.constants.Constants.findByTypeAndCode("TR","seller")
				bookingEquipment.equipmentProvider = com.cimbidia.scm.constants.Constants.findByTypeAndCode("EQPROV","CARRIER")
				//bookingEquipment.comments
				
				bookingForecastIds.add(bookingForecastInstance.id)
				
				println "beofre addig equip list"
				bookingInstance.addToBookingEquipmentList(bookingEquipment)
				println "beofre addig bookinginst list"
				bookingInstanceList.add(bookingInstance);
			}
			
			"bookinginstance 0****="+ bookingInstanceList[0]
			List errorsOnSave = bookingForecastService.saveBookingsFromForecast(bookingInstanceList, bookingForecastIds);
			if(errorsOnSave && errorsOnSave.size() > 0)
			{
	    	    println("NOT SAVED")
	            println("errorsOnSave" +errorsOnSave )
	            flash.message = "${warehouse.message(code: 'default.not.create.message', args: [warehouse.message(code: 'bookings.label', default: 'Bookings')])}"
                render(view: "list")
	            return
	        }
	        else
	        {
	        	println "booking saved"
	        }
		}    
        redirect(controller: "booking", action: "list" )
        return;
    }
}
