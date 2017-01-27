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
import com.cimbidia.wm.core.Region
import com.cimbidia.wm.core.Equipment
import com.cimbidia.scm.constants.Constants
import com.cimbidia.wm.util.DateUtil


class BookingForecastService {

	boolean transactional = true
	def bookingService
	def sessionFactory
	
	List<BookingForecast> getBookingForecastList(Company company, BookingForecast bookingForecastSearchInstance) {
		
		List<BookingForecastSummary> bookingForecastSummaryList = new ArrayList<BookingForecastSummary>()
		def startDate = new Date()
		def endDate = new Date()
		
		Region searchRegion = bookingForecastSearchInstance.region
		Constants searchProductClass = bookingForecastSearchInstance.productClass
		Equipment searchEquipmentType = bookingForecastSearchInstance.equipmentType
			
		GregorianCalendar calendar = new GregorianCalendar();
	    calendar.setTime(endDate);
	    calendar.add(Calendar.DATE, 21);
	    endDate.setTime(calendar.getTime().getTime());
	    
	    StringBuffer searchCriteriaSubQry = new StringBuffer();
	    
	    if(searchRegion)
	    {
	    	searchCriteriaSubQry.append(" and t1.region = \'")
	    	searchCriteriaSubQry.append(searchRegion)
	    	searchCriteriaSubQry.append("\'")
	    }
	    
	    if(searchProductClass)
	    {
	    	if(!searchCriteriaSubQry.toString().isEmpty())
	    	{
	    		searchCriteriaSubQry.append(" and ") 
	    	}
	    	searchCriteriaSubQry.append(" t1.productClass = \'")
	    	searchCriteriaSubQry.append(searchProductClass.id)
	    	searchCriteriaSubQry.append("\'")
	    }
	    
	    if(searchEquipmentType)
	    {
	    	if(!searchCriteriaSubQry.toString().isEmpty())
	    	{
	    		searchCriteriaSubQry.append(" and ") 
	    	}
	    	searchCriteriaSubQry.append(" t1.equipmentType = \'")
	    	searchCriteriaSubQry.append(searchEquipmentType.id)
	    	searchCriteriaSubQry.append("\'")
	    }
	    
	    int currentWeekOfYear = DateUtil.getWeekOfYear(startDate);
	    println "currentWeekOfYear="+ currentWeekOfYear
	    currentWeekOfYear++
	    
	    int week_1 = currentWeekOfYear++
	    String weekDate_1 = getWeekAndDateString(week_1)
	    String subqry_1 = getSubquery(weekDate_1);
	    String week_1_displayDate = "Week "+ week_1 + "-" +weekDate_1
	    
	    int week_2 = currentWeekOfYear++
	    String weekDate_2 = getWeekAndDateString(week_2)
	    String subqry_2 = getSubquery(weekDate_2);
	    String week_2_displayDate = "Week "+ week_2 + "-" +weekDate_2

	    int week_3 = currentWeekOfYear++
	    String weekDate_3 = getWeekAndDateString(week_3)
	    String subqry_3 = getSubquery(weekDate_3);
	    String week_3_displayDate = "Week "+ week_3 + "-" +weekDate_3

	    int week_4 = currentWeekOfYear++
	    String weekDate_4 = getWeekAndDateString(week_4)
	    String subqry_4 = getSubquery(weekDate_4);
	    String week_4_displayDate = "Week "+ week_4 + "-" +weekDate_4

	    int week_5 = currentWeekOfYear++
	    String weekDate_5 = getWeekAndDateString(week_5)
	    String subqry_5 = getSubquery(weekDate_5);
	    String week_5_displayDate = "Week "+ week_5 + "-" +weekDate_5

	    int week_6 = currentWeekOfYear++
	    String weekDate_6 = getWeekAndDateString(week_6)
	    String subqry_6 = getSubquery(weekDate_6);
	    String week_6_displayDate = "Week "+ week_6 + "-" +weekDate_6

	    int week_7 = currentWeekOfYear++
	    String weekDate_7 = getWeekAndDateString(week_7)
	    String subqry_7 = getSubquery(weekDate_7);
	    String week_7_displayDate = "Week "+ week_7 + "-" +weekDate_7

	    int week_8 = currentWeekOfYear++
	    String weekDate_8 = getWeekAndDateString(week_8)
	    String subqry_8 = getSubquery(weekDate_8);
	    String week_8_displayDate = "Week "+ week_8 + "-" +weekDate_8

	    int week_9 = currentWeekOfYear++
	    String weekDate_9 = getWeekAndDateString(week_9)
	    String subqry_9 = getSubquery(weekDate_9);
	    String week_9_displayDate = "Week "+ week_9 + "-" +weekDate_9

	    int week_10 = currentWeekOfYear++
	    String weekDate_10 = getWeekAndDateString(week_10)
	    String subqry_10 = getSubquery(weekDate_10);
	    String week_10_displayDate = "Week "+ week_10 + "-" +weekDate_10

	    int week_11 = currentWeekOfYear++
	    String weekDate_11 = getWeekAndDateString(week_11)
	    String subqry_11 = getSubquery(weekDate_11);
	    String week_11_displayDate = "Week "+ week_11 + "-" +weekDate_11

	    int week_12 = currentWeekOfYear
	    String weekDate_12 = getWeekAndDateString(week_12)
	    String subqry_12 = getSubquery(weekDate_12);
	    String week_12_displayDate = "Week "+ week_12 + "-" +weekDate_12

	    //Date forecastStartDate = weekDate_1.replaceAll("/",""); //DateUtil.getWeekDate(week_1);
	    //Date forecastEndDate = weekDate_12.replaceAll("/",""); //DateUtil.getWeekDate(week_12);
	    	    
	    String qry = " select distinct t1.region, t1.originPort, t1.destinationPort, t1.productClass, t1.equipmentType" + 
	    			" , " + subqry_1 +   
	    			" , " + subqry_2 +   
	    			" , " + subqry_3 +   
	    			" , " + subqry_4 +   
	    			" , " + subqry_5 +   
	    			" , " + subqry_6 +   
	    			" , " + subqry_7 +   
	    			" , " + subqry_8 +   
	    			" , " + subqry_9 +   
	    			" , " + subqry_10 +   
	    			" , " + subqry_11 +   
	    			" , " + subqry_12 +   
	    			" from BookingForecast t1 where t1.company=" + company.id +
	    			" and date_format(date(t1.forecastDate),\'%m/%d/%Y\')>= \'" + weekDate_1 + "\'" +
	    			" and date_format(date(t1.forecastDate),\'%m/%d/%Y\')<= \'" + weekDate_12 + "\'";
	    			
		if(!searchCriteriaSubQry.toString().isEmpty())
		{
			qry += searchCriteriaSubQry 
		}
		
		qry += " order by t1.region, t1.originPort, t1.destinationPort";
	    
	    List bookingForecastList = BookingForecast.executeQuery(qry);
	    
	    println "in service bookingForecastList size="+ bookingForecastList?.size()
		
		BookingForecastSummary bookingForecastSummary 
		List<WeeklyEquipmentSummary> weeklyEquipmentSummaryList
		List<EquipmentTotal> equipmentTotals
		
		BookingForecastSummary prevBookingForecastSummary;		
		for (int i=0; i < bookingForecastList.size() ; i++)
		{
			boolean exists = false;
			int j=0;
			def bookingForecastRow = bookingForecastList[i]
			if(prevBookingForecastSummary?.region && (prevBookingForecastSummary?.region).equals(bookingForecastRow[j]))
			{
				println " Existing region"
				exists = true;
				bookingForecastSummary = prevBookingForecastSummary;
			}
			else
			{
				bookingForecastSummary = new BookingForecastSummary();
			}

			weeklyEquipmentSummaryList = bookingForecastSummary.weeklyEquipmentSummaryList;
			equipmentTotals = bookingForecastSummary.equipmentTotals
			
			bookingForecastSummary.region = bookingForecastRow[j++]
			bookingForecastSummary.weekStart_1 = week_1_displayDate
			bookingForecastSummary.weekStart_2 = week_2_displayDate
			bookingForecastSummary.weekStart_3 = week_3_displayDate
			bookingForecastSummary.weekStart_4 = week_4_displayDate
			bookingForecastSummary.weekStart_5 = week_5_displayDate
			bookingForecastSummary.weekStart_6 = week_6_displayDate
			bookingForecastSummary.weekStart_7 = week_7_displayDate
			bookingForecastSummary.weekStart_8 = week_8_displayDate
			bookingForecastSummary.weekStart_9 = week_9_displayDate
			bookingForecastSummary.weekStart_10 = week_10_displayDate
			bookingForecastSummary.weekStart_11 = week_11_displayDate
			bookingForecastSummary.weekStart_12 = week_12_displayDate

			WeeklyEquipmentSummary weeklyEquipmentSummary = new WeeklyEquipmentSummary()
			weeklyEquipmentSummary.originPort = bookingForecastRow[j++]
			weeklyEquipmentSummary.destinationPort = bookingForecastRow[j++]
			weeklyEquipmentSummary.productClass = bookingForecastRow[j++]
			weeklyEquipmentSummary.equipmentType = bookingForecastRow[j++]

			EquipmentTotal equipmentTotal= getEquipmentTotalFromList(equipmentTotals, weeklyEquipmentSummary.equipmentType)
			
			if(!equipmentTotal)
			{
				equipmentTotal= new EquipmentTotal()
				equipmentTotal.equipment = weeklyEquipmentSummary.equipmentType
				equipmentTotals.add(equipmentTotal);
			}
						
			weeklyEquipmentSummary.numberOfEquipments_1 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_1 += weeklyEquipmentSummary.numberOfEquipments_1

			weeklyEquipmentSummary.numberOfEquipments_2 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_2 += weeklyEquipmentSummary.numberOfEquipments_2
			
			weeklyEquipmentSummary.numberOfEquipments_3 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_3 += weeklyEquipmentSummary.numberOfEquipments_3
			
			weeklyEquipmentSummary.numberOfEquipments_4 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_4 += weeklyEquipmentSummary.numberOfEquipments_4

			weeklyEquipmentSummary.numberOfEquipments_5 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_5 += weeklyEquipmentSummary.numberOfEquipments_5

			weeklyEquipmentSummary.numberOfEquipments_6 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_6 += weeklyEquipmentSummary.numberOfEquipments_6

			weeklyEquipmentSummary.numberOfEquipments_7 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_7 += weeklyEquipmentSummary.numberOfEquipments_7

			weeklyEquipmentSummary.numberOfEquipments_8 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_8 += weeklyEquipmentSummary.numberOfEquipments_8

			weeklyEquipmentSummary.numberOfEquipments_9 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_9 += weeklyEquipmentSummary.numberOfEquipments_9

			weeklyEquipmentSummary.numberOfEquipments_10 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_10 += weeklyEquipmentSummary.numberOfEquipments_10

			weeklyEquipmentSummary.numberOfEquipments_11 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_11 += weeklyEquipmentSummary.numberOfEquipments_11

			weeklyEquipmentSummary.numberOfEquipments_12 = (bookingForecastRow[j++]?:0)
			equipmentTotal.total_12 += weeklyEquipmentSummary.numberOfEquipments_12
			
			weeklyEquipmentSummaryList.add(weeklyEquipmentSummary)
			
			if(!exists)
			{
				bookingForecastSummaryList.add(bookingForecastSummary)
			}
			
			prevBookingForecastSummary = bookingForecastSummary
		}
		println "bookingForecastSummaryList size="+ bookingForecastSummaryList.size();
		return bookingForecastSummaryList;
	}
	
	String getWeekAndDateString(int weekOfYear)
	{
		String dateStr ;
		Date weekDate = DateUtil.getWeekDate(weekOfYear);
		println "date before format="+weekDate
		dateStr = DateUtil.formatDate(weekDate, "MM/dd/yyyy");
		
		return dateStr;
	}
	
	String getSubquery(String weekDate)
	{
		StringBuffer subQry = new StringBuffer();
		
		if(weekDate)
			subQry.append("  ( select  t2.numberOfEquipments from BookingForecast t2 where t2.region=t1.region and t2.originPort=t1.originPort and t1.destinationPort=t2.destinationPort and t2.productClass = t1.productClass and t2.equipmentType=t1.equipmentType and t1.company=t2.company and date_format(date(t2.forecastDate),\'%m/%d/%Y\')= \'" + weekDate + "\' ) ");
		
		return subQry.toString();
	}
	
	
	EquipmentTotal getEquipmentTotalFromList(List<EquipmentTotal> equipmentTotals, Equipment equipment)
	{
		EquipmentTotal equipmentTotal;
		for(equipTotal in equipmentTotals)
		{
			if(equipTotal.equipment.equals(equipment))
			{
				equipmentTotal = equipTotal;
				println "Found exisiting equipment"
				break;
			}
		} 
		return equipmentTotal
	}
	
	List<BookingForecast> getUnprocessedBookingForecastList(Company company) {
	
		def startDate = new Date()
		def endDate = new Date()
		
		
		GregorianCalendar calendar = new GregorianCalendar();
	    calendar.setTime(endDate);
	    calendar.add(Calendar.DATE, 21);
	    endDate.setTime(calendar.getTime().getTime());
	    
	    //List bookingForecastList = BookingForecast.executeQuery(" select distinct t1.region, t1.originPort, t1.destinationPort, t1.productClass, t1.equipmentType,(select '23-June' as weekStart_1, t2.numberOfEquipments as numberOfEquipments from BookingForecast t2 where t2.region=t1.region and t2.originPort=t1.originPort and t1.destinationPort=t2.destinationPort and t2.productClass = t1.productClass and t2.equipmentType=t1.equipmentType and t1.company=t2.company and forecastDate >='2014-06-09' and forecastDate < '2014-06-16') from BookingForecast t1 where t1.company= 1 order by t1.region, t1.originPort, t1.destinationPort");
	    
//	    println "bookingForecastSummaryList size="+ bookingForecastSummaryList?.size()
	    
		List bookingForecastList = BookingForecast.withCriteria {
			and {
					ge("forecastDate",startDate)
					le("forecastDate",endDate)
					if(company)
					{
						eq("company",company)
					}
					eq("bookingsGenerated",false)
					order("region","asc")		
					order("originPort","asc")		
					order("destinationPort","asc")
					order("forecastDate","asc")		
				}
		}
		
		 
		return bookingForecastList
	}
	
	
		public saveBookingsFromForecast (List<Booking> bookingInstanceList, List<String> bookingForecastIds)
		{
			List errors = new ArrayList();
			
			for(bookingInstance in bookingInstanceList)
			{
				println "bookingInstance="+bookingInstance
				if (!bookingService.saveBooking(bookingInstance, bookingInstance.bookingStatus) || bookingInstance.hasErrors()) 
				{
					errors.add(bookingInstance.errors);	
				}
		    }
		    if(!errors)
		    {
		    	updateBookingGeneratedForForecasts(bookingForecastIds);
		    }
		    return errors
		}
		
		
		
		public boolean updateBookingGeneratedForForecasts (List<String> bookingForecastIds)
		{
			String upd = "  update BookingForecast set bookingsGenerated = 1 where id in (:bookingForecastIds) " 
			println "before execup"
			//BookingForecast.executeUpdate(upd, bookingForecastIds);
			
			def session = sessionFactory.currentSession
			
			def updQry = session.createQuery(upd)
			def qryWithParams = updQry.setParameterList('bookingForecastIds',bookingForecastIds);
			qryWithParams.executeUpdate();
			
			println "after execupd"
			return true;
		}
}