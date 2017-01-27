
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
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            
   		<div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Inventory Safety Stock Position"/></label>
		
		</div>
            <div class="list">
            	<table>
            	<tbody >
            		<tr class="prop odd">            
			            <g:form action="safetyStockList" method="post">
			            <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            													
						
							<td style="border:2px solid white !important;">Product</td>
							<td class="filter-list-item" style="border:2px solid white !important;">
					          	<g:selectProduct name="product" optionKey="id" value="${product}" noSelection="['':warehouse.message(code:'default.all.label')]" />
							</td>
							<td style="border:2px solid white !important;">Location</td>
							
				           	<td class="filter-list-item" style="border:2px solid white !important;">
									<g:selectLocation name="location" optionKey="id" value="${location}" noSelection="['':warehouse.message(code:'default.all.label')]" />												
							</td>
							
							<td class="filter-list-item" style="border:2px solid white !important;">
							<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
				           								</td>
							</g:form>
					</tr>		
				
					</tbody>
            	</table>
				
                <table  style="position: relative; top: 5px;">
                    <thead>
                        <tr>
                             
                            <g:sortableColumn property="date" title="${warehouse.message(code: 'inventory.date.label', default: 'Date')}" />
                            <g:sortableColumn property="product" title="${warehouse.message(code: 'inventory.allocQty.label', default: 'Product')}" />
                          
                            <g:sortableColumn property="location" title="${warehouse.message(code: 'inventory.allocQty.label', default: 'Location')}" />
                          
                         
                            
                            <g:sortableColumn property="oh" title="${warehouse.message(code: 'inventory.oh.label', default: 'OH Inventory')}" />
                             <g:sortableColumn property="allocQty" title="${warehouse.message(code: 'inventory.ordered.label', default: 'Committed to Order(s)')}" />
                              <g:sortableColumn property="intransit" title="${warehouse.message(code: 'inventory.future.label', default: 'In-Transit')}" />
                               <g:sortableColumn property="supply" title="${warehouse.message(code: 'inventory.supply.label', default: 'Projected Supply')}" />
                               <g:sortableColumn property="demand" title="${warehouse.message(code: 'inventory.demand.label', default: 'Projected Demand')}" />
                                <g:sortableColumn property="safety" title="${warehouse.message(code: 'inventory.safety.label', default: 'Safety Stock')}" />
                                <g:sortableColumn property="net" title="${warehouse.message(code: 'inventory.net.label', default: 'Net Inventory')}" />
                         
                      
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${inventoryInstanceList}" status="i" var="inventoryInstance">
                         <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                  
                        	 <td>${inventoryInstance.dateToShowOnUI} </td>
                        	 <td>${inventoryInstance.itemLocation.product} </td>
                        	 <td>${inventoryInstance.itemLocation.location} </td>
                        	 <td>${inventoryInstance.oh} </td>
                             <td>${inventoryInstance.allocQty} </td>
                        	 <td>${inventoryInstance.inTransit} </td>
                             <td>${inventoryInstance.supply} </td>
                             <td>${inventoryInstance.demand} </td>
                             <td>${inventoryInstance.itemLocation.safetyStock} </td>
                             <td>${inventoryInstance.net} </td>
                            
                        	  
                        	
                        </tr>
                     </g:each>
                    </tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
