
<%@ page import="com.cimbidia.wm.order.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'order.label', default: 'Order')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['order']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'order.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="status" title="${warehouse.message(code: 'order.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'order.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="orderNumber" title="${warehouse.message(code: 'order.orderNumber.label', default: 'Order Number')}" />
                        
                            <th><warehouse:message code="order.origin.label" default="Origin" /></th>
                   	    
                            <th><warehouse:message code="order.destination.label" default="Destination" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderInstanceList}" status="i" var="orderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "status")}</td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "orderNumber")}</td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "origin")}</td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "destination")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
