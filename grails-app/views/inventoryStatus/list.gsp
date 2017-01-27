
<%@ page import="com.cimbidia.scm.oms.InventoryStatus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryStatus.label', default: 'InventoryStatus')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryStatus']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryStatus.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'inventoryStatus.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="inventoryStatus" title="${warehouse.message(code: 'inventoryStatus.inventoryStatus.label', default: 'Inventory Status')}" />
                        
                            <g:sortableColumn property="supplyType" title="${warehouse.message(code: 'inventoryStatus.supplyType.label', default: 'Supply Type')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryStatusInstanceList}" status="i" var="inventoryStatusInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryStatusInstance.id}">${fieldValue(bean: inventoryStatusInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventoryStatusInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: inventoryStatusInstance, field: "inventoryStatus")}</td>
                        
                            <td>${fieldValue(bean: inventoryStatusInstance, field: "supplyType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryStatusInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
