
<%@ page import="com.cimbidia.wm.booking.BookingForecast" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'bookingForecast.label', default: 'BookingForecast')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div>
            
            	 <div class="content_inner">
					<label class="pagetitle">${warehouse.message(code: 'viewForecast.label', default: 'View Forecast')}</label>
				</div>
            
            	<form action="summary" >
            	<div align="center">
            		<table>
            		 <tr>
	            		<td valign="top" class="name">
				            <label for="region"><warehouse:message code="bookingForecast.region.label" default="Region" /></label>
				        </td>
				        <td valign="top" class="value ${hasErrors(bean: bookingForecast, field: 'region', 'errors')}">
				            <g:select name="region" from="${com.cimbidia.wm.core.Region?.values()}" value="${bookingForecastSearchInstance?.region}"  noSelection="['null':'']"/>
				        </td>
	            		<td valign="top" class="name">
					        <label for="productClass"><warehouse:message code="bookingForecast.productClass.label" default="Product Class" /></label>
					    </td>
					    <td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'productClass', 'errors')}">
					        <g:selectPC id="productClass" name="productClass.id"  value="${bookingForecastSearchInstance?.productClass?.id}"  noSelection="['null': '']"/>
					     </td>
					     <td valign="top" class="name">
						     <label>Equipment ID</label>
						</td>
						<td valign="top" class="value ${hasErrors(bean: bookingForecastInstance, field: 'productClass', 'errors')}">
							<g:select name="equipmentType.id" id="equipmentType.id" from="${com.cimbidia.wm.core.Equipment.list()}" optionKey="id" value="${bookingForecastSearchInstance?.equipmentType?.id}" noSelection="['':'']"  />
						</td>
                    	<td valign="top">
							<button name="filter" class="btn btn-success">
									<warehouse:message code="default.button.filter.label"/>
							</button>
                    	</td>
			   		</tr>
				   </table>    		
				   <div>
            	</form>
            	<br/>
    	    <g:each in="${bookingForecastSummaryList}" status="i" var="bookingForecastSummary">
            	<table>
                    <thead>
                    	<tr class="prop">
                			<th  colspan="16" class="dtl-header">${bookingForecastSummary.region}</th>
                    	</tr>
                        <tr class="prop">
                            
                            <th class="dtl-header"><warehouse:message code="bookingForecast.origin.label" default="Origin" /></th>
                   	    
                            <th class="dtl-header"><warehouse:message code="bookingForecast.destination.label" default="Destination" /></th>
                            
                            <th class="dtl-header"><warehouse:message code="bookingForecast.productClass.label" default="Product Class" /></th>
                            
                            <g:sortableColumn class="dtl-header" property="equipmentType" title="${warehouse.message(code: 'bookingForecast.equipmentType.label', default: 'Equipment Type')}" />
                        
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_1}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_2}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_3}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_4}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_5}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_6}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_7}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_8}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_9}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_10}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_11}</th>
                    		<th class="dtl-header">${bookingForecastSummary.weekStart_12}</th>
										
                        </tr>
                    </thead>
                    <tbody>
	            	    <g:each in="${bookingForecastSummary.weeklyEquipmentSummaryList}" status="j" var="weeklyEquipmentSummary">
	                        <tr class="${(j % 2) == 0 ? 'odd' : 'even'}">
	                        
	                            <td>${fieldValue(bean: weeklyEquipmentSummary, field: "originPort")}</td>
	                        
	                            <td>${fieldValue(bean: weeklyEquipmentSummary, field: "destinationPort")}</td>
	                            
	                            <td>${weeklyEquipmentSummary.productClass.name}</td>
	                        
	                            <td>${fieldValue(bean: weeklyEquipmentSummary, field: "equipmentType")}</td>
	                            
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_1}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_2}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_3}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_4}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_5}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_6}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_7}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_8}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_9}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_10}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_11}</td>
                        		<td align="center">${weeklyEquipmentSummary.numberOfEquipments_12}</td>
	                        </tr>
	                    </g:each>
	            	    <g:each in="${bookingForecastSummary.equipmentTotals}" status="k" var="equipmentTotal">
	                        <thead class="${(k % 2) == 0 ? 'odd' : 'even'}">
	                        	<th>Total</th>
	                        	<th colspan="3" style="align:center" class="dtl-header-small">${equipmentTotal.equipment}</td>
	                        	<th width="8%" align="center">${equipmentTotal.total_1}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_2}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_3}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_4}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_5}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_6}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_7}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_8}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_9}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_10}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_11}</th>
                        		<th width="8%" align="center">${equipmentTotal.total_12}</th>
	                        </th>
	                    </g:each>
                    </tbody>
                </table>
             </g:each>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookingForecastSummaryTotal}" />
            </div>
            <div align="left">
            	<g:actionSubmit class="btn" action="createBookingFromForecast" value="${warehouse.message(code: 'default.button.createBookings.label', default: 'Create Bookings From Forecast')}" />
	        </div>
        </div>
    </body>
</html>
