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

import com.cimbidia.scm.admin.Company
import com.cimbidia.wm.booking.BookingException
import com.cimbidia.wm.core.Location


class BookingService {

	boolean transactional = true

	List<Booking> getBookingList(String bookingNum, BookingStatus status, Location originPort, Location destinationPort, Date plannedArrivalDate, Date plannedDepartureDate, 
		 								String vessel, Location shipFrom, Location shipTo, Company carrier, Integer shipperCompany) {
	
	def bookings = Booking.withCriteria {
			and {
					if(bookingNum)
					{
						ilike("bookingNumber", "%" + bookingNum + "%") 
					}
					if(status)
					{
						eq("bookingStatus",status)
					}
					if(originPort)
					{
						eq("originPort",originPort)
					}
					if(destinationPort)
					{
						eq("destinationPort",destinationPort)
					}
					if(destinationPort)
					{
						eq("destinationPort",destinationPort)
					}
					if(plannedArrivalDate)
					{
						def plannedArrivalEndTime = setEndTime(plannedArrivalDate)
						println "plannedArrivalDate=" + plannedArrivalDate + "plannedArrivalEndTime=" + plannedArrivalEndTime
						ge("plannedArrivalDate",plannedArrivalDate) && le("plannedArrivalDate", plannedArrivalEndTime)
					}
					if(plannedDepartureDate)
					{
						def plannedDepartureEndTime = setEndTime(plannedDepartureDate)
						println "plannedDepartureDate=" + plannedDepartureDate + "plannedDepartureEndTime=" + plannedDepartureEndTime
						ge("plannedDepartureDate",plannedDepartureDate) && le("plannedDepartureDate", plannedDepartureEndTime)
					}
					if(vessel)
					{
						ilike("vessel", "%" + vessel + "%") 
					}
					if(shipFrom)
					{
						eq("shipFrom",shipFrom)
					}
					if(shipTo)
					{
						eq("shipTo",shipTo)
					}
					if(carrier)
					{
						eq("carrier",carrier)
					}
					if(shipperCompany)
					{
						eq("companyId",shipperCompany)
					}
				}
			}
		return bookings
	}

	Date setEndTime(Date date)
	{
		Calendar cal = Calendar.getInstance()
		cal.setTime(date)
		cal.set(Calendar.HOUR_OF_DAY,23)
		cal.set(Calendar.MINUTE,59)
		cal.set(Calendar.SECOND,59)
		cal.set(Calendar.MILLISECOND,59)
		date = cal.getTime()
		return date
	}
	
	List<Booking> getBookingsForCarrier(Integer carrierCompanyId) {
	//	println "carrierCompanyId in service class=" + carrierCompanyId
		def carrierCompany = Company.findById(carrierCompanyId)
		
		def bookings = Booking.withCriteria {
			and {
					if(carrierCompany)
					{
						eq("carrier", carrierCompany)
					}
					if(true)
					{
						ne("bookingStatus",BookingStatus.NEW)
					}
				}
			}
			//println "bookingsise"+ bookings.size()
		return bookings
	}

	Booking saveBooking(Booking bookingInstance)
	{
		return saveBooking( bookingInstance, bookingInstance.bookingStatus )
	}

	
	Booking saveBooking(Booking bookingInstance, BookingStatus newStatus)
	{
		BookingStatus oldStatus = bookingInstance.bookingStatus
 		bookingInstance.bookingStatus = newStatus
 		println "version in service in BEFORE saved="+ bookingInstance.version
		if (!bookingInstance.hasErrors() && bookingInstance.save()) 
		{			
		 println "version in service in saved="+ bookingInstance.version
			println "Saved in service class"		
		}
		else 
		{
		println "version in service in NOT saved="+ bookingInstance.version
            println bookingInstance.errors
            bookingInstance.bookingStatus = oldStatus
			//throw new BookingException(message: bookingInstance.errors, bookingInstance: bookingInstance)
		}
		return bookingInstance;
	}
	
}