
<%@ page import="com.cimbidia.wm.customerOrder.CustomerOrder"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<g:set var="entityName"
	value="${warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate')}" />
<title><warehouse:message code="default.list.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle"> <warehouse:message
	code="default.list.label" args="[entityName]" /></content>
	<script type="text/javascript">

		function addId(id)
		{
			
			document.getElementById("selectedCheck").value += ","+id;
		}
		function clearId()
		{
			document.getElementById("selectedCheck").value ="";
		}
		
		</script>
</head>
<body onload="clearId()">
	<div class="content_inner">

		<label class="pagetitle" align="center"><warehouse:message
				code="default.creates.label" args="[entityName]"
				default="Allocation Outcome" /></label>

	</div>
	<div class="body">
		<div class="body">
			<g:if test="${flash.message}">
				<div class="leftmessage">
					${flash.message}
				</div>
			</g:if>
			<div class="list">

				<form action="createTOFromCO" method="post" >
					<input type="hidden" name="selectedCheck" id="selectedCheck" value=""/>
				<table>
					<thead>
						<tr>
							<th></th>
							<g:sortableColumn property="orderNumber"
								title="${warehouse.message(code: 'allocationTemplate.orderNumber.label', default: 'Order Number')}" />

							<g:sortableColumn property="status"
								title="${warehouse.message(code: 'allocationTemplate.status.label', default: 'Status')}" />

							<g:sortableColumn property="dueDate"
								title="${warehouse.message(code: 'allocationTemplate.dueDate.label', default: 'Due Date')}" />

							<g:sortableColumn property="destination"
								title="${warehouse.message(code: 'allocationTemplate.destination.label', default: 'Ship To')}" />
							

							<g:sortableColumn property="customer"
								title="${warehouse.message(code: 'allocationTemplate.customer.label', default: 'Customer')}" />

						</tr>
					<tbody>

						<g:each in="${customerOrders}" status="i" var="custOrders">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td style="border:2px solid white !important;">
								<div class="action-menu">
									
										<input type="checkbox" name="orderCheck" class="checkForId"  id="${custOrders?.id?.encodeAsHTML()}"
										  onclick="addId('${custOrders?.id}')" />${custOrders?.id?.encodeAsHTML()}
								</div>	
							</td>

								<td><g:link controller="customerOrder" action="edit" id="${custOrders.id}">
										${fieldValue(bean: custOrders, field: "orderNumber")}
									</g:link></td>


								<td>
									${fieldValue(bean: custOrders, field: "status")}
								</td>

								<td><format:date obj="${custOrders.dueDate}" /></td>

								<td>
									${fieldValue(bean: custOrders, field: "destination")}
								</td>

								<td>
									${fieldValue(bean: custOrders, field: "customer")}
								</td>

							</tr>
						</g:each>
						
					</tbody>
					
				</table>
				
			
			 <table>
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:actionSubmit action="createTOFromCO" value="${warehouse.message(code: 'default.button.run.label', default: 'RELEASE')}" />
						                   
						                   
						                </div>                        	
		                        	</td>
		                        </tr>
		                        </table>
			</form>
            </div>
			 
</body>
</html>
