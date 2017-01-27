
<%@ page import="com.cimbidia.scm.oms.InventoryFuture" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryFuture.label', default: 'InventoryFuture')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryFuture']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryFuture.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="inventoryFuture.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventoryFuture.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventoryFuture.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventoryFuture.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <th><warehouse:message code="inventoryFuture.itemLocation.label" default="Item Location" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryFutureInstanceList}" status="i" var="inventoryFutureInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryFutureInstance.id}">${fieldValue(bean: inventoryFutureInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventoryFutureInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventoryFutureInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventoryFutureInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventoryFutureInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventoryFutureInstance, field: "itemLocation")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryFutureInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
