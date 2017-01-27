
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

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Detailed Inventory By Value View"/></label>
		
		</div>
            <div class="list">
            	<table>
            	<tbody >
            		<tr class="prop odd">            
			            <g:form action="safetyStockAssociatedList" method="post">
			            <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            													
						
							<td style="border:2px solid white !important;">Product</td>
							<td class="filter-list-item" style="border:2px solid white !important;">
					          	<g:selectProduct name="product" optionKey="id" value="${product}" noSelection="['':warehouse.message(code:'default.all.label')]" />
							</td>
							<td style="border:2px solid white !important;">Product Group</td>
							
				           	<td class="filter-list-item" style="border:2px solid white !important;">
									<g:selectProductGroup name="productGroup" optionKey="id" value="${productGroup}" noSelection="['':warehouse.message(code:'default.all.label')]" />												
							</td>
							
							<td style="border:2px solid white !important;">Channel</td>
							
				           	<td class="filter-list-item" style="border:2px solid white !important;">
									<g:select name="user.age" from="${['Retail','Online']}" value=""
          noSelection="['':warehouse.message(code:'default.all.label')]"/>												
							</td>
							<td style="border:2px solid white !important;">Location</td>
							
				           	<td class="filter-list-item" style="border:2px solid white !important;">
									<g:selectLocation name="location" optionKey="id" value="${location}" noSelection="['':warehouse.message(code:'default.all.label')]" />												
							</td>
							<td style="border:2px solid white !important;">Location Type </td>
							<td class="filter-list-item" style="border:2px solid white !important;">
									<g:selectLocationType name="locationType" optionKey="id" value="${locationType}" noSelection="['':warehouse.message(code:'default.all.label')]" />												
							</td>
							
							<td class="filter-list-item" style="border:2px solid white !important;">
							<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
				           								</td>
							</g:form>
					</tr>		
				
					</tbody>
            	</table>
				
                <table  style="position: relative; top: 5px; width:50%">
                    <thead><%--
                        <tr>
                             
                            <g:sortablerow property="date" title="${warehouse.message(code: 'inventory.date.label', default: 'Date')}" />
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
                    --%></thead> <tbody>
                    <g:set var="j" value="${transInv.size()/14}"/>
                   	<g:set var="m" value="${0}"/>
                   	<g:set var="n" value="${14}"/>
                     <g:set var="l" value="${0}"/>
                    <g:while test="${(l < j)}">
                          
	                     <tr class="odd">
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.date.label', default: 'Date')} </td>
	                    	<g:each in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i" >                                                 
	                        	 <td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${inv.dateToShowOnUI} </td>  
	                        	                   
	                     	</g:each>
	                     	<td  style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;"> Avg ( 2 Weeks )</td>
	                     </tr>
	                     <tr class="even">
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.allocQty.label', default: 'Product')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	 <td  >${inv.itemLocation.product} </td>                        
	                     	</g:each>
	                     	<td> </td>
	                     </tr>
	                     <tr class="odd">
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.allocQty.label', default: 'Location')} </td>
	                    	<g:each in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	 <td >${inv.itemLocation.location} </td>                        
	                     	</g:each>
	                     	<td></td>
	                     </tr>
	                     <tr  class="even">
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.oh.label', default: 'OH Inventory')} </td>
	                    	<g:set var="oht" value="${0}"/>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i"> 
	                    		<g:set var="costoh"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.oh!=null?inv.oh:0.0)}"/>                                                
	                        	 <td > <g:formatNumber number="${costoh }" type="currency"  /></td>
	                        	  <g:set var="oht" value="${oht + costoh}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${oht/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr class="odd">
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.ordered.label', default: 'Committed to Order(s)')}</td>
	                    	
	                    	<g:set var="alloq" value="${0}"/>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">   
	                    		<g:set var="costalloc"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.allocQty!=null?inv.allocQty:0.0)}"/>                                              
	                        	 <td > <g:formatNumber number="${costalloc }" type="currency"  /> </td>  
	                        	 <g:set var="alloq" value="${alloq + costalloc}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${alloq/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr  class="even">
	                     <g:set var="intr" value="${0}"/>
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.future.label', default: 'In-Transit')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	 <g:set var="costInTransit"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.inTransit!=null?inv.inTransit:0.0)}"/>
	                        	 <td  ><g:formatNumber number="${costInTransit }" type="currency"  />  </td>  
	                        	 <g:set var="intr" value="${intr + costInTransit}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${intr/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr class="odd">
	                     
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.supply.label', default: 'Projected Supply')} </td>
	                    	
	                    	<g:set var="sup" value="${0}"/>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">  
	                    		 <g:set var="costSupply"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.supply!=null?inv.supply:0.0)}"/>                                               
	                        	 <td  ><g:formatNumber number="${costSupply }" type="currency"  />  </td>  
	                        	 <g:set var="sup" value="${sup + costSupply}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${sup/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr  class="even">
	                    	<g:set var="dem" value="${0}"/>
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.demand.label', default: 'Projected Demand')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	<g:set var="costDemand"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.demand!=null?inv.demand:0.0)}"/>
	                        	 <td ><g:formatNumber number="${costDemand }" type="currency"  /> </td> 
	                        	 <g:set var="dem" value="${dem + costDemand}"/>                       
	                     	</g:each>
	                     	<td><g:formatNumber number="${dem/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr class="odd">
	                    	<g:set var="safe" value="${0}"/>
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.safety.label', default: 'Safety Stock')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	  <g:set var="costSafety"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.itemLocation.safetyStock!=null?inv.itemLocation.safetyStock:0.0)}"/>
	                        	 <td ><g:formatNumber number="${costSafety }" type="currency"  />  </td>  
	                        	 <g:set var="safe" value="${safe + costSafety}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${safe/14 }" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     
	                     <tr  class="even">
	                    	<g:set var="nt" value="${0}"/>
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.net.label', default: 'Net Inventory')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">                                                 
	                        	  <g:set var="costNet"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(inv.net!=null?inv.net:0.0)}"/>
	                        	 <td  ><g:formatNumber number="${costNet }" type="currency"  /></td>  
	                        	 <g:set var="nt" value="${nt + costNet}"/>                      
	                     	</g:each>
	                     	<td><g:formatNumber number="${nt/14}" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                      
	                    	<tr class="odd">
	                    	<g:set var="dt" value="${0}"/>
	                    	<td style="background-color: #6495ED;border: 1px solid #FFF !important;font-weight: normal;text-align: center;color: #FFF !important;">${warehouse.message(code: 'inventory.delta.label', default: '%Delta')} </td>
	                    	<g:each  in="${transInv.size() < 14 ? transInv : transInv.subList(m, n)}" var="inv" status="i">  
	                    		<g:set var="delt" value = "${(((inv.net?inv.net:0)-(inv.itemLocation.safetyStock?inv.itemLocation.safetyStock:0))/inv.itemLocation.safetyStock)*100} "/>                                               
	                        	  <g:set var="costDelta"  value="${(inv.unitCost!=null?inv.unitCost:inv.itemLocation.product.pricePerUnit)*(Double.parseDouble(delt))}"/>
	                        	 <td style="${(delt >0)? 'background: none repeat scroll 0% 0% rgba(231, 245, 11, 0.89);':'background: none repeat scroll 0% 0% rgba(228, 36, 13, 0.79);' }" ><g:formatNumber number="${ costDelta}" type="currency" maxFractionDigits="2" /> </td>
	                        	 <g:set var="dt" value="${dt + costDelta}"/>                        
	                     	</g:each>
	                     	<td style="${(dt >0)? 'background: none repeat scroll 0% 0% rgba(231, 245, 11, 0.89);':'background: none repeat scroll 0% 0% rgba(228, 36, 13, 0.79);' }" ><g:formatNumber number="${dt/14}" type="currency" maxFractionDigits="2" /></td>
	                     </tr>
	                     <tr style="height: 16px;" ><td></td></tr>
	                   
					 
                    
                       <%l++ ; m+=14; n+=14%>
	                 </g:while></tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
