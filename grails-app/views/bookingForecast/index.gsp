
<%@ page import="com.cimbidia.wm.booking.BookingForecast" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookingForecast.label', default: 'BookingForecast')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bookingForecast" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bookingForecast" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bookingForecast.originPort.label" default="Origin Port" /></th>
					
						<th><g:message code="bookingForecast.destinationPort.label" default="Destination Port" /></th>
					
						<g:sortableColumn property="region" title="${message(code: 'bookingForecast.region.label', default: 'Region')}" />
					
						<g:sortableColumn property="forecastDate" title="${message(code: 'bookingForecast.forecastDate.label', default: 'Forecast Date')}" />
					
						<th><g:message code="bookingForecast.productClass.label" default="Product Class" /></th>
					
						<th><g:message code="bookingForecast.equipmentType.label" default="Equipment Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookingForecastInstanceList}" status="i" var="bookingForecastInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookingForecastInstance.id}">${fieldValue(bean: bookingForecastInstance, field: "originPort")}</g:link></td>
					
						<td>${fieldValue(bean: bookingForecastInstance, field: "destinationPort")}</td>
					
						<td>${fieldValue(bean: bookingForecastInstance, field: "region")}</td>
					
						<td><g:formatDate date="${bookingForecastInstance.forecastDate}" /></td>
					
						<td>${fieldValue(bean: bookingForecastInstance, field: "productClass")}</td>
					
						<td>${fieldValue(bean: bookingForecastInstance, field: "equipmentType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookingForecastInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
