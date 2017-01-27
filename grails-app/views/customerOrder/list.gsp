<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'orders.label', default: 'Orders').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <style>
        
		
		</style>
    </head>    
    <body>
        <div class="">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            
	<div id="" class="" style="padding: 0px;width: 100%">
<div class="content_inner">
		<div class="pagetitle">
		<label style="color:white"><warehouse:message code="co.colist.label"/></label>
		</div></div>
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
		
		<div class="table-responsive list">
		
		<table id="sample-table-1" class="table table-striped table-hover table-condensed">            
            	<thead>
					<tr class="prop">   
						<th class="dtl-header"><input type="checkbox" id="selectall"/> &nbsp; Select All</th>
						<g:sortableColumn property="customer" class="dtl-header"  title="${warehouse.message(code: 'customerOrder.id.label',default:'Customer')}"  params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						<g:sortableColumn property="orderNumber" class="dtl-header"  title="${warehouse.message(code: 'customerOrder.orderNumbar.label',default:'Order Number')}"  params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						<g:sortableColumn property="status"  class="dtl-header" title="${warehouse.message(code: 'customerOrder.orderStatus.label',default:'Status')}"  params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						<g:sortableColumn property="destination"  class="dtl-header" title="${warehouse.message(code: 'customerOrder.shipTo.label',default:'Ship To')}"  params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						<g:sortableColumn property="dueDate" class="dtl-header"  title="${warehouse.message(code: 'customerOrder.dueDate.labe',default:'Due Date')}"  params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
						</tr>
				</thead>		            
				<tbody >
            		<tr class="prop odd">
                        <g:form action="coListByFilter" method="post">
                         <input type="hidden" name="selectedCheck" id="selectedCheck">
			            	<td style="border:2px solid white !important;"></td>
			            	<td class="filter-list-item"style="border:2px solid white !important;"><g:autoSuggest id="customer" name="customer"
										jsonUrl="${request.contextPath }/json/customerLookup"
										valueId="${customer?.id }"
										valueName="${customer?.companyName }"
										width="140" height="22" /></td>
				           
			            	<td class="filter-list-item" style="border:2px solid white !important;">
										<input type="text" name='orderNumber' value="${orderNumber}"/></td>
			            	
							<g:isUserInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_SUPPLIER]">
							<td class="filter-list-item" style="border:2px solid white !important;">
				           		
					           	<g:select name="status" 
		           					   from="${com.cimbidia.wm.customerOrder.CustomerOrderStatus.list() - [com.cimbidia.wm.customerOrder.CustomerOrderStatus.NEW] }"
		           					   optionValue="${{format.metadata(obj:it)}}" value="${status}" 
		           					   noSelection="['':warehouse.message(code:'default.all.label')]" />&nbsp;&nbsp;	
							</td>
								</g:isUserInRole>
				           		<g:isUserNotInRole roles="[com.cimbidia.wm.core.RoleType.ROLE_SUPPLIER]">
							<td style="border:2px solid white !important;">
						
					           	<g:select name="status" class="form-control"
		           					   from="${com.cimbidia.wm.customerOrder.CustomerOrderStatus.list() }"
		           					   optionValue="${format.metadata(obj:it)}" value="${CustomerOrderStatus?.status}" 
		           					   noSelection="['':warehouse.message(code:'default.all.label')]" />&nbsp;&nbsp;	
							</td>
							</g:isUserNotInRole>
							
							<td class="filter-list-item" style="border:2px solid white !important;">
					          	<g:selectDepot name="destination" optionKey="id" class="form-control" value="${destination }" noSelection="['':warehouse.message(code:'default.all.label')]"/>
							</td>
				           	<td class="filter-list-item" style="border:2px solid white !important;">
								
							<input type="text" name="dueDate" id="dueDate" value="">
									<script type="text/javascript">
										$(function(){
										$('*[name=dueDate]').datepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y'
											 });
										});
									</script>
							
								<button name="filter" class="btn btn-success fa fa-filter" style="float: right;"></button>
							</td>
							</g:form>
					</tr>					
									
				
				
		            <g:unless test="${customerOrders}">
		            	<tr class="prop">
		            		<td colspan="6">
			           			<warehouse:message code="order.noorders.message" default="No Customer Orders found matching the criteria"/>
				           	</td>
						</tr>     
		           	</g:unless>
            
					<g:each var="customerOrderInstance" in="${customerOrders}" status="i">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">            
							<td style="border:2px solid white !important;">
								<div class="action-menu">
									
										<input type="checkbox" name="orderCheck" class="checkForId"  id="${customerOrderInstance?.id?.encodeAsHTML()}"
										 onchange="javascript:void(0);" />
								</div>	
							</td>
							<td style="border:2px solid white !important;">
								<g:link controller="customerOrder" action="edit" id="${customerOrderInstance.id}">
									${customerOrderInstance?.customer?.companyName?.encodeAsHTML()}
								</g:link>				
							</td>									
							<td style="border:2px solid white !important;">
								<g:link action="edit" id="${customerOrderInstance.id}">
									${fieldValue(bean: customerOrderInstance, field: "orderNumber")}
								</g:link>				
							</td>
							<td style="border:2px solid white !important;">												
								${fieldValue(bean: customerOrderInstance, field: "status")}							
							</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: customerOrderInstance, field: "destination.name")}
</td>
							<td align="center" style="border:2px solid white !important;">
								${fieldValue(bean: customerOrderInstance, field: "dueDate")}
							</td>
													</tr>
					</g:each>                    		
				</tbody>
			</table>
			<table>
						<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="action-menu" >
											<g:render template="actionsList" model="[customerOrderInstance:customerOrderInstance]"/>
										</div>
										<div style="position: relative; left: -25px;" class="paginateButtons">										
               									 <g:paginate total="${customerOrderTotal?:0 }" method="post" params="${['customer.id':params.customer?.id,'customer.name':params.customer?.name,orderNumber:params.orderNumber,status:params.status,origin:params.origin,statusStartDate:params.statusStartDate, 
														statusEndDate:params.statusEndDate,destination:params.destination,suppliers:params.suppliers].findAll {it.value}}"/>
            							</div>                   	
		                        	</td>
		                        </tr>
						</table>	
			</div>
			</div>
			 <div class="paginateButtons">
                <g:paginate total="${customerOrderInstance?:0}" />
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
				        	 $("a[href='/cimbidiaSCM/customerOrder/edit/editOrderId']").attr('href', '/cimbidiaSCM/customerOrder/edit/'+val)
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
				        	$("a[href='/cimbidiaSCM/customerOrder/show/showOrderId']").attr('href', '/cimbidiaSCM/customerOrder/show/'+val)
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
        
    </body>
</html>
