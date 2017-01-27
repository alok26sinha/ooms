<%@page import="com.cimbidia.wm.order.OrderService"%>
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'orders.label', default: 'Orders').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <style>
        . 
		

</style>
    </head>    
    <body>
        <div class="">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
	<div id="" class="" style="padding: 0px;width: 100%">
	        
		
		<span class="content_inner">
		<div class="pagetitle">
		<label style="color:white"><warehouse:message code="order.polist.label"/></label>
		</div></span>
		<div class="right">
					<span class="plus">
			            +
			        </span>&nbsp;
			        	<%--<span class="comment note" >
				            <img class="top" src="${resource(dir: 'images', file: 'comment.png')}">
				            --%><script src="https://apis.google.com/js/platform.js"></script>
							<div id="placeholder-rr"></div>
							<script>
							  gapi.hangout.render('placeholder-rr', {
							    'render': 'createhangout',
							    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
							    'widget_size': 25
							  });
							</script>
							<%--</img>
			        	</span>
			        --%></div>
		<div class="table-responsive list" >
		<table id="sample-table-1" class="table table-striped table-hover table-condensed" >            
            	<thead >
					<tr class="prop">   
						<th class="dtl-header"><input type="checkbox" id="selectall"/> &nbsp; Select All</th>
						<g:sortableColumn property="orderNumber" class="dtl-header" title="${warehouse.message(code: 'default.orderNumber.label',default:'PO Number')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
						<g:isUserInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_ADMIN]">
						<g:sortableColumn property="seller" class="dtl-header" title="${warehouse.message(code: 'order.sellername.label',default:'Seller Name')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
						</g:isUserInRole>
						<g:sortableColumn property="dueDate" class="dtl-header" title="${warehouse.message(code: 'order.duedate.label',default:'Due Date')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
						<th class="dtl-header">Item(s)</th>
						
						<th class="dtl-header">Days Open</th>
						<th class="dtl-header">Order value($)</th>
						<g:sortableColumn property="status" class="dtl-header" title="${warehouse.message(code: 'default.postatus.label',default:'PO Status')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
						
						<g:sortableColumn property="origin" class="dtl-header" title="${warehouse.message(code: 'default.origin.label',default:'Ship From')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
						<g:sortableColumn property="destination" class="dtl-header" title="${warehouse.message(code: 'default.destination.label',default:'Ship To')}" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						
										
						<%--<th class="">${warehouse.message(code: 'order.orderedOn.label')}</th>
						--%><%--<th class="">${warehouse.message(code: 'order.transportation.label')}</th>
						--%><%--<th>${warehouse.message(code: 'order.orderedTo.label')}</th>
						<<th class="">${warehouse.message(code: 'default.shipType.label')}</th>
						<th class="">${warehouse.message(code: 'default.ordercategory.label', default: 'Category')}</th>
						<th class="">${warehouse.message(code: 'default.ordervalue.label', default: 'Value(USD)')}</th>
						<th class="">${warehouse.message(code: 'default.lastUpdated.label')}</th>					
						--%>
						</tr>
				</thead>		            
				<tbody >
            		<tr class="prop odd">            
			            <g:form action="list" method="post">
			            <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            	<td class="filter-list-item"><%--<g:autoSuggest id="orderNumber" name="orderNumber"
										jsonUrl="${request.contextPath }/json/poLookup"
										valueId="${orderInstance?.orderNumber }"
										valueName="${orderInstance?.orderNumber }"
										styleClass="text" width="175" />--%>
										<input type="text" name='orderNumber' value="${orderNumber}"/></td>
			            	<g:isUserInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_ADMIN]">
			            	<td class="filter-list-item"><g:autoSuggest id="seller" name="seller"
										jsonUrl="${request.contextPath }/json/vendorLookup"
										valueId="${orderInstance?.seller?.id }"
										valueName="${orderInstance?.seller?.companyName }"
										 width="125" /></td>
							</g:isUserInRole>
				           <%--<td class="filter-list-item" style="border:2px solid white !important;">
					           
					           	<g:jqueryDatePicker id="dueDate" name="dueDate"
																	value="${dueDate}" format="MM/dd/yyyy" size="8"/>

								
																	
																	
								<a href="javascript:void(0);" class="clear-dates"><warehouse:message code="default.clear.label"/></a>
							</td>
							--%>
							<td>
								</td>
								<td>
								</td>
								<td>
								</td>
								<td>
								</td>
							<g:isUserInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_SUPPLIER]">
							<td class="filter-list-item" style="border:2px solid white !important;">
				           		
					           	<g:select name="status" 
		           					   from="${com.cimbidia.wm.order.OrderStatus.list() - [com.cimbidia.wm.order.OrderStatus.NEW] }"
		           					   optionValue="${{format.metadata(obj:it)}}" value="${status}"  noSelection="['':warehouse.message(code:'default.all.label')]"
		           					    />&nbsp;&nbsp;	
							</td>
								</g:isUserInRole>
								
				           	<g:isUserNotInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_SUPPLIER]">
							<td>
						
					           	<g:select name="status" class="form-control"
		           					   from="${com.cimbidia.wm.order.OrderStatus.list() }"
		           					   optionValue="${{format.metadata(obj:it)}}" value="${status}"
		           					   noSelection="['':warehouse.message(code:'default.all.label')]" 
		           					  />&nbsp;&nbsp;	
							</td>
							</g:isUserNotInRole>
							
							<td class="filter-list-item" style="border:2px solid white !important;">
					          	<g:selectDepot name="origin" 
										class="form-control" optionKey="id" class="form-control" value="" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td class="filter-list-item" style="border:2px solid white !important;">
									<g:selectDepot name="destination" 
										class="form-control" optionKey="id" class="form-control" value="" noSelection="['':warehouse.message(code:'default.all.label')]"/>
									
							<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
				           	<%--<td class="filter-list-item" style="border:2px solid white !important;">
					           	<g:jqueryDatePicker id="statusStartDate" name="statusStartDate"
																	value="${statusStartDate}" format="MM/dd/yyyy" size="8"/>

								<g:jqueryDatePicker id="statusEndDate" name="statusEndDate"
																	value="${statusEndDate}" format="MM/dd/yyyy" size="8"/>
																	
																	
								<a href="javascript:void(0);" class="clear-dates"><warehouse:message code="default.clear.label"/></a>
							</td>
							<td class="filter-list-item" style="border:2px solid white !important;">								
									<g:select name="shipmentType.id" from="${com.cimbidia.wm.shipment.ShipmentType.list()}" 
										class="form-control" optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${orderCommand?.shipmentType?.id }" />
							</td>
							
				           
							--%>
							<%--<td class="filter-list-item" style="border:2px solid white !important;">
							<input type="text" name='transportation' value="" class="form-control"/>
							</td>
							--%><%--<td style="border:2px solid white !important;"/>
							<td style="border:2px solid white !important;"/>
				           	--%>							</td>
							</g:form>
					</tr>					
									
				
				
		            <g:unless test="${orders}">
		            	<tr class="prop">
		            		<td colspan="6">
			           			<warehouse:message code="order.noorders.message" default="No Purchase Orders found matching the criteria"/>
				           	</td>
						</tr>     
		           	</g:unless>
					<g:each var="orderInstance" in="${orders}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">            
							<td style="border:2px solid white !important;">
								<div class="action-menu">
									<%--<g:render template="/order/actions" model="[orderInstance:orderInstance,hideDelete:true]"/>
								
								<g:checkBox name="orderCheck" onchange="javascript:void(0);" checked="false"
										id="${orderInstance?.id?.encodeAsHTML()}" />--%>
										<input type="checkbox" name="orderCheck" class="checkForId"  id="${orderInstance?.id?.encodeAsHTML()}"
										 onchange="javascript:void(0);" />
								</div>	
							</td>									
							<td style="border:2px solid white !important;">
								<g:link action="show" id="${orderInstance.id}">
									${fieldValue(bean: orderInstance, field: "orderNumber")}
								</g:link>				
							</td>
							<g:isUserInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_ADMIN]">
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "seller.companyName")}
							</td>
							</g:isUserInRole>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "dueDate")}
							</td>
							<td style="border:2px solid white !important;">												
								<format:metadata obj="${orderInstance?.orderItems?.product?.name?.join( ",")}"/>								
							</td>
							
							<td style="border:2px solid white !important;">												
								<format:metadata obj="${(new Date() - orderInstance?.dateOrdered)}"/>								
							</td>
							
							<td style="border:2px solid white !important;">												
								<format:metadata obj="${orderInstance?.orderItems?.sum { ((it?.quantity)?(it?.quantity):0)*((it?.pricePerUom)?(it?.pricePerUom):0) } }"/>								
							</td>
							<td style="border:2px solid white !important;">												
								<format:metadata obj="${orderInstance?.status}"/>								
							</td>
							<%--<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "shipVia.name")}
							</td>
							--%>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "origin.name")}
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "destination.name")}
							</td>
							<%--<td align="center" style="border:2px solid white !important;">
								<format:date obj="${orderInstance?.dateOrdered}"/>
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: orderInstance, field: "shipmentType.name")}
							</td>
							--%><%--
							
							<td align="right" style="border:2px solid white !important;">												
								<format:metadata obj="${orderInstance?.transResp.name}"/>								
							</td>
							--%><%--<td style="border:2px solid white !important;">											
								<format:metadata obj="${orderInstance?.orderItems?.category?.collect { it.name }.toSet().toString().replace('[','').replace(']','')}"/>								
							</td>
							<td style="border:2px solid white !important;">											
								<g:formatNumber number="${orderInstance?.totalPrice()}" type="currency" currencyCode="USD" />
							</td>
							<td align="center" style="border:2px solid white !important;">
								<format:date obj="${orderInstance?.lastUpdated}"/>
							</td>
							--%></tr>
					</g:each>                    		
				</tbody>
			</table>
			<table>
						<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="action-menu" >
											<g:render template="actionsList" model="[orderInstance:orderInstance]"/>
										</div> 
										<div style="position: relative; left: -25px;" class="paginateButtons">
										
               									 <g:paginate total="${orderInstanceTotal?:0 }" params="${[status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
            								</div>                	
		                        	</td>
		                        	  
            						
		                        </tr>
						</table>	
			</div>
			</div>
			  
			
			</div>
			<script type="text/javascript">
		
		  
			$(function(){
				 $('#editOrder').click(function(){
					
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	 $("a[href='/cimbidiaSCM/order/edit/editOrderId']").attr('href', '/cimbidiaSCM/order/edit/'+val)
					        }else{
						        alert("Please Checked Only One checkBox For Edit Order");
					        	}
				       
					  });
				 $('#showOrder').click(function(){
					 
				        var val = [];
				        $(':checkbox:checked').each(function(i){
				          var currentId = $(this).attr('id');
				          val[i] = currentId
				        });
				        if(val.length == 1){
				        	$("a[href='/cimbidiaSCM/order/show/showOrderId']").attr('href', '/cimbidiaSCM/order/show/'+val)
				        }else{
					        alert("Please Checked Only One checkBox To Show Order Details");
				        	}"grails-app/views/transportationOrder/list.gsp"
					  });
			});
	
			
			$(function() { 		
				$(".clear-dates").click(function() {
					$('#statusStartDate-datepicker').val('');					
					$('#statusEndDate-datepicker').val('');
					$('#statusStartDate').val('');					
					$('#statusEndDate').val('');
				});			
			});
        </script>
         <script>
	   		<g:remoteFunction controller="message" action="setReceipient" params="{companyId:2}"/>
	   </script>
	  <script type="text/javascript">
	  $(document).ready(function() {  
			
			$("#selectall").click(function(event) { 
		  		
			 	var checkboxVals = new Array();
		        if(this.checked) { // check select status
		            $('.checkForId').each(function() {  
		                this.checked = true; 
		               
		             	checkboxVals.push(this.id);
					});
				}
			
				else{
		            $('.checkForId').each(function() {  
		                this.checked = false; 
		               
		            });     
		 			
			    };
			    var ckval = "";
			    for(var i=0; i<checkboxVals.length;i++)
			    {
			    	ckval = ckval +","+checkboxVals[i];
			    }
			   
			    
			    $("#selectedCheck").attr("value", ckval);
			
			});
	  });

	  </script>
	   <div id="dialog-collab" title="Cim Collab">
	   <g:render template="/message/omessages" />
	   </div>
	   <div id="dialog-msgtrail" title="Messages" style="display:none">
 		 	 <g:render template="/message/msgtrail" />
		</div>
    </body>
</html>
