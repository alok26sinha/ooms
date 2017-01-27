
<%@ page import="com.cimbidia.scm.oms.InventoryOnHand" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventoryOnHand.label', default: 'InventoryOnHand')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventoryOnHand']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${warehouse.message(code: 'inventoryOnHand.id.label', default: 'Id')}" />
                        
                            <th><warehouse:message code="inventoryOnHand.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventoryOnHand.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventoryOnHand.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventoryOnHand.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                            <th><warehouse:message code="inventoryOnHand.itemLocation.label" default="Item Location" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryOnHandInstanceList}" status="i" var="inventoryOnHandInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventoryOnHandInstance.id}">${fieldValue(bean: inventoryOnHandInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: inventoryOnHandInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventoryOnHandInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventoryOnHandInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventoryOnHandInstance.modifiedDttm}" /></td>
                        
                            <td>${fieldValue(bean: inventoryOnHandInstance, field: "itemLocation")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryOnHandInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
