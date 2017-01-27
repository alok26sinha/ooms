
<%@ page import="com.cimbidia.scm.oms.InventoryDemand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryDemand.label', default: 'InventoryDemand')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryDemand']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryDemand.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="inventoryDemand.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventoryDemand.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventoryDemand.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventoryDemand.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <th><warehouse:message code="inventoryDemand.inventoryDemandType.label" default="Inventory Demand Type" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryDemandInstanceList}" status="i" var="inventoryDemandInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryDemandInstance.id}">${fieldValue(bean: inventoryDemandInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventoryDemandInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventoryDemandInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventoryDemandInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventoryDemandInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventoryDemandInstance, field: "inventoryDemandType")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryDemandInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
