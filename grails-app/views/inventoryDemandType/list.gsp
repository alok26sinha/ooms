
<%@ page import="com.cimbidia.scm.oms.InventoryDemandType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryDemandType.label', default: 'InventoryDemandType')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryDemandType']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryDemandType.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="allocatedDemand" title="${warehouse.message(code: 'inventoryDemandType.allocatedDemand.label', default: 'Allocated Demand')}" />
                        
                            <g:sortableColumn property="committedDemand" title="${warehouse.message(code: 'inventoryDemandType.committedDemand.label', default: 'Committed Demand')}" />
                        
                            <g:sortableColumn property="createdBy" title="${warehouse.message(code: 'inventoryDemandType.createdBy.label', default: 'Created By')}" />
                        
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventoryDemandType.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="demandType" title="${warehouse.message(code: 'inventoryDemandType.demandType.label', default: 'Demand Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryDemandTypeInstanceList}" status="i" var="inventoryDemandTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryDemandTypeInstance.id}">${fieldValue(bean: inventoryDemandTypeInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${inventoryDemandTypeInstance.allocatedDemand}" /></td>
                        
                            <td><g:formatBoolean boolean="${inventoryDemandTypeInstance.committedDemand}" /></td>
                        
                            <td>${fieldValue(bean: inventoryDemandTypeInstance, field: "createdBy")}</td>
                        
                            <td><format:date obj="${inventoryDemandTypeInstance.createdDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventoryDemandTypeInstance, field: "demandType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryDemandTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
