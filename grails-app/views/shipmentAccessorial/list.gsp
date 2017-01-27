
<%@ page import="com.cimbidia.scm.shipment.ShipmentAccessorial" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'shipmentAccessorial.label', default: 'ShipmentAccessorial')}" />
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
            
				
                <table>
                    <thead>
                        <tr>
                        
                             <th><warehouse:message code="shipmentAccessorial.accessorial.label" default="Accessorial" /></th>
                   	    
                            <g:sortableColumn property="rate" title="${warehouse.message(code: 'shipmentAccessorial.cost.label', default: 'Cost')}" />
                        
                          	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${shipmentAccessorialInstanceList}" status="i" var="shipmentAccessorialInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                              <td>${shipmentAccessorialInstance?.accessorial?.description}</td>
                        
                            <td>${fieldValue(bean: shipmentAccessorialInstance, field: "rate")}</td>
                           
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentAccessorialInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
