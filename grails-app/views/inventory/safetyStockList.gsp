
<%@ page import="com.cimbidia.scm.oms.Inventory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'inventory.label', default: 'Inventory')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
		 <div class="content_inner">
			<label class="pagetitle">Inventories Below Safety Stock</label>
		</div>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
				<%--<div>            	
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><warehouse:message code="default.adds.label" args="['inventory']" default="Add Inventory"/></g:link>
	            	</span>
            	</div>
                --%><table>
                    <thead>
                        <tr>
                             <g:sortableColumn property="date" title="${warehouse.message(code: 'inventory.date.label', default: 'Date')}" />
                            <g:sortableColumn property="product" title="${warehouse.message(code: 'inventory.product.label', default: 'Product')}" />
                          
                            <g:sortableColumn property="location" title="${warehouse.message(code: 'inventory.location.label', default: 'Location')}" />
                          
                                                
                            
                            <g:sortableColumn property="quantity" title="${warehouse.message(code: 'inventory.availQty.label', default: 'OH Quantity')}" />
                            <g:sortableColumn property="safetyStock" title="${warehouse.message(code: 'inventory.safetystock.label', default: 'Safety Stock')}" />
                            <g:sortableColumn property="allocQty" title="${warehouse.message(code: 'inventory.shortfall.label', default: 'Shortfall')}" />
                        	
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryInstanceList}" status="i" var="inventoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                          
                        
                            <td> <g:link action="edit" id="${inventoryInstance.id}"><g:formatDate style="MEDIUM" type="date" date="${new Date()}"/></g:link></td>
                        	<td>${fieldValue(bean: inventoryInstance, field: "product")}
                            <td>${fieldValue(bean: inventoryInstance, field: "location")}</td>
                            <td>${fieldValue(bean: inventoryInstance, field: "availQty")} </td>
                               <td>${fieldValue(bean: inventoryInstance, field: "safetyStock")} </td>
                        	 <td>${(inventoryInstance.availQty?inventoryInstance.availQty:0)-(inventoryInstance.safetyStock?inventoryInstance.safetyStock:0)} </td> 
                        	 
                        	
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <%--<div class="paginateButtons">
                <g:paginate total="${inventoryInstanceTotal}" />
            </div>
        --%></div>
    </body>
</html>

