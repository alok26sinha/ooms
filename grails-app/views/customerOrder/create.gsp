
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<title><warehouse:message code="order.enterOrderDetails.label" /></title>

</head>
<body>
	
<style>
.poheader{
	background-color: rgb(96, 166, 232);
	height: 10%;
	text-align: center;
	font-size: x-large;
	position: relative;
	top: 0px;
	font-family: cambri(body);
	
	
}
.dtl-header {
background-color: cornflowerblue;
border: 1px solid white !important;
width: 6.9%;
text-align: center;
color:white !important;
vertical-align: top;

}
.dtl-header-small {

border: 1px solid white !important;
width: 2.5%;
text-align: center;
color:white !important;
background: #0c7ebb; /* Old browsers */
	background: -moz-linear-gradient(top, #0c7ebb 0%, #0c99df 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0c7ebb), color-stop(100%,#0c99df)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* IE10+ */
	background: linear-gradient(to bottom, #0c7ebb 0%,#0c99df 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c7ebb', endColorstr='#0c99df',GradientType=0 ); /* IE6-9 */


}
.dtl-header label{
color:white !important;
}
.dtl-header-small label{
color:white !important;
}
.dtl-small{
background-color: white;
border: 2px solid white !important;
width: 2.6%;
vertical-align: top;
text-align: center;
float:left;

}
.dtl {
background-color: white;
border: 2px solid white !important;
width: 7.2%;
text-align: center;

float:left;


}
.dtl-rts{
background-color: white;
border: 2px solid white !important;
width: 13.9%;
text-align: center;
float:left;

}
.envelope{

}
.orderItem-div{
 width: 100%;
 display:inline-block;
 
}
.del-orderItem{
margin-left: 90%;
}

</style>
	
	<div class="envelope" >
	
		<div id="PO" style="float:left;">
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${customerOrderInstance}">
				<div class="errors">
					<g:renderErrors bean="${customerOrderInstance}" as="list" />
				</div>
			</g:hasErrors>

			<g:each var="orderItem" in="${orderItems}" status="i">
				<g:hasErrors bean="${orderItem}">
					<div class="errors">
						<g:renderErrors bean="${orderItem}" as="list" />
					</div>
				</g:hasErrors>
			</g:each>
			<g:form role="form" action="save" method="post">
				<div class="content_inner">
					<label class="pagetitle"><warehouse:message
							code="customerOrder.co.label" /></label>
				</div>


				<fieldset>
					
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
					<table>
						<tbody>
							<tr>
								<td style=""><label for='id'><warehouse:message
											code="co.coNumber.label" /></label></td>
								<td><input type="text" name='orderNumber'
									value="${customerOrderInstance?.orderNumber?.encodeAsHTML()}" size="25" /></td>
								<td style=""><label for='bu'><warehouse:message
											code="order.bu.label" default="BU" /></label></td>
								<td><g:selectBU name="bu" optionKey="bu"
										value="${customerOrderInstance?.bu}" /></td>
								<td style=""><label for='status'><warehouse:message
											code="order.status.label" /></label></td>
								<td><input type="text" name='status.PENDING' value="New"
									size="25" readonly="readonly" style="text-align: centre" /></td>

							</tr>
							<tr>
								<td style=""><label for='dateOrdered'><warehouse:message
											code="co.issueDate.label" /></label></td>
								<td><input type="text" name="dateOrdered" id="dateOrdered"
									value="${formatDate(format:'MM/dd/yyyy', date:customerOrderInstance?.dateOrdered  )}"> <script
										type="text/javascript">
										$(function() {
											$('*[name=dateOrdered]')
													.datepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y'
															});
										});
									</script> </td>
								<td style=""><label for='earliestRequestedDate'><warehouse:message
											code="co.reqDate.label" />&nbsp;&nbsp;</label></td>
								<td>
								<input type="text" name="earliestRequestedDate" id="earliestRequestedDate" 
								value="${formatDate(format:'MM/dd/yyyy', date:customerOrderInstance?.earliestRequestedDate)}">
									<script type="text/javascript">
										$(function(){
										$('*[name=earliestRequestedDate]').datepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y'
											 });
										});
									</script>
								</td>
								
								<td style=""><label for='via'><warehouse:message
											code="co.customer.label" default="Customer" /></label></td>
								<td><g:autoSuggest id="customer" name="customer"
										jsonUrl="${request.contextPath }/json/customerLookup"
										valueId="${customerOrderInstance?.customer?.id }"
										valueName="${customerOrderInstance?.customer?.companyName }"
										styleClass="text" width="175" /></td>
							</tr>

							<tr>
								<td style=""><label for='transportation'><warehouse:message
											code="order.transportation.label" /></label></td>
								<td><g:selectTR name="transResp.id" optionKey="id"
										value="${customerOrderInstance?.transResp?.id}" /></td>
								<td style=""><label for='incoterms'><warehouse:message
											code="order.incoterms.label" /></label></td>
								<td><g:selectIncoterm name="incoterm.id" optionKey="id"
										value="${customerOrderInstance?.incoterm?.id}" /></td>
								<td style=""><label for='customerPO'><warehouse:message
											code="co.cpo.label" /></label></td>
								<td><input type="text" name='customerPO'
									value="${customerOrderInstance?.customerPoNumber?.encodeAsHTML()}" size="25" /></td>
							</tr>
							<tr>
								<td style=""><label for='shipmentType'><warehouse:message
											code="order.shipmentType.label" /></label></td>
								<td><g:selectMOT name="mot.id" optionKey="id"
										value="${customerOrderInstance?.mot?.id}" /></td>
								<td style=""><label for='carrier'>Designated
										Carrier</label></td>
								<td><g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${customerOrderInstance?.carrier?.id }"
										valueName="${customerOrderInstance?.carrier?.companyName }"
										styleClass="text" width="175" /></td>
								<td style=""><label for='mst'><warehouse:message
											code="order.mst.label" default="Must Ship Together" /></label></td>
								<td><g:checkBox name="mst"
										value="${customerOrderInstance?.mst}" /></td>
							</tr>
							

						
					
						<tr>
						<td><label for="latestRequestedDate"><warehouse:message code="co.latestReqDt.label" default="Latest Requested Date" /></label></td>
						<td>
						<input type="text" name="latestRequestedDate" id="latestRequestedDate"
									value="${formatDate(format:'MM/dd/yyyy', date:customerOrderInstance?.latestRequestedDate  )}"> <script
										type="text/javascript">
										$(function() {
											$('*[name=latestRequestedDate]')
													.datepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y'
															});
										});
									</script>
						</td>
						
						<td><label for="expirationDate"><warehouse:message code="co.expirationDate.label" default="Expiration Date" /></label></td>
						<td>
							<input type="text" name="expirationDate" id="expirationDate"
									value="${formatDate(format:'MM/dd/yyyy', date:customerOrderInstance?.expirationDate  )}"> <script
										type="text/javascript">
										$(function() {
											$('*[name=expirationDate]')
													.datepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y'
															});
										});
									</script>	
						</td>
						<td><label for="priority"><warehouse:message code="co.priority.label" default="Priority" /></label></td>
						<td><input type="text" name='priority' value="${customerOrderInstance?.priority?.encodeAsHTML()}"
								size="25" /></td>
						</tr>
						
						<tr>
						<td><label for='customerContact'><warehouse:message code="co.cContact.label" /></label></td>
						<td>
						<input type="text" name='customerContact' value="${customerOrderInstance?.customerContact?.encodeAsHTML()}"
								size="25" /></td>
						<td><label for='creditCardNumber'><warehouse:message code="co.creditCard.label" /></label></td>
						<td><input type="text" name='creditCardNumber' value="${customerOrderInstance?.creditCardNumber?.encodeAsHTML()}"
								size="25" /></td>
						<td><label for='ccExpirationDate'><warehouse:message code="co.ccExpDate.label" /></label></td>	
						<td>
						<input type="text" name="ccExpirationDate" id="ccExpirationDate"
									value="${formatDate(format:'MM/dd/yyyy', date:customerOrderInstance?.ccExpirationDate  )}"> <script
										type="text/javascript">
										$(function() {
											$('*[name=ccExpirationDate]')
													.datepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y'
															});
										});
									</script>
						</td>	
						
						</tr></tbody>
						</table><br/>
						<table>
						<tbody>
						<tr>
							<td >
	                                    <label for="fulfillmentType"><warehouse:message code="customerOrderInstance.fulfillmentType.label" default="Fulfillment Type" /></label>
	                                </td>
	                                <td class="value ${hasErrors(bean: customerOrderInstance, field: 'fulfillmentType', 'errors')}">
	                                    <g:select name="fulfillmentType.id" from="${com.cimbidia.scm.oms.FulfillmentType.list()}" optionKey="id" value="${customerOrderInstance?.fulfillmentType}"  />
	                                </td>
							<td style="width: 14%"><label for='contentdescription'><warehouse:message
										code="default.contentdescription.label" /></label></td>
							<td><input type="text" name='contentDescription'
								value="${customerOrderInstance?.contentDescription?.encodeAsHTML()}"
								size="80" /></td>
								
						</tr>
						</tbody>
						
					</table>
					
					<br>
					<table>
							<tr>
								<td/>
								<td  id="horizontalLine"/>
								<td/>
							</tr>


					</table>
					<table>
						<tr style="width: 100%">
							
							
							
							<td><label class="section-header"
								>Billing Address</label>
								<table>
									<tr>
										<td style=""><label for='origin'><warehouse:message
													code="co.billTo.label" default="Bill To" /></label></td>
										<td>
											<%--<g:selectOrderSupplier name="origin.id" optionKey="id" value="${customerOrderInstance?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
										--%> <span id="billToLocation-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="billToLocation-value" class="value" type="hidden" value=""
											name="billToLocation.id"> <input id="billToAddress.id"
											class="value" type="hidden" value="" name="origin.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="billToLocation-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${customerOrderInstance?.origin?.name}"
											placeholder="" name="origin.name" autocomplete="off">
											<script language="javascript">
											$(document).ready(function() {
											$("#billToLocation-suggest").click(function() {
											$(this).trigger("focus");
											});
											$("#billToLocation-suggest").blur(function() {
											return false;
											});
											$("#billToLocation-span").click(function() {
											return false;
											});
											//$("#origin-suggest").css('width', '300px');
											$("#billToLocation-suggest").autocomplete({
											delay: 100,
											minLength: 1,
											dataType: 'json',
											//define callback to format results
											source: function(req, add){
											var currentLocationId = $("#currentLocationId").val();
											$.getJSON('/cimbidiaSCM/json/locationLookup', { term: req.term, warehouseId: currentLocationId }, function(data) {
											var items = [];
											$.each(data, function(i, item) {
											items.push(item);
											});
											add(items);
											});
											},
											focus: function(event, ui) {
											return false;
											},
											change: function(event, ui) {
											// If the user does not select a value, we remove the value
											if (!ui.item) {
											$(this).prev().val("null").trigger("change");
											$(this).val(""); // set the value in the textbox to empty string
											$("#billToLocation-suggest").trigger("selected");
											}
											return false;
											},
											select: function(event, ui) {
											if (ui.item) {
												
											$(this).prev().val(ui.item.value).trigger("change");;
											$(this).val(ui.item.valueText);
											$("#billToAddress\\.city").val(ui.item.city);
											$("#billToAddress\\.county").val(ui.item.county);
											
												$("#billToAddress\\.country").val(ui.item.country);
												$("#billToAddress\\.postalCode").val(ui.item.postalCode);
												//$("#fromAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#billToAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#billToAddress\\.address").val(ui.item.address);
											$("#billToLocation-value").val(ui.item.value);
											//alert(ui.item.value);
											//alert(ui.item.id);
											$("#billToAddress\\.id").val(ui.item.id);
											}
											$("#billToLocation-suggest").trigger("selected");
											return false;
											}
											});
											});
											</script>
										</td>
									</tr>
									<tr>
										<td style=""><label for='billToAddress.address'>Street
												Address</label></td>
										<td><input type="text" name='billToAddress.address'
											id='billToAddress.address'
											value="${customerOrderInstance?.billToAddress?.address?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>City</label></td>
										<td><input type="text" id='billToAddress.city'
											name='billToAddress.city'
											value="${customerOrderInstance?.billToAddress?.city?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>County</label></td>
										<td><input type="text" name='billToAddress.county'
											value="${customerOrderInstance?.billToAddress?.county?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='state'>State/Province</label></td>
										<td><g:selectSTATE optionKey="id"
											name="billToAddress.stateOrProvince.id"
												value="${customerOrderInstance?.billToAddress?.stateOrProvince}" /> <input

											style="display: none;" id="billToAddress.stateOrProvince"
											type="text" name="billToAddress.stateOrProvince.id"
											value="${customerOrderInstance?.billToAddress?.stateOrProvince}" /></td>
										<script>
									$(document).ready(function()
											{
											 $("#billToAddress\\.country").change(function()
											 {
												
											  if($(this).val() != "usa")
											  {
												  $("#billToAddress\\.stateOrProvince\\.id").hide();



											   $("#billToAddress\\.stateOrProvince").show();
											  }
											  else
											  {
											   $("#billToAddress\\.stateOrProvince").hide();
											   $("#billToAddress\\.stateOrProvince\\.id").show();
											  }
											 });
											 $("#billToAddress\\.stateOrProvince").hide();
											});
									</script>
									</tr>
									<tr>
										<td style=""><label for='country'>Country</label></td>
										<td><g:countrySelect id="billToAddress.country"
												name="billToAddress.country"
												value="${customerOrderInstance?.billToAddress?.country}" default="usa" />
									</tr>
									<tr>
										<td style=""><label for='postalCode'>Zip Code</label></td>
										<td><input type="text" id='billToAddress.postalCode'
											name='billToAddress.postalCode'
											value="${customerOrderInstance?.billToAddress?.postalCode?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td><label>Pickup Start</label></td>
										<td>
										<input type="text" name="pickupStart" id="pickupStart" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:customerOrderInstance?.pickupStart  )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupStart"
												name="pickupStart" value="${customerOrderInstance?.pickupStart }"
												format="MM/dd/yyyy" size="25" showTrigger="false" />--%>
												</td>
									</tr>
									<tr>
										<td style=""><label>Pickup End</label></td>
										<td>
										<input type="text" name="pickupEnd" id="pickupEnd" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:customerOrderInstance?.pickupEnd  )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupEnd" name="pickupEnd"
												value="${customerOrderInstance?.pickupEnd }" format="MM/dd/yyyy"
												size="25" showTrigger="false" />
												--%></td>
								</table>
								</td>
							
								<td id="verticalLine">
								</td>
							<td><label class="section-header">
								DESTINATION</label>
								<table>
									<tr>
										<td style=""><label for='destination'><warehouse:message
													code="order.destination.label" default="Ship To" /></label></td>
										<td>
											<%--<g:selectOrderSupplier name="destination.id" optionKey="id" value="${customerOrderInstance?.destination?.id}" noSelection="['':'-Choose destination location-']"/>
										--%> <span id="destination-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="destination-value" class="value" type="hidden" value="1"
											name="destination.id"> <input id="toAddress.id"
											class="value" type="hidden" value="" name="toAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="destination-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${customerOrderInstance?.destination?.name}"
											placeholder="" name="destination.name" autocomplete="off">
											<script language="javascript">
											$(document).ready(function() {
											$("#destination-suggest").click(function() {
											$(this).trigger("focus");
											});
											$("#destination-suggest").blur(function() {
											return false;
											});
											$("#destination-span").click(function() {
											return false;
											});
											//$("#destination-suggest").css('width', '300px');
											$("#destination-suggest").autocomplete({
											delay: 100,
											minLength: 1,
											dataType: 'json',
											//define callback to format results
											source: function(req, add){
											var currentLocationId = $("#currentLocationId").val();
											
											$.getJSON('/cimbidiaSCM/json/locationLookup', { term: req.term, warehouseId: currentLocationId }, function(data) {
											var items = [];
											$.each(data, function(i, item) {
											items.push(item);
											});
											add(items);
											});
											},
											focus: function(event, ui) {
											return false;
											},
											change: function(event, ui) {
											// If the user does not select a value, we remove the value
											if (!ui.item) {
											$(this).prev().val("null").trigger("change");
											$(this).val(""); // set the value in the textbox to empty string
											$("#destination-suggest").trigger("selected");
											}
											return false;
											},
											select: function(event, ui) {
											if (ui.item) {
												
											$(this).prev().val(ui.item.value).trigger("change");;
											$(this).val(ui.item.valueText);
											
											$("#toAddress\\.city").val(ui.item.city);
											$("#toAddress\\.county").val(ui.item.county);
											$("#toAddress\\.postalCode").val(ui.item.postalCode);
												$("#toAddress\\.country").val(ui.item.country);
												//$("#toAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#toAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#toAddress\\.address").val(ui.item.address);
											$("#toAddress\\.id").val(ui.item.id);
											$("#destination-value").val(ui.item.value);
											}
											$("#destination-suggest").trigger("selected");
											return false;
											}
											});
											});
											</script>
										</td>
									</tr>
									<tr>
									<td style=""><label for='destination.address'>Street Address</label></td>
									<td><input type="text" name='toAddress.address' id='toAddress.address' value="${customerOrderInstance?.toAddress?.address?.encodeAsHTML()}"/>
									</tr>
									<tr>
									<td style=""><label for='city'>City</label></td>
									<td><input type="text" id='toAddress.city' name='toAddress.city' value="${customerOrderInstance?.toAddress?.city?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='city'>County</label></td>
									<td><input type="text" name='toAddress.county' value="${customerOrderInstance?.toAddress?.county?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='state'>State/Province</label></td>
									<td><g:selectSTATE optionKey="id" name="toAddress.stateOrProvince.id"  value="${customerOrderInstance?.toAddress?.stateOrProvince}" />
									<input style="display:none;" id="toAddress.stateOrProvince" type="text" name="toAddress.stateOrProvince.id"  value="${customerOrderInstance?.toAddress?.stateOrProvince}" />
									</td>
									<script>
									$(document).ready(function()
											{
											 $("#toAddress\\.country").change(function()
											 {
												
											  if($(this).val() != "usa")
											  {
												  $("#toAddress\\.stateOrProvince\\.id").hide();
											   $("#toAddress\\.stateOrProvince").show();
											  }
											  else
											  {
											   $("#toAddress\\.stateOrProvince").hide();
											   $("#toAddress\\.stateOrProvince\\.id").show();
											  }
											 });
											 $("#toAddress\\.stateOrProvince").hide();
											});
									</script>
									</tr>
									<tr>
									<td style=""><label for='country'>Country</label></td>
									<td>
									<g:countrySelect id="toAddress.country" name="toAddress.country" value="${customerOrderInstance?.toAddress?.country}"
                 						default="usa"/>
								
									</tr>
									<tr>
										<td style=""><label for='postalCode'>Zip Code</label></td>
										<td><input type="text" id='toAddress.postalCode'
											name='toAddress.postalCode'
											value="${customerOrderInstance?.toAddress?.postalCode?.encodeAsHTML()}" />
									</tr>
									<tr>
									<td style=""><label>Delivery Start</label></td>
									<td>
									<input type="text" name="deliveryStart" id="deliveryStart" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:customerOrderInstance?.deliveryStart)}">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
									<%--<g:jqueryDatePicker 
										id="deliveryStart" 
										name="deliveryStart" 
										value="${customerOrderInstance?.deliveryStart }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" />--%>
										</td>
										</tr>
										<tr>
										<td style=""><label>Delivery End</label></td>
										<td>
										<input type="text" name="deliveryEnd" id="deliveryEnd" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:customerOrderInstance?.deliveryEnd)}">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker 
										id="deliveryEnd" 
										name="deliveryEnd" 
										value="${customerOrderInstance?.deliveryEnd }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" />--%>
										</td>
								</table>
							</td>
						</tr>
						</table>
			
						<table>
							<tr>
								<td/>
								<td id="horizontalLine"/>
								<td/>
							</tr>
						</table>
						<table>
							<tr>
								
								<td>
								<label class="section-header-new" for='lineitems'><warehouse:message code="default.lineitems.label" default="LINE ITEMS"/></label>
								<td/>
							</tr>
					</table>
			<table>
						
			<tr class="prop">
						   <td valign="top" class="dtl-header-small">
						      <label for="lineNumber">#</label>
						   </td>
						   <td valign="top" class="dtl-header">
						      <label for="Origin">Origin</label>
						   </td>
						   <td valign="top" class="dtl-header">
						      <label for="orderItems"><g:message code="orderItem.Item.label" default="Item" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName"><warehouse:message code="orderItem.productClass.label" default="Product Class" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDesc"><warehouse:message code="orderItem.itemDesc.label" default="Item Desc." /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Quantity"><warehouse:message code="orderItem.Quantity.label" default="Quantity" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="uom"><warehouse:message code="orderItem.uom.label" default="Quantity UOM" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="weight"><warehouse:message code="orderItem.weight.label" default="Weight" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="weightUom"><warehouse:message code="orderItem.weightUom.label" default="Weight UOM" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Volume"><warehouse:message code="orderItem.Volume.label" default="Volume" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="volumeUom"><warehouse:message code="orderItem.volumeUom.label" default="Volume UOM" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="priceUom"><warehouse:message code="orderItem.priceUom.label" default="Price/ UOM" /></label>
							</td>
							<td valign="top" class="dtl-header-small">
							<label for="priceCurrency">Price Currency</label>
							</td>
							<td valign="top" class="dtl-header-small">
							<label for="itemDetails"><warehouse:message code="co.itemDetails.label" default="Item Details" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDetails">Total</label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDetails">Delete</label>
							</td>
							</tr>
			</table>
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		       <g:render template="orderItems" model="['customerOrderInstance':customerOrderInstance]" />
		      <!--Render the orderItems template (_orderItems.gsp) here -->
		    <table>
		                        <tr class="prop">
		                        	
		                        	<td valign="top">
						                <div class="action-menu">
												<g:render template="actionsCreate" model="[customerOrderInstance:customerOrderInstance]"/>
											</div></td>
		                        </tr>
						</table>
			
	                        
				</fieldset>
				
			
		</g:form>
	</div>
	
	<g:comboBox />	
	
	<!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    <g:render template='orderItem' model="['orderItem':null,'i':'_clone','hidden':true]"/>
   <!--Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
  
</body>
</div>
</html>