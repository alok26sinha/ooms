
<%@ page import="com.cimbidia.scm.oms.InventorySupplyType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupplyType.label', default: 'InventorySupplyType')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventorySupplyType']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventorySupplyType.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="inventorySupplyType.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventorySupplyType.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventorySupplyType.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventorySupplyType.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <g:sortableColumn property="description" title="${warehouse.message(code: 'inventorySupplyType.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventorySupplyTypeInstanceList}" status="i" var="inventorySupplyTypeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventorySupplyTypeInstance.id}">${fieldValue(bean: inventorySupplyTypeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventorySupplyTypeInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventorySupplyTypeInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventorySupplyTypeInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventorySupplyTypeInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventorySupplyTypeInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventorySupplyTypeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
