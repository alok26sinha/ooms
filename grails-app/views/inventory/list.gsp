
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

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Inventory List"/></label>

		</div>
            <div class="list">
            
				<div>            	
	            	<%--<span class="linkButton">
	            		<g:link class="new" action="create"><warehouse:message code="default.adds.label" args="['inventory']" default="Add Inventory"/></g:link>
	            	</span>
            	--%></div>
            	<table>
            	<tbody >
            		<tr class="prop odd">            
			            <g:form action="list" method="post">
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
							<td class="filter-list-item" style="border:2px solid white !important;">Date</td>
								<td style="border:2px solid white !important;"><input type="text" name="date" id="date"
									value="${date }"> <script
										type="text/javascript">
										$(function() {
											$('*[name=date]')
													.datepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y'
															});
										});
									</script>
							</td>
							<td class="filter-list-item" style="border:2px solid white !important;">
							<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
				           								</td>
							</g:form>
					</tr>		
				
					</tbody>
            	</table>
            		
                <table>
                    <thead>
                        <tr>
                             
                            <g:sortableColumn property="date" title="${warehouse.message(code: 'inventory.date.label', default: 'Date')}" />
                            <g:sortableColumn property="product" title="${warehouse.message(code: 'inventory.allocQty.label', default: 'Product')}" />
                          
                            <g:sortableColumn property="location" title="${warehouse.message(code: 'inventory.allocQty.label', default: 'Location')}" />
                          
                         
                            
                            <g:sortableColumn property="quantity" title="${warehouse.message(code: 'inventory.net.label', default: 'Net Quantity')}" />
                            <g:sortableColumn property="value" title="${warehouse.message(code: 'inventory.value.label', default: 'Net Value')}" />
                            <%--<g:sortableColumn property="currency" title="${warehouse.message(code: 'inventory.currency.label', default: 'Currency')}" />
                         
                      
                        
                        --%></tr>
                    </thead>
                    <tbody>
                    <% 
						double totalQty = 0.0;
                     	double totalVal = 0.0;
                    %>
                    <g:each in="${inventoryInstanceList}" status="i" var="inventoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                                  
                        	 <%totalQty = totalQty + inventoryInstance.q; 
                        	totalVal = totalVal + (inventoryInstance.q!=null?inventoryInstance.q:0.0)*(inventoryInstance.unitCost!=null?inventoryInstance.unitCost:inventoryInstance.itemLocation.product.pricePerUnit) ;%>
                            <td> <g:link action="dtl"  params="${[date: inventoryInstance.dateToShowOnUI, itemLocation: inventoryInstance.itemLocation.id]}">${inventoryInstance.dateToShowOnUI}</g:link></td>
                        	<td>${inventoryInstance.itemLocation.product}</td>
                            <td>${inventoryInstance.itemLocation.location}</td>
                             <td>${inventoryInstance.q} </td>
                              <td><g:formatNumber number="${(inventoryInstance.unitCost!=null?inventoryInstance.unitCost:inventoryInstance.itemLocation.product.pricePerUnit)*(inventoryInstance.q!=null?inventoryInstance.q:0.0)}" type="currency"  /> </td>
                            
                            
                        	  
                        	
                        </tr>
                    </g:each>
                  
                    <tr >
                                                  
                        	 
                            <td> </td>
                        	<td></td>
                        	 <td><b>Grand Total</b></td>
                            <td></td>
                             <td><g:formatNumber number="${totalVal}" type="currency"  /> </td>
                             
                              
                            
                        	  
                        	
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${inventoryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
