<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'orders.label', default: 'Orders').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
        <script type="text/javascript">
		$(document).ready(function() {  
			$( "#dialog-orderList" ).dialog({
			      autoOpen: false,
			      height: 600,
			      width: 600,
			      modal: true,
			      buttons: {
				
				Ok: function() {
				  $( "#dialog-orderList" ).dialog( "close" );
				}
			      },
			      close: function() {
				
			      }
			    });


			$( ".orderlist-dialog" ).click(function() {
				
				var location = $("location").val();
				var status = $("status").val();
				var customer = $("customer").val();
				var dueDate = $("dueDate").val();
				var orderNumber = $("#orderNumber").val();
				
				<g:remoteFunction options="{asynchronous:false}" controller="allocationTemplate" action="loadCustOrders" params="{orderNumber:orderNumber, location:location, status:status, customer:customer}" update="dialog-orderList"/>	
				$( "#dialog-orderList" ).dialog( "open" );
			      });
			  
		});

		</script>
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
		
		
		<div class="table-responsive list">
		
		<table id="sample-table-1" class="table table-striped table-hover table-condensed">            
            	<thead>
					<tr class="prop">   
						
						<th class="dtl-header">${warehouse.message(code: 'customerOrder.id.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'customerOrder.orderNumber.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'customerOrder.orderStatus.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'customerOrder.shipTo.label')}</th>
						<th class="dtl-header">${warehouse.message(code: 'customerOrder.dueDate.label')}</th>
						
					</tr>
				</thead>		            
				<tbody >
            						
									
				
				
		            <g:unless test="${customerOrders}">
		            	<tr class="prop">
		            		<td colspan="6">
			           			<warehouse:message code="order.noorders.message" default="No Customer Orders found matching the criteria"/>
				           	</td>
						</tr>     
		           	</g:unless>
            
					<g:each in="${customerOrders}" status="i" var="custOrders">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td><g:link action="edit" id="${custOrders.id}">
										${fieldValue(bean: custOrders, field: "orderNumber")}
									</g:link></td>


								<td>
									${fieldValue(bean: custOrders, field: "status")}
								</td>

								<td><format:date obj="${custOrders.dueDate}" /></td>

								<td>
									${fieldValue(bean: custOrders, field: "billTo")}
								</td>

								<td>
									${fieldValue(bean: custOrders, field: "customer")}
								</td>

							</tr>
						</g:each>                 		
				</tbody>
			</table>
			<table>
							
			</div>
			</div>
			</div>
			
    </body>
</html>
