package com.cimbidia.wm.booking

import com.cimbidia.wm.core.Region
import com.cimbidia.scm.admin.Company

class BookingForecastSummary {

	Region region
	String weekStart_1
	String weekStart_2
	String weekStart_3
	String weekStart_4
	String weekStart_5
	String weekStart_6
	String weekStart_7
	String weekStart_8
	String weekStart_9
	String weekStart_10
	String weekStart_11
	String weekStart_12
	
	List<WeeklyEquipmentSummary> weeklyEquipmentSummaryList =  new ArrayList<WeeklyEquipmentSummary>()
	List<EquipmentTotal> equipmentTotals = new ArrayList<EquipmentTotal>()	
}
