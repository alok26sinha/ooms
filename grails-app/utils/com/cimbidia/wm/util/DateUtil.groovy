/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package com.cimbidia.wm.util
import java.text.SimpleDateFormat

class DateUtil {

	static Date clearTime(Date date) { 
		Calendar calendar = Calendar.getInstance();
		if (date) { 
			calendar.setTime(date);
			// Set time fields to zero
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			  
			// Put it back in the Date object
			date = calendar.getTime();			
		}
		return date;
	}
	
	static Date getTodaysDate()
	{
		Date date = new Date();
		
		return date
	} 	 
	
	static  int getWeekOfYear(Date date)
	{
	
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.SUNDAY);
        cal.setTime(date);

        int WEEK_OF_YEAR=cal.get(Calendar.WEEK_OF_YEAR);

        System.out.println("WEEK OF YEAR :"+WEEK_OF_YEAR);
        
        return WEEK_OF_YEAR;
	}
	
	static Date getWeekDate(int weekOfYear)
	{
		print "weekofyear="+weekOfYear
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.SUNDAY);
		cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
		cal.set(Calendar.WEEK_OF_YEAR,weekOfYear);
		Date date = cal.getTime();
		println "getweekdate="+date
		return date;
	}
	
	static String formatDate(Date date, String format)
	{
		String dateStr
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		println "date="+ date
		println "format="+ format
		if(date && format)
		{
			dateStr = sdf.format(date);
		}
		else
		{
			println "Either date or format is null"
		}
		println "dateStr = " + dateStr
		return dateStr;
	}
	
}
