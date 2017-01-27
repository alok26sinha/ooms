
<%@ page import="com.cimbidia.wm.shipment.Shipper" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipper.label', default: 'Shipper')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['shipper']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'shipper.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${warehouse.message(code: 'shipper.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'shipper.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="trackingUrl" title="${warehouse.message(code: 'shipper.trackingUrl.label', default: 'Tracking Url')}" />
                        
                            <g:sortableColumn property="trackingFormat" title="${warehouse.message(code: 'shipper.trackingFormat.label', default: 'Tracking Format')}" />
                        
                            <g:sortableColumn property="parameterName" title="${warehouse.message(code: 'shipper.parameterName.label', default: 'Parameter Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipperInstanceList}" status="i" var="shipperInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${shipperInstance.id}">${fieldValue(bean: shipperInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: shipperInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: shipperInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: shipperInstance, field: "trackingUrl")}</td>
                        
                            <td>${fieldValue(bean: shipperInstance, field: "trackingFormat")}</td>
                        
                            <td>${fieldValue(bean: shipperInstance, field: "parameterName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipperInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
