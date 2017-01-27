
<%@ page import="com.cimbidia.scm.oms.InventorySupply" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventorySupply.label', default: 'InventorySupply')}" />
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
	            		<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['inventorySupply']"/></g:link>
	            	</span>
            	</div>
                <table>
                    <thead>
                        <tr>
                        
                           <g:sortableColumn property="id" title="${warehouse.message(code: 'inventorySupply.id.label', default: 'Id')}" />
                              
                             <g:sortableColumn property="startDate" title="${warehouse.message(code: 'inventorySupply.startDate.label', default: 'Start Date')}" />
                             <g:sortableColumn property="endDate" title="${warehouse.message(code: 'inventorySupply.endDate.label', default: 'End Date')}" />
                        	<th><warehouse:message code="inventorySupply.inventorySupplyType.label" default="Inventory Supply Type" /></th>
                        	<th><warehouse:message code="inventorySupply.company.label" default="Company" /></th>
                        	<th><warehouse:message code="inventorySupply.itemLocation.label" default="Item Location" /></th>
                        	<th><warehouse:message code="inventorySupply.quantity.label" default="Quantity" /></th>
                        	<th><warehouse:message code="inventorySupply.inventoryIdentifier.label" default="Inventory Identifier" /></th>
                        	<g:sortableColumn property="supplyReferenceType" title="${warehouse.message(code: 'inventorySupply.supplyReferenceType.label', default: 'Supply Reference Type')}" />
                        	<g:sortableColumn property="supplyReferences" title="${warehouse.message(code: 'inventorySupply.supplyReferences.label', default: 'Supply References')}" />
                            <th><warehouse:message code="inventorySupply.createdBy.label" default="Created By" /></th>
                   	    
                            <th><warehouse:message code="inventorySupply.modifiedBy.label" default="Modified By" /></th>
                   	    
                            <g:sortableColumn property="createdDttm" title="${warehouse.message(code: 'inventorySupply.createdDttm.label', default: 'Created Dttm')}" />
                        
                            <g:sortableColumn property="modifiedDttm" title="${warehouse.message(code: 'inventorySupply.modifiedDttm.label', default: 'Modified Dttm')}" />
                        
                           
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventorySupplyInstanceList}" status="i" var="inventorySupplyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${inventorySupplyInstance.id}">edit</g:link></td>
                        
                        	 <td><format:date obj="${inventorySupplyInstance.startDate}" /></td>
                        	 <td><format:date obj="${inventorySupplyInstance.endDate}" /></td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "inventorySupplyType.supplyType")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "company")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "itemLocation.location")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "quantity")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "inventoryIdentifier.tagNumber")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "supplyReferenceType")}</td>
                        	 <td>${fieldValue(bean: inventorySupplyInstance, field: "supplyReferences")}</td>
                        	  
                            <td>${fieldValue(bean: inventorySupplyInstance, field: "createdBy")}</td>
                        
                            <td>${fieldValue(bean: inventorySupplyInstance, field: "modifiedBy")}</td>
                        
                            <td><format:date obj="${inventorySupplyInstance.createdDttm}" /></td>
                        
                            <td><format:date obj="${inventorySupplyInstance.modifiedDttm}" /></td>
                        
                          
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventorySupplyInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
