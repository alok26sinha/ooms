package com.cimbidia.wm.booking

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

import org.springframework.dao.DataIntegrityViolationException

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.core.Constants
import com.cimbidia.wm.core.Equipment
import com.cimbidia.wm.core.Location
import com.cimbidia.wm.core.User
import com.cimbidia.wm.shipment.ShipmentStops
import com.cimbidia.wm.shipment.TrackingMessage

import grails.converters.JSON
import groovy.json.JsonBuilder


class BookingController {
    static scaffold = true
    
 	def identifierService
    def bookingService
    def userService
	def shipmentService
    
    private formatDates(params)
	{
		if(params.earliestDepartureDate)
			params.earliestDepartureDate = Date.parse( 'MM/dd/yy', params.earliestDepartureDate )
		if(params.mustArriveByDate)
			params.mustArriveByDate = Date.parse( 'MM/dd/yy', params.mustArriveByDate )
		if(params.plannedDepartureDate)
			params.plannedDepartureDate = Date.parse( 'yyyy/MM/dd HH:mm', params.plannedDepartureDate )
		if(params.plannedArrivalDate)
			params.plannedArrivalDate = Date.parse( 'yyyy/MM/dd HH:mm', params.plannedArrivalDate )
		if(params.closingDate)
			params.closingDate = Date.parse( 'yyyy/MM/dd HH:mm', params.closingDate )
	}
    
    
    def list(Integer max) { 
    	println('BookingController:list:params=' + params)
    	
    	Booking[] bookingInstanceList
    	
        params.max = Math.min(max ?: 10, 100)
        
        //add criteria based on filter
        def bookingNum = params.bookingNumberFilter? params.bookingNumberFilter : null
        def status = params.statusFilter? Enum.valueOf(BookingStatus.class, params.statusFilter) : null
        def originPort = params.originPortFilter? Location.get(params.originPortFilter) : null
        def destinationPort = params.destinationPortFilter? Location.get(params.destinationPortFilter) : null
        def plannedArrivalDate = params.plannedArrivalDateFilter? Date.parse("MM/dd/yyyy", params.plannedArrivalDateFilter) : null
        def plannedDepartureDate = params.plannedDepartureDateFilter? Date.parse("MM/dd/yyyy", params.plannedDepartureDateFilter) : null
        def vessel = params.vesselFilter ? params.vesselFilter : null
        	
      	def shipFromStr = request.getParameterValues("shipFromFilter.id")
        def shipFrom = shipFromStr? Location.get(shipFromStr) : null
        
        def shipToStr = request.getParameterValues("shipToFilter.id")
        def shipTo = params.shipToStr? Location.get(shipToStr) : null
        def carrier = params.carrierFilter? Company.findById(Integer.valueOf(params.carrierFilter)) : null
        def shipperCompany
        
        //check if user is carrier 
        def userId = session?.user?.id
        def user = User.findById(userId)
        def companyId = user?.companyId
        def company = Company.findById(companyId)
        
        
        if(userService.isUserCarrier(user))
        {
        	carrier = company
		}
		else
		{
			shipperCompany = companyId
		}
        
               
		 bookingInstanceList = bookingService.getBookingList(bookingNum, status, originPort, destinationPort, plannedArrivalDate, plannedDepartureDate, 
		 								vessel, shipFrom, shipTo, carrier, shipperCompany)

        [bookingInstanceList: bookingInstanceList, bookingInstanceTotal: Booking.count(), bookingNumberFilter:bookingNum, statusFilter:status, 
        	originPortFilter : params.originPortFilter, destinationPortFilter : params.destinationPortFilter, plannedDepartureDateFilter : params.plannedDepartureDateFilter,
        	plannedArrivalDateFilter : params.plannedArrivalDateFilter, carrierFilter : params.carrierFilter, vesselFilter : params.vesselFilter,
        	shipFromFilterId: shipFromStr, shipFromFilterName: shipFrom?.name, shipToFilterId: shipToStr, shipToFilterName:shipTo?.name]
    }
    
    def create() 
    {
        println('BookingController:create:params=' + params)

        def bookingInstance = new Booking(params)
        def randomNum = identifierService.generateIdentifier(Constants.DEFAULT_BOOKING_NUMBER_FORMAT)
		bookingInstance.bookingNumber = "BK-" + randomNum
		bookingInstance.bookingStatus = BookingStatus.NEW
		Integer companyId = session?.companyId
		if(companyId)
		{
			bookingInstance.bookingAgent = Company.findById(companyId)
        }
        [bookingInstance: bookingInstance]
    }
    
	def findBooking(id)
	{
		def bookingInstance = Booking.get(id)
		if (!bookingInstance) {
	        flash.message = message(code: 'default.not.found.message', args: [message(code: 'booking.label', default: 'Booking'), id])
	        redirect(action: "list")
	        return
	    }
	    return bookingInstance
	}
	
	def edit(String id) 
	{
	    println('BookingController:edit:params=' + params)
	      
	    def bookingInstance = findBooking(id)
	    formatDates(params)
//	    println "bookingInstance.status=" + bookingInstance.bookingStatus
	    [bookingInstance: bookingInstance]
	}

	def save =
	{ //BookingCommand cmd ->
		formatDates(params)
        def bookingInstance = new Booking(params)

		println "bookingInstance num="+bookingInstance.bookingNumber + "bookingInstance.bookingStatus="+ bookingInstance.bookingStatus
        println "bookingInstance.hasErrors()=" + bookingInstance.hasErrors() + bookingInstance.errors
        /*if(cmd.hasErrors() ) 
        {
            println("NOT SAVED :ERRORS FROM COMMAND" + cmd.errors)

            bookingInstance.errors = cmd.errors
            render(view: "edit",model: [bookingInstance: bookingInstance])
            return
        }
        else
        {*/
        if (!bookingService.saveBooking(bookingInstance, bookingInstance.bookingStatus) || bookingInstance.hasErrors()) {
            println("NOT SAVED")
            println("bookingInstance.errors" +bookingInstance.errors )
            render(view: "create", model: [bookingInstance: bookingInstance])
            return
        }
        else{println("SAVED IN CONTROLLER")}
        flash.message = message(code: 'default.created.message', args: [message(code: 'booking.label', default: 'Booking'), bookingInstance.bookingNumber])
        render(view: "edit",model: [bookingInstance: bookingInstance])
      //  }
    }
    
     def submitToCarrier(String id) 
     {
     	println('BookingController:submitToCarrier:params=' + params)
     	formatDates(params)
		def bookingInstance = findBooking(params.id)
		
		bookingInstance.properties = params
		def newStatus = BookingStatus.REQUESTED
		def oldStatus = bookingInstance.bookingStatus
	   // bookingInstance.validate()
	    println "version in controller before save="+ bookingInstance.version
	   	if ( !bookingService.saveBooking(bookingInstance, newStatus) || bookingInstance.hasErrors()) 
	    {
	        println("NOT SAVED")
	         println "version in controller in not saved="+ bookingInstance.version
	        println("bookingInstance.errors" +bookingInstance.errors || bookingInstance.hasErrors())
	        bookingInstance.bookingStatus = oldStatus
	        render(view: "edit", model: [bookingInstance: bookingInstance])
	    }
	    else
		{
	    	println("SAVED")
	     println "version in controller after saved="+ bookingInstance.version
	    	flash.message = message(code: 'booking.submitted.message', args: [message(code: 'booking.label', default: 'Booking '), bookingInstance.bookingNumber])
	    	redirect(action: "list")
	    }
     }
    
  /*  def confirm(String id) {
        println('BookingController:confirm:params=' + params)
        
        def bookingInstance = findBooking(params.id)
        [bookingInstance: bookingInstance]
    } */

    def accept = 
    {   BookingCommand cmd ->
    	formatDates(params)
    	println('BookingController:accept:params=' + params)

        def bookingInstance = findBooking(params.id)
        println "bookingInstance before params="+bookingInstance.earliestDepartureDate + bookingInstance.mustArriveByDate
        println "PARAMS.FROMPAGE="+ params.fromPage
        if(!params.fromPage.equals("list"))
        {
        	"println BINDING PARAMS";
       		bookingInstance.properties = params
		}
		println "bookingInstance after params="+cmd.bookingStatus + bookingInstance.mustArriveByDate
        
		println "bookingInstance after params="+bookingInstance
       if(cmd.hasErrors() ) 
        {
            println("NOT SAVED :ERRORS FROM COMMAND" + cmd.errors)
            println("NOT SAVED :ERRORS FROM bookingInstance" + bookingInstance.errors)
            render(view: "edit",model: [bookingInstance: bookingInstance,cmd:cmd])
            return
        }
        else
        {
            println "no cmd BOOKING"
	        /*def version = params.version.toLong()
	        if (version != null) {
	            if (bookingInstance.version > version) {
	                bookingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
	                          [message(code: 'booking.label', default: 'Booking')] as Object[],
	                          "Another user has updated this Booking while you were editing")
	                render(view: "edit", model: [bookingInstance: bookingInstance])
	                return
            }
        	} */

	        def oldStatus = bookingInstance.bookingStatus
	        def newStatus  = BookingStatus.CONFIRMED
	
	        if(!bookingService.saveBooking(bookingInstance, newStatus) || bookingInstance.hasErrors()) 
	        {
	            println("NOT SAVED : ERROS ON SAVE" + bookingInstance.errors)
	            bookingInstance.bookingStatus = oldStatus
	            render(view: "edit",model: [bookingInstance: bookingInstance])
	            return
	        }
	        println "bookingInstance.bookingStatus=?????" + bookingInstance.bookingStatus
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'booking.label', default: 'Booking'), bookingInstance.bookingNumber])
	        redirect(action: "list", id: bookingInstance.id)
		}
    }


     def reject(String id, BookingCommand command)
     {
        println('BookingController:decline:params=' + params)
        formatDates(params)
        def bookingInstance = findBooking(params.id)
        /*def version = params.version.toLong()
        if (version != null) {
            if (bookingInstance.version > version) {
                bookingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'booking.label', default: 'Booking')] as Object[],
                          "Another user has updated this Booking while you were editing")
                render(view: "edit", model: [bookingInstance: bookingInstance])
                return
            }
        }*/

		def oldStatus = bookingInstance.bookingStatus
        bookingInstance.properties = params
        bookingInstance.bookingStatus = BookingStatus.REJECTED

        println "bookingInstance.bookingStatus=" + bookingInstance.bookingStatus
        if (!bookingService.saveBooking(bookingInstance, bookingInstance.bookingStatus) || bookingInstance.hasErrors())  {
        	bookingInstance.bookingStatus = oldStatus
            render(view: "edit", model: [bookingInstance: bookingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'booking.label', default: 'Booking'), bookingInstance.bookingNumber])
        redirect(action: "list", id: bookingInstance.id)

     }
     
     def update = {
     	BookingCommand cmd ->
        println('BookingController:update:params=' + params)
        formatDates(params)
        def bookingInstance = findBooking(params.id)
        
      	/*def version = params.version
        println "bookingInstance.version="+ bookingInstance.version
        println "version="+ version
        if (version != null) {
            if (bookingInstance.version > version) {
                bookingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'booking.label', default: 'Booking')] as Object[],
                          "Another user has updated this Booking while you were editing")
                render(view: "edit", model: [bookingInstance: bookingInstance])
                return
            }
        }*/
		
        bookingInstance.properties = params
		println "bookingInstance.STATUS before save="+ bookingInstance.bookingStatus
		println "cmd.STATUS before save="+ cmd.bookingStatus
		if(cmd.hasErrors() ) 
        {
            println("NOT SAVED :ERRORS FROM COMMAND" + cmd.errors)

            bookingInstance.errors = cmd.errors
            println("NOT SAVED :ERRORS FROM bookingInstance" + bookingInstance.errors)
            render(view: "edit",model: [bookingInstance: bookingInstance])
            return
        }
        else
        {
        	
        	def oldStatus = bookingInstance.bookingStatus
        	def newStatus = oldStatus
        	if(oldStatus == BookingStatus.CONFIRMED)
        	{
        		println "oldstatus is confirmed so settin it to ammended" 
        		newStatus = BookingStatus.AMMENDED
			}
			if (!bookingService.saveBooking(bookingInstance, newStatus) || bookingInstance.hasErrors()) {
	            println("NOT SAVED")
	            println("bookingInstance.errors" +bookingInstance.errors )
	            render(view: "edit", model: [bookingInstance: bookingInstance])
	            return
	        }
	        else{
	        	println("UPDATED SAVED IN CONTROLLER")
	        }
	
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'booking.label', default: 'Booking'), bookingInstance.bookingNumber])
	        redirect(action: "list", id: bookingInstance.id)
        }
    }

    def delete(String id) {
      	println('BookingController:delete:params=' + params)
        def bookingInstance = findBooking(params.id)

        try {
            bookingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'booking.label', default: 'Booking'), bookingInstance.bookingNumber])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'booking.label', default: 'Booking'), id])
            redirect(action: "show", id: id)
        }
    }
	
 	def saveBookingReference = {
	 
   		println('BookingController:saveBookingReference:params=' + params)
    	if(params.booking.id)
    	{
	    	def bookingInstance = findBooking(params.booking.id)
        	//formatDates(params)
	        def bookingReferenceInstance = new BookingReference(params)
	        if( bookingInstance && bookingReferenceInstance)
	        {
	        	bookingInstance.addToReferenceList(bookingReferenceInstance)

		        if (bookingService.saveBooking(bookingInstance, bookingInstance.bookingStatus)) 
		        {
		        	println "bookingReferenceInstance saved with booking REFERENCE"
		            //flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingReferenceInstance.label', default: 'bookingReference'), bookingReferenceInstance.id])}"
		            //redirect(action: "edit", id: bookingInstance.id)
		            JsonBuilder json = new JsonBuilder ()
		            def referenceMap = json {
						bookingId bookingReferenceInstance.booking.id
						id bookingReferenceInstance.id
						referenceType bookingReferenceInstance.referenceType
						referenceNumber bookingReferenceInstance.referenceNumber
						
					}
					String result = referenceMap.toString()
					print "RESULT OF JSONBUILDER =" + result
			       	render referenceMap as JSON
		        }
		        else 
		        {
		         	println "bookingReferenceInstance not saved" + bookingReferenceInstance.errors
	            	render(view: "create", model: [bookingInstance: bookingInstance])
	        	}
	        }
	        else
	        {
	        	println "could not create bookingInstance or bookingReferenceInstance"
	        }
	      }
	      else
	      {
				println "booking id not found"      	
	      }
	       
    }
    
    def updateBookingReference = {
	 
   		println('BookingController:updateBookingReference:params=' + params)
    	if(params.id)
    	{
	    	
	        def bookingReferenceInstance = BookingReference.get(params.id)
	        
	        def bookingInstance = findBooking(bookingReferenceInstance.booking.id)
	        if( bookingInstance && bookingReferenceInstance)
	        {
        		bookingReferenceInstance.properties = params

		        if (bookingService.saveBooking(bookingInstance, bookingInstance.bookingStatus)) 
		        {
		        	println "bookingReferenceInstance saved with booking REFERENCE"
		            //flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingReferenceInstance.label', default: 'bookingReference'), bookingReferenceInstance.id])}"
		            //redirect(action: "edit", id: bookingInstance.id)
		            JsonBuilder json = new JsonBuilder ()
		            def referenceMap = json {
						bookingId bookingReferenceInstance.booking.id
						id bookingReferenceInstance.id
						referenceType bookingReferenceInstance.referenceType
						referenceNumber bookingReferenceInstance.referenceNumber
						
					}
					String result = referenceMap.toString()
					print "RESULT OF JSONBUILDER =" + result
			       	render referenceMap as JSON
		        }
		        else 
		        {
		         	println "bookingReferenceInstance not saved" + bookingReferenceInstance.errors
	            	render(view: "create", model: [bookingInstance: bookingInstance])
	        	}
	        }
	        else
	        {
	        	println "could not create bookingInstance or bookingReferenceInstance"
	        }
	      }
	      else
	      {
				println "booking id not found"      	
	      }
	       
    }
    
    def deleteBookingReference = {
    	println('BookingController:deleteBookingReference:params=' + params)
    	if(params.id)
    	{
    		println "params.id="+params.id
	    	def bookingReferenceInstance = BookingReference.get(params.id)
	    	
	    	if ( bookingReferenceInstance )
	    		println " I am there 1 " + params.id
	    	
	    	def bookingInstance = findBooking(params.bookingInstance.id)
	    	formatDates(params)
	        if( bookingInstance && bookingReferenceInstance)
	        {
	        	//println " disco 1 " + bookingInstance.referenceList*.id
	        	bookingInstance.removeFromReferenceList(bookingReferenceInstance)
	        	//println  " disco 2 " +  bookingInstance.referenceList*.id
	        	
		        if (!bookingInstance.hasErrors() && bookingService.saveBooking(bookingInstance,bookingInstance.bookingStatus)) 
		        {
		        	
		        	println "booking saved removing bookingReferenceInstance"
		        	println "bookingReferenceInstance  removed errors " + bookingInstance.errors
		            //flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingReferenceInstance.label', default: 'bookingReferenceInstance'), bookingReferenceInstance.id])}"
			    	bookingInstance = Booking.get(bookingInstance.id)
	        	//	println  " disco 3 " +  bookingInstance.referenceList*.id
		            redirect(action: "edit", id: bookingInstance.id)
		        }
		        else 
		        {
		         	println "bookingReferenceInstance not removed" + bookingReferenceInstance.errors
	            	render(action: "edit", id: bookingInstance.id)
	        	}
	        }
	        else
	        {
	        	println "could not remove bookingReferenceInstance from bokinginstance"
	        }
	      }
	      else
	      {
				println "bookingReferenceInstance id not found"      	
	      }
    
    }
    
     def getBookingReference = {
   		println('BookingController:getBookingReference:params=' + params)
   		def bookingReferenceInstance
    	if(params.id)
    	{
    		println "id is + " + params.id
    		bookingReferenceInstance = BookingReference.get(params.id)
    		
    	}
    	JsonBuilder json = new JsonBuilder ()
		def referenceMap = json {
			bookingId bookingReferenceInstance.booking.id
			id bookingReferenceInstance.id
			referenceType bookingReferenceInstance.referenceType
			referenceNumber bookingReferenceInstance.referenceNumber

				}
			println "after jsonbuilder"
			String result = referenceMap.toString()
			print "RESULT OF JSONBUILDER =" + result
	       	render referenceMap as JSON
    }
    
    def getBookingEquipment = {
   		println('BookingController:getBookingEquipment:params=' + params)
   		def bookingEquipmentInstance
    	if(params.id)
    	{
    		println "id is + " + params.id
    		bookingEquipmentInstance = BookingEquipment.get(params.id)
    		
    	}
    	JsonBuilder json = new JsonBuilder ()
		def equipMap = json {
			bookingId bookingEquipmentInstance.booking.id
			id bookingEquipmentInstance.id
			numOfContainers bookingEquipmentInstance.numOfContainers
			numOfConfirmedContainers bookingEquipmentInstance.numOfConfirmedContainers
			comments bookingEquipmentInstance.comments
			equipmentTypeCode bookingEquipmentInstance.equipmentType.code
			equipmentTypeId bookingEquipmentInstance.equipmentType.id
			equipmentTypeDesc bookingEquipmentInstance.equipmentType.description
			transportationServiceName bookingEquipmentInstance.transportationService.name
			transportationServiceId bookingEquipmentInstance.transportationService.id
			equipmentProviderId bookingEquipmentInstance.equipmentProvider.id
			equipmentProviderName bookingEquipmentInstance.equipmentProvider.name

				}
			println "after jsonbuilder"
			String result = equipMap.toString()
			print "RESULT OF JSONBUILDER =" + result
	       	render equipMap as JSON
    }
     def saveBookingEquipment = {
	 
   		println('BookingController:saveBookingEquipment:params=' + params)
    	if(params.booking.id)
    	{

    		def bookingInstance = findBooking(params.booking.id)
        	//formatDates(params)
        	bookingInstance.properties = params
	        def bookingEquipmentInstance = new BookingEquipment(params)
	        println "bookingEquipmentInstanc.id = " + bookingEquipmentInstance.id
	       // bookingEquipmentInstance.equipmentType = equipmentInstance
	        
	        if( bookingInstance && bookingEquipmentInstance)
	        {
	        	bookingInstance.addToBookingEquipmentList(bookingEquipmentInstance)
	        	//bookingInstance.validate()
	        	
        		if (bookingInstance.bookingStatus ==BookingStatus.CONFIRMED)
        			bookingInstance.bookingStatus = BookingStatus.AMMENDED
		        if (!bookingInstance.hasErrors() ) 
		        {
		        	bookingService.saveBooking(bookingInstance)
		        	println "booking saved with booking EQUIPMENT" + bookingEquipmentInstance.equipmentType.code

	    			 println "BEFORE RETURNING EQUIPINST "
		          
	    			JsonBuilder json = new JsonBuilder ()
					def equipMap = json {
						bookingId bookingInstance.id
						id bookingEquipmentInstance.id
						numOfContainers bookingEquipmentInstance.numOfContainers
						numOfConfirmedContainers bookingEquipmentInstance.numOfConfirmedContainers
						comments bookingEquipmentInstance.comments
						equipmentTypeCode bookingEquipmentInstance.equipmentType.code
						equipmentTypeId bookingEquipmentInstance.equipmentType.id
						equipmentTypeDesc bookingEquipmentInstance.equipmentType.description
						transportationServiceName bookingEquipmentInstance.transportationService.name
						equipmentProviderName bookingEquipmentInstance.equipmentProvider.name

							}
					println "after jsonbuilder"
					String result = equipMap.toString()
					print "RESULT OF JSONBUILDER =" + result
		           render equipMap as JSON
		          // redirect(action: "edit", id: bookingInstance.id)
		        }
		        else 
		        {
		         	println "bookingEquipmentInstance not saved" + bookingEquipmentInstance.errors
	            	render(view: "create", model: [bookingInstance: bookingInstance])
	        	}
	        }
	        else
	        {
	        	println "could not create bookingInstance or bookingEquipmentInstance"
	        }
	      }
	      else
	      {
				println "booking id not found"      	
	      }
	       
    }
    
    def deleteBookingEquipment = {
    	println('BookingController:deleteBookingEquipment:params=' + params)
    	if(params.bookingEquipment.id)
    	{
    		println "params.bookingEquipment.id="+params.bookingEquipment.id
	    	def bookingEquipmentInstance = BookingEquipment.get(params.bookingEquipment.id)
	    	
	    	if ( bookingEquipmentInstance )
	    		println " I am there 1 " + params.bookingEquipment.bookingEquipmentbookingEquipmentid
	    	
	    	def bookingInstance = findBooking(params.bookingInstance.id)
	    	formatDates(params)
	        if( bookingInstance && bookingEquipmentInstance)
	        {
	        	//println " disco 1 " + bookingInstance.bookingEquipmentList*.id
	        	bookingInstance.removeFromBookingEquipmentList(bookingEquipmentInstance)
	        	//println  " disco 2 " +  bookingInstance.bookingEquipmentList*.id
	        	
        		if (bookingInstance.bookingStatus ==BookingStatus.CONFIRMED)
        			bookingInstance.bookingStatus = BookingStatus.AMMENDED
		        if (!bookingInstance.hasErrors() && bookingService.saveBooking(bookingInstance,bookingInstance.bookingStatus)) 
		        {
		        	
		        	println "booking saved removing bookingEquipmentInstance"
		        	println "bookingEquipmentInstance  removed errors " + bookingInstance.errors
		            //flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingEquipmentInstance.label', default: 'bookingEquipmentInstance'), bookingEquipmentInstance.id])}"
			    	bookingInstance = Booking.get(bookingInstance.id)
	        	//	println  " disco 3 " +  bookingInstance.bookingEquipmentInstance*.id
		            render(view: "edit", model: [bookingInstance: bookingInstance])
		        }
		        else 
		        {
		         	println "bookingEquipmentInstance not removed" + bookingEquipmentInstance.errors
	            	render(action: "edit", id: bookingInstance.id)
	        	}
	        }
	        else
	        {
	        	println "could not remove bookingEquipmentInstance from bokinginstance"
	        }
	      }
	      else
	      {
				println "bookingEquipmentInstance id not found"      	
	      }
    
    }
    def saveBookingShipment =	{
	//	println " my params save "+ params;
		
		def bookingInstance = findBooking(params.booking.id)
		if(bookingInstance){
			List<BookingShipment> shipIds = bookingInstance?.bookingShipmentList;
			//println("Ship Id "+ shipIds.size())
			def flag = true;
			for(int i=0; i<shipIds.size();i++)
			{				
				def shipment = shipIds.get(i).shipment
				//println shipment.id +" " + params.shipment.id;
				if( shipment.id.equals(params.shipment.id))
				{
					//println " bkShipment?.id "+ shipment?.id
					flag = false;
					break;
				}				
			}
			if(flag){
				def bookingShipmentInstance = new BookingShipment(params)
		
				bookingInstance.addToBookingShipmentList(bookingShipmentInstance)
				bookingService.saveBooking(bookingInstance)
				bookingShipmentInstance.shipment.booking = bookingInstance
				bookingShipmentInstance.shipment.save()
				def bkInstance = findBooking(String.valueOf(params.booking.id))
				//println "is the booking instance loaded???" + bkInstance?.bookingShipmentList + " booking id "+params.booking.id
				redirect(action: "edit");
			}
			else{
				flash.message = "${warehouse.message(code: 'default.duplicate.notadded.message', args: [warehouse.message(code: 'rsDetail.label', default: 'Detail'), params.id])}"
			}
		}
	}
	
	def deleteBookingShipment = {
			println "Delete Called"+params
			def  ids = params.selectedCheck;
			
			def  idArray  = ids.substring(1, ids.size());
			def str = idArray.split(",")
			def bookingInstance = findBooking(params.booking.id)
			try {
				for(int i=0; i< str.size();i++)
				{			
					def bookingShipmentInstance = BookingShipment.get(str[i])
					bookingInstance.removeFromBookingShipmentList(bookingShipmentInstance)					
					
				}
				bookingService.saveBooking(bookingInstance);
				render(view: "edit", model: [bookingInstance: bookingInstance])
				}
				catch (org.springframework.dao.DataIntegrityViolationException e) {
					flash.message = "${warehouse.message(code: 'default.not.deleted.message', args: [warehouse.message(code: 'rsDetail.label', default: 'RsDetail'), params.id])}"
					
					render(view: "edit", model: [bookingInstance: bookingInstance])
				}
	}
    
    def updateBookingEquipment = {
    	println('updateBookingEquipment:params=' + params)
    	if(params.id)
    	{
    		println "params.id="+params.id
	    	def bookingEquipmentInstance = BookingEquipment.get(params.id)
	    	
	    	if ( bookingEquipmentInstance )
	    		println " I am there 1 " + params.id

	    	def bookingInstance = findBooking(params.booking.id)
    	
	        if( bookingInstance && bookingEquipmentInstance)
	        {
	        	bookingEquipmentInstance.properties = params
        		if (bookingInstance.bookingStatus ==BookingStatus.CONFIRMED)
        			bookingInstance.bookingStatus = BookingStatus.AMMENDED
		        if (!bookingInstance.hasErrors() && bookingService.saveBooking(bookingInstance,bookingInstance.bookingStatus)) 
		        {
		        	
		        	println "booking saved updated bookingEquipmentInstance" + bookingInstance.errors
		        	println "bookingEquipmentInstance  updated errors " + bookingInstance.errors
		            //flash.message = "${warehouse.message(code: 'default.updated.message', args: [warehouse.message(code: 'bookingEquipmentInstance.label', default: 'bookingEquipmentInstance'), bookingEquipmentInstance.id])}"
			    	bookingInstance = Booking.get(bookingInstance.id)
					
					
		           // redirect(action: "edit", model: [bookingEquipmentInstance:bookingEquipmentInstance])
		           
		           JsonBuilder json = new JsonBuilder ()
					def equipMap = json {
						bookingId bookingEquipmentInstance.booking.id
						id bookingEquipmentInstance.id
						numOfContainers bookingEquipmentInstance.numOfContainers
						numOfConfirmedContainers bookingEquipmentInstance.numOfConfirmedContainers
						comments bookingEquipmentInstance.comments
						equipmentTypeCode bookingEquipmentInstance.equipmentType.code
						equipmentTypeId bookingEquipmentInstance.equipmentType.id
						equipmentTypeDesc bookingEquipmentInstance.equipmentType.description
						transportationServiceName bookingEquipmentInstance.transportationService.name
						equipmentProviderName bookingEquipmentInstance.equipmentProvider.name
		
					}
					println "after jsonbuilder"
					String result = equipMap.toString()
					print "RESULT OF JSONBUILDER =" + result
			       	render equipMap as JSON
		        }
		        else 
		        {
		         	println "bookingEquipmentInstance not updated" + bookingEquipmentInstance.errors
	            	render(action: "edit", model: [bookingEquipmentInstance:bookingEquipmentInstance])
	        	}
	        }
	        else
	        {
	        	println "could not remove bookingEquipmentInstance from bookinginstance"
	        }
	      }
	      else
	      {
				println "bookingEquipmentInstance id not found"      	
	      }
    
    }
	def showDetails = {
		println "Tender Shipment"
		println "params : "+params
		println "shipment id : "+params.id
		def shipmentInstance = Shipment.get(params.id)
		if (!shipmentInstance) {
			flash.message = "${warehouse.message(code: 'default.not.found.message', args: [warehouse.message(code: 'shipment.label', default: 'Shipment'), params.id])}"
			redirect(action: "list", params:[type: params.type])
		}
		else {
			/*def eventTypes =  com.cimbidia.wm.core.EventType.list();
			 def shipmentWorkflow = shipmentService.getShipmentWorkflow(shipmentInstance)
			 [shipmentInstance: shipmentInstance, shipmentWorkflow: shipmentWorkflow, shippingEventTypes : eventTypes]
			 */
			render(view: "edit", model: [shipmentInstance: shipmentInstance])
		}
	}
	
	def createTrackingMsg = {
		println "create tracking msg "+params
		println "bookingId : "+ (params.bookingId).length()
		def bookingInstance = Booking.findById(String.valueOf(params.bookingId));//findBooking(params.booking.id)
		println "Null?" + bookingInstance 
		//bookingInstance.id=params.bookingId
		// "booking55=" + bookingInstance
		def trackingMsg = getNewTrackingMessage(params, bookingInstance)
		//ShipmentStops stop = ShipmentStops.findByBookingAndStopNumber(bookingInstance,trackingMsg.getStopNumber())
		//stop.shipment = bookingInstance
		//println " track "+trackingMsg.toString()
		bookingInstance.addToTrackingMsgs(trackingMsg)
		for(int i =0 ; i< bookingInstance.bookingShipmentList.size(); i++)
		{
			def shipment = ((BookingShipment)bookingInstance.bookingShipmentList.get(i)).shipment;
			
			def trackingMsg1 = getNewTrackingMessage(params, bookingInstance)
			if (bookingInstance.shipFrom.id == shipment.origin.id && trackingMsg.stopType.equals( 'Origin')){
				trackingMsg1.stopNumber = 1;
			}else if (bookingInstance.originPort.id == shipment.origin.id && trackingMsg.stopType.equals( 'Origin Port')){
				trackingMsg1.stopNumber = 1;
			}else if (bookingInstance.originPort.id == shipment.shipDestination.id && trackingMsg.stopType.equals( 'Origin Port')){
				trackingMsg1.stopNumber = 2;
			}else if (bookingInstance.destinationPort.id == shipment.origin.id && trackingMsg.stopType.equals( 'Destination Port')){
				trackingMsg1.stopNumber = 1;
			}else if (bookingInstance.destinationPort.id == shipment.shipDestination.id && trackingMsg.stopType.equals( 'Destination Port')){
				trackingMsg1.stopNumber = 2;
			}else if (bookingInstance.shipTo.id == shipment.shipDestination.id && trackingMsg.stopType.equals( 'Destination')){
				trackingMsg1.stopNumber = 2;
			}else{
				//catch all condition, can be removed later
				trackingMsg1.stopNumber = 0;
			}
			trackingMsg1.shipment = shipment
			//trackingMsg1.save();
			println "Saving tracking message for shipment::" + shipment.id
			shipmentService.createTrackingMsg( trackingMsg1,  shipment)
		}
		println "Book Ins "+ (bookingInstance.bookingStatus == BookingStatus.CONFIRMED) + "::" + trackingMsg.stopType.equals( 'Destination')
		
		if((bookingInstance.bookingStatus == BookingStatus.CONFIRMED)||(bookingInstance.bookingStatus == BookingStatus.INTRANSIT)){
			if(trackingMsg.stopType.equals( 'Destination')){
				
				bookingInstance.bookingStatus =BookingStatus.DELIVERED
				
				for(int i =0 ; i< bookingInstance.bookingShipmentList.size(); i++)
				{
					def shipment = ((BookingShipment)bookingInstance.bookingShipmentList.get(i)).shipment;
					shipment.shipStatus = 'Delivered'
					
					shipment.save(failOnError:true);
				}
			
			//	carrierShipmentInstance.shipStatus ="Transit"
			}
			else{
//				
				bookingInstance.bookingStatus =BookingStatus.INTRANSIT
//				
//				for(int i =0 ; i< bookingInstance.bookingShipmentList.size(); i++)
//				{
//					def shipment = ((BookingShipment)bookingInstance.bookingShipmentList.get(i)).shipment;
//					shipment.shipStatus ="InTransit"
//					
//					shipment.save(failOnError:true);
//				}
//				
//				
			}
		}
		println "Is my status changed?" + bookingInstance
		bookingInstance.save(failOnError: true)
			/*if(trackingMsg.stopType == 2){
				
				bookingInstance.shipStatus ="Delivered"
				carrierShipmentInstance.shipStatus ="Delivered"
			}*/
		
		render(view: "edit", model: [bookingInstance: bookingInstance])
	}

	private TrackingMessage getNewTrackingMessage(Map params, Booking bookingInstance) {
		def trackingMsg=new TrackingMessage()

		trackingMsg.properties = params
		trackingMsg.booking = bookingInstance
		trackingMsg.msgDate	 = getDateTimeFormat(params.msgDate)
		trackingMsg.carrier = bookingInstance.carrier
		trackingMsg.createdDate = new Date()
		return trackingMsg
	}
	
	public Date getDateTimeFormat(String strDate){
		DateFormat readFormat = new SimpleDateFormat( "MM/dd/yyyy HH:mm");
		Date date = null;
		try {

			date = readFormat.parse( strDate )
		}catch(Exception e ){
			e.printStackTrace();
		}
		return date
	}
	
	
	def jq_rgCarriers = {
		def rgCarrierList ;
		
		println "params.origin="+ params.origin;
	    println "params.destination="+ params.destination;
    	Map carrierMap = new HashMap();
    	carrierMap.put("11","123");
    	/* relatedLocationInstanceList.each() {
    	
    	    	String key = it.relatedLocation.id
	    		String value = it.relatedLocation.name
	    		println "key="+key+ " value="+value
	    		relLocMap.put(key,value)
    	}
*/
		def carrierJSON = { carrierMap : carrierMap } 
    	render carrierJSON as JSON
	}
	
	
    
}
