
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<title><warehouse:message code="order.enterOrderDetails.label"/></title>
</head>
<body>
<style>
/* create purchase order */
.poheader{
	background-color: darkgray;
	height: 50px;
	font :bold;
	text-align: center;
	font-size: 40px;
	
}
</style>
<div class="boostrap">
	<div class="nav">
		<span class="linkButton"><a href="${createLinkTo(dir:'')}"><warehouse:message code="default.home.label"/></a>
		</span>
	</div>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${order}">
			<div class="errors">
				<g:renderErrors bean="${order}" as="list" />
			</div>
		</g:hasErrors>
		<g:each var="orderItem" in="${orderItems}" status="i">
			<g:hasErrors bean="${orderItem}">
				<div class="errors">
					<g:renderErrors bean="${orderItem}" as="list" />
				</div>
			</g:hasErrors>
		</g:each>
		<g:form role="form" action="purchaseOrder" method="post">
		<div class="poheader"><label style="color:white"><warehouse:message code="order.po.label"/></label></div>
			<div class="dialog">
			
				<fieldset>
            		<%--<g:render template="/order/summary" model="[orderInstance:order]"/>--%>
            		
            		<table>
						<tbody>
						<tr>
						<td style="text-align:right"><label for='id'><warehouse:message code="default.orderNumber.label"/></label></td>
						<td><input type="text" name='id' value="${order?.id?.encodeAsHTML()}" size="26"/></td>
						<td style="text-align:right"><label for='status'><warehouse:message code="order.status.label"/></label></td>
						<td><input type="text" name='status.PENDING' value="" size="25"/></td>
						<td style="text-align:right"><label for='priorityNumber'><warehouse:message code="order.priorityNumber.label"/></label></td>
						<td><g:select name="priorityNumber" from="${['Low','Medium','High']}" value="${order?.priorityNumber?.encodeAsHTML()}"  noSelection="['':'-Choose priority Number-']"/></td>
						</tr>
						<tr>
						<td style="text-align:right"><label for='dateOrdered'><warehouse:message code="order.orderedOn.label"/></label></td>
						<td><g:jqueryDatePicker 
										id="dateOrdered" 
										name="dateOrdered" 
										value="${order?.dateOrdered }" 
										format="MM/dd/yyyy"
										size="26"
										showTrigger="false" /></td>
						<td style="text-align:right"><label for='duedate'><warehouse:message code="order.duedate.label"/>&nbsp;&nbsp;</label></td>
						<td><g:jqueryDatePicker 
										id="duedate" 
										name="duedate" 
										value="${order?.duedate }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" /></td>
						<td></td><td></td>
						</tr>
						<tr>
						<td style="text-align:right"><label for='origin'><warehouse:message code="order.orderFrom.label"/></label></td>
							<td><g:selectOrderSupplier name="origin.id" optionKey="id" value="${order?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
						</td>
						<td style="text-align:right"><label for='destination'><warehouse:message code="order.orderFor.label"/></label></td>
							<td><g:selectDepot name="destination.id" optionKey="id" value="${order?.destination?.id}" noSelection="['':'-Choose ship to location-']"/>
						</td>
						<td></td><td></td>
						</tr>
						<tr>
						<td style="text-align:right"><label for='transportation'><warehouse:message code="order.transportation.label"/>&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><input type="text" name='transportation' value="${order?.transportation?.encodeAsHTML()}" size="26"/>
						</td>
						<td style="text-align:right"><label for='incoterms'><warehouse:message code="order.incoterms.label"/></label></td>
							<td><input type="text" name='incoterms' value="${order?.incoterms?.encodeAsHTML()}" size="25"/>
						</td>
						<td style="text-align:right"><label for='billTo'><warehouse:message code="order.billTo.label"/></label></td>
							<td><input type="text" name='billTo' value="${order?.billTo?.encodeAsHTML()}" size="25"/>
						</td>
						</tr>
						<tr>
						<td style="text-align:right"><label for='shipmentType'><warehouse:message code="order.shipmentType.label"/></label></td>
							<td><g:select name="shipmentType.id" from="${com.cimbidia.wm.shipment.ShipmentType.list()}" optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${orderCommand?.shipmentType?.id }" noSelection="['':'-Choose designated mode-']"/>
						</td>
						<td style="text-align:right"><label for='carrier'><warehouse:message code="order.carrier.label"/></label></td>
							<td><input type="text" name='carrier' value="${order?.carrier?.encodeAsHTML()}" size="25"/>
						</td>
						<td></td><td></td>
						</tr>
						<tr><td style="font-weight:bold;font-size:15px;color:gray;">Buyer Contact Information</td></tr>
						<tr>
						<td style="text-align:right"><label for='bname'><warehouse:message code="order.bname.label"/></label></td>
							<td><input type="text" name='bname' value="${order?.bname?.encodeAsHTML()}" size="26"/>
						</td>
						<td style="text-align:right"><label for='bphone'><warehouse:message code="order.bphone.label"/></label></td>
							<td><input type="text" name='bphone' value="${order?.bphone?.encodeAsHTML()}" size="25"/>
						</td>
						<td style="text-align:right"><label for='bemail'><warehouse:message code="order.bemail.label"/></label></td>
							<td><input type="text" name='bemail' value="${order?.bemail?.encodeAsHTML()}" size="25"/>
						</td>
						
						</tr>
						<tr><td style="font-weight:bold;font-size:15px;color:gray;">Seller Contact Information</td></tr>
						<tr>
						<td style="text-align:right"><label for='sname'><warehouse:message code="order.sname.label"/></label></td>
							<td><input type="text" name='sname' value="${order?.bname?.encodeAsHTML()}" size="26"/>
						</td>
						<td style="text-align:right"><label for='sphone'><warehouse:message code="order.sphone.label"/></label></td>
							<td><input type="text" name='sphone' value="${order?.bphone?.encodeAsHTML()}" size="25"/>
						</td>
						<td style="text-align:right"><label for='semail'><warehouse:message code="order.semail.label"/></label></td>
							<td><input type="text" name='semail' value="${order?.bemail?.encodeAsHTML()}" size="25"/>
						</td>
						</tr>
						</tbody></table>
						<table>
						<tr>
						<td><label for='contentdescription'><warehouse:message code="default.contentdescription.label"/></label></td>
						<td><input type="text" name='contentdescription' value="${order?.contentdescription?.encodeAsHTML()}" size="80"/></td>
						</tr>
						</table>
						
							
						<div>
						<g:submitButton class="btn btn-primary" name="next" value="${warehouse.message(code:'order.addItems.label')}"></g:submitButton>
						<input type="button" class="btn btn-primary" value="Add Order Item" onclick="orderItem();" />
						<g:submitButton class="btn btn-primary" name="saveonly" value="${warehouse.message(code:'order.save.label',  default:"Save")}"></g:submitButton> 
						<%-- 
						<g:submitButton name="finish" value="Save & Exit"></g:submitButton> 
						--%>
						<g:link action="purchaseOrder" event="cancel"><warehouse:message code="default.button.cancel.label"/></g:link>
					</div>
					
					
				</fieldset>
			</div>
		</g:form>
	</div>
	<g:comboBox />	
	
</body>
</div>
</html>