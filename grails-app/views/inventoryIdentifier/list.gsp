
<%@ page import="com.cimbidia.scm.oms.InventoryIdentifier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryIdentifier.label', default: 'InventoryIdentifier')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryIdentifier']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryIdentifier.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="inventoryIdentifier.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventoryIdentifier.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventoryIdentifier.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventoryIdentifier.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <g:sortableColumn property="batchNo" title="${warehouse.message(code: 'inventoryIdentifier.batchNo.label', default: 'Batch No')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryIdentifierInstanceList}" status="i" var="inventoryIdentifierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryIdentifierInstance.id}">${fieldValue(bean: inventoryIdentifierInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventoryIdentifierInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventoryIdentifierInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventoryIdentifierInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventoryIdentifierInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventoryIdentifierInstance, field: "batchNo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryIdentifierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
