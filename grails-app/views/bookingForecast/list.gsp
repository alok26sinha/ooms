
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
            <div class="list">
            
				<div>            	
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['bookingForecast']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="forecastDate" title="${warehouse.message(code: 'bookingForecast.forecastDate.label', default: 'Forecast Date')}" />
                                
                         %{--   <g:sortableColumn property="id" title="${warehouse.message(code: 'bookingForecast.id.label', default: 'Id')}" /> --}%
                            <th><warehouse:message code="bookingForecast.region.label" default="Region" /></th>            
                            
                            <th><warehouse:message code="bookingForecast.originPort.label" default="Origin Port" /></th>
                   	    
                            <th><warehouse:message code="bookingForecast.destinationPort.label" default="Destination Port" /></th>
                            
                            <th><warehouse:message code="bookingForecast.productClass.label" default="Product Class" /></th>
                            
                            <g:sortableColumn property="equipmentType" title="${warehouse.message(code: 'bookingForecast.equipmentType.label', default: 'Equipment Type')}" />
                        
                        	<th><warehouse:message code="bookingForecast.numEquipments.label" default="Number of Equipments" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookingForecastInstanceList}" status="i" var="bookingForecastInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	 <td><g:link action="edit" id="${bookingForecastInstance.id}"><format:date obj="${bookingForecastInstance.forecastDate}" /></g:link></td>
                        
                        	<td>${fieldValue(bean: bookingForecastInstance, field: "region")}</td>
                        	
                            <td>${fieldValue(bean: bookingForecastInstance, field: "originPort")}</td>
                        
                            <td>${fieldValue(bean: bookingForecastInstance, field: "destinationPort")}</td>
                            
                            <td>${fieldValue(bean: bookingForecastInstance, field: "productClass")}</td>
                        
                            <td>${fieldValue(bean: bookingForecastInstance, field: "equipmentType")}</td>
                            
                            <td>${fieldValue(bean: bookingForecastInstance, field: "numberOfEquipments")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookingForecastInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
