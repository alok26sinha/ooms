
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<title><warehouse:message code="order.enterOrderDetails.label" /></title>

</head>
<body>
	<style>
/* create purchase order */
.poheader {
	background-color: rgb(96, 166, 232);
	height: 10%;
	text-align: center;
	font-size: x-large;
	position: relative;
	top: 0px;
	font-family: cambri(body);
}

.dtl-header {
	
	width: 7%;
	
	text-align: center;
	color: white !important;
	
	background: #0c7ebb; /* Old browsers */
	background: -moz-linear-gradient(top, #0c7ebb 0%, #0c99df 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0c7ebb), color-stop(100%,#0c99df)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* IE10+ */
	background: linear-gradient(to bottom, #0c7ebb 0%,#0c99df 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c7ebb', endColorstr='#0c99df',GradientType=0 ); /* IE6-9 */
	
	
	
}
.dtl-header-small {
	background: #0c7ebb; /* Old browsers */
	background: -moz-linear-gradient(top, #0c7ebb 0%, #0c99df 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0c7ebb), color-stop(100%,#0c99df)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0c7ebb 0%,#0c99df 100%); /* IE10+ */
	background: linear-gradient(to bottom, #0c7ebb 0%,#0c99df 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c7ebb', endColorstr='#0c99df',GradientType=0 ); /* IE6-9 */
		
	width: 2.5%;
	text-align: center;
	color:white !important;
	
	
}
.dtl-header label {
	color: white !important;
}
.dtl-header-small label {
	color: white !important;
}
.dtl {
	background-color: white;
	border: 1px solid white !important;
	width: 6.86%;
	text-align: center;
	float: left;
	
}
.dtl-small{
	background-color: white;
	border: 1px solid white !important;
	width: 2.5%;
	vertical-align: top;
	text-align: center;
	float:left;

}
.envelope {
	
}

.orderItem-div {
	width: 100%;
	display: inline-block;
}

.del-orderItem {
	margin-left: 90%;
}
</style>
	
	<div class="envelope" >
	<%--<div style="float:left;"><g:render template="chat" model="[orderInstance:order]"/></div>
	--%><%--<div id="conversejs"></div>
		--%><%--<div class="nav">
		<span class="linkButton"><a href="${createLinkTo(dir:'')}"><warehouse:message code="default.home.label"/></a>
		</span>
	</div>
	--%>
		<div id="PO" style="float:left;">
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${orderInstance}">
				<div class="errors">
					<g:renderErrors bean="${orderInstance}" as="list" />
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
							code="order.po.label" /></label>
				</div>
		<fieldset>
				
					<%--<g:render template="/order/summary" model="[orderInstance:order]"/>--%>
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
											code="default.orderNumber.label" /></label></td>
								<td><input type="text" name='orderNumber'
									value="${orderInstance?.orderNumber?.encodeAsHTML()}" size="25" /></td>
								<td style=""><label for='bu'><warehouse:message
											code="order.bu.label" default="BU" /></label></td>
								<td><g:selectBU name="bu" optionKey="bu"
										value="${orderInstance?.bu}" /></td>
								<td style=""><label for='status'><warehouse:message
											code="order.status.label" /></label></td>
								<td><input type="text" name='status.PENDING' value="New"
									size="25" readonly="readonly" style="text-align: centre" /></td>

							</tr>
							<tr>
								<td style=""><label for='dateOrdered'><warehouse:message
											code="order.orderedOn.label" /></label></td>
								<td><input type="text" name="dateOrdered" id="dateOrdered"
									value="${orderInstance?.dateOrdered }"> <script
										type="text/javascript">
										$(function() {
											$('*[name=dateOrdered]')
													.datetimepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y H:i'
															});
										});
									</script> <%--<g:jqueryDatePicker id="dateOrdered" name="dateOrdered"
										value="${orderInstance?.dateOrdered }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />--%></td>
								<td style=""><label for='dueDate'><warehouse:message
											code="order.duedate.label" />&nbsp;&nbsp;</label></td>
								<td>
								<input type="text" name="dueDate" id="dueDate" value="${orderInstance?.dueDate }">
									<script type="text/javascript">
										$(function(){
										$('*[name=dueDate]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
								<%--<g:jqueryDatePicker id="duedate" name="dueDate"
										value="${orderInstance?.dueDate }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />--%></td>
								
								<td style=""><label for='via'><warehouse:message
											code="order.seller.label" default="Seller" /></label></td>
								<td><g:autoSuggest id="seller" name="seller"
										jsonUrl="${request.contextPath }/json/vendorLookup"
										valueId="${orderInstance?.seller?.id }"
										valueName="${orderInstance?.seller?.companyName }"
										styleClass="text" width="175" /></td>
							</tr>

							<tr>
								<td style=""><label for='transportation'><warehouse:message
											code="order.transportation.label" /></label></td>
								<td><g:selectTR name="transResp.id" optionKey="id"
										value="${orderInstance?.transResp?.id}" /></td>
								<td style=""><label for='incoterms'><warehouse:message
											code="order.incoterms.label" /></label></td>
								<td><g:selectIncoterm name="incoterm.id" optionKey="id"
										value="${orderInstance?.incoterm?.id}" /></td>
								<td style=""><label for='billTo'><warehouse:message
											code="order.billTo.label" /></label></td>
								<td><g:autoSuggest id="billTo" name="billTo"
										jsonUrl="${request.contextPath }/json/companyLookup"
										valueId="${orderInstance?.billTo?.id }"
										valueName="${orderInstance?.billTo?.companyName }"
										styleClass="text" width="175" /></td>
							</tr>
							<tr>
								<td style=""><label for='shipmentType'><warehouse:message
											code="order.shipmentType.label" /></label></td>
								<td><g:selectMOT name="mot.id" optionKey="id"
										value="${orderInstance?.mot?.id}" /></td>
								<td style=""><label for='carrier'>Designated
										Carrier</label></td>
								<td><g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${orderInstance?.carrier?.id }"
										valueName="${orderInstance?.carrier?.companyName }"
										styleClass="text" width="175" /></td>
								<td style=""><label for='mst'><warehouse:message
											code="order.mst.label" default="Must Ship Together" /></label></td>
								<td><g:checkBox name="mst"
										value="${orderInstance?.mst}" /></td>
							</tr>
							<tr>
								<td><label for='contentdescription'><warehouse:message
											code="default.contentdescription.label" /></label></td>
								<td colspan="5">
			<input type="text" name='contentDescription' value="${orderInstance?.contentDescription?.encodeAsHTML()}" size="80"/>
								</td>
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
								>ORIGIN</label>
								<table>
									<tr>
										<td style=""><label for='origin'><warehouse:message
													code="order.origin.label" default="Ship From" /></label></td>
										<td>
											<%--<g:selectOrderSupplier name="origin.id" optionKey="id" value="${orderInstance?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
										--%> <span id="origin-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="origin-value" class="value" type="hidden" value=""
											name="origin.id"> <input id="fromAddress.id"
											class="value" type="hidden" value="" name="fromAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="origin-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${orderInstance?.origin?.name}"
											placeholder="" name="origin.name" autocomplete="off">
											<script language="javascript">
											$(document).ready(function() {
											$("#origin-suggest").click(function() {
											$(this).trigger("focus");
											});
											$("#origin-suggest").blur(function() {
											return false;
											});
											$("#origin-span").click(function() {
											return false;
											});
											//$("#origin-suggest").css('width', '300px');
											$("#origin-suggest").autocomplete({
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
											$("#origin-suggest").trigger("selected");
											}
											return false;
											},
											select: function(event, ui) {
											if (ui.item) {
												
											$(this).prev().val(ui.item.value).trigger("change");;
											$(this).val(ui.item.valueText);
											
											$("#fromAddress\\.city").val(ui.item.city);
											$("#fromAddress\\.county").val(ui.item.county);
											$("#fromAddress\\.postalCode").val(ui.item.postalCode);
												$("#fromAddress\\.country").val(ui.item.country);
												//$("#fromAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#fromAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#fromAddress\\.address").val(ui.item.address);
											$("#origin-value").val(ui.item.value);
											//alert(ui.item.value);
											//alert(ui.item.id);
											$("#fromAddress\\.id").val(ui.item.id);
											}
											$("#origin-suggest").trigger("selected");
											return false;
											}
											});
											});
											</script>
										</td>
									</tr>
									<tr>
										<td style=""><label for='origin.address'>Street
												Address</label></td>
										<td><input type="text" name='fromAddress.address'
											id='fromAddress.address'
											value="${orderInstance?.fromAddress?.address?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>City</label></td>
										<td><input type="text" id='fromAddress.city'
											name='fromAddress.city'
											value="${orderInstance?.fromAddress?.city?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>County</label></td>
										<td><input type="text" name='fromAddress.county'
											value="${orderInstance?.fromAddress?.county?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='state'>State/Province</label></td>
										<td><g:selectSTATE optionKey="id"
												name="fromAddress.stateOrProvince.id"
												value="${orderInstance?.fromAddress?.stateOrProvince}" /> <input
											style="display: none;" id="fromAddress.stateOrProvince"
											type="text" name="fromAddress.stateOrProvince.id"
											value="${orderInstance?.fromAddress?.stateOrProvince}" /></td>
										<script>
									$(document).ready(function()
											{
											 $("#fromAddress\\.country").change(function()
											 {
												
											  if($(this).val() != "usa")
											  {
												  $("#fromAddress\\.stateOrProvince\\.id").hide();
											   $("#fromAddress\\.stateOrProvince").show();
											  }
											  else
											  {
											   $("#fromAddress\\.stateOrProvince").hide();
											   $("#fromAddress\\.stateOrProvince\\.id").show();
											  }
											 });
											 $("#fromAddress\\.stateOrProvince").hide();
											});
									</script>
									</tr>
									<tr>
										<td style=""><label for='country'>Country</label></td>
										<td><g:countrySelect id="fromAddress.country"
												name="fromAddress.country"
												value="${orderInstance?.fromAddress?.country}" default="usa" />
									</tr>
									<tr>
										<td style=""><label for='postalCode'>Zip Code</label></td>
										<td><input type="text" id='fromAddress.postalCode'
											name='fromAddress.postalCode'
											value="${orderInstance?.fromAddress?.postalCode?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td><label>Pickup Start</label></td>
										<td>
										<input type="text" name="pickupStart" id="pickupStart" value="${orderInstance?.pickupStart }">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupStart"
												name="pickupStart" value="${orderInstance?.pickupStart }"
												format="MM/dd/yyyy" size="25" showTrigger="false" />--%>
												</td>
									</tr>
									<tr>
										<td><label>Pickup End</label></td>
										<td>
										<input type="text" name="pickupEnd" id="pickupEnd" value="${orderInstance?.pickupEnd }">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
										<%--<g:jqueryDatePicker id="pickupEnd" name="pickupEnd"
												value="${orderInstance?.pickupEnd }" format="MM/dd/yyyy"
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
											<%--<g:selectOrderSupplier name="destination.id" optionKey="id" value="${orderInstance?.destination?.id}" noSelection="['':'-Choose destination location-']"/>
										--%> <span id="destination-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="destination-value" class="value" type="hidden" value="1"
											name="destination.id"> <input id="toAddress.id"
											class="value" type="hidden" value="" name="toAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="destination-suggest"
											class="autocomplete text ui-autocomplete-input" type="text"
											style="width: 175px; display: inline;" value="${orderInstance?.destination?.name}"
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
									<td><input type="text" name='toAddress.address' id='toAddress.address' value="${orderInstance?.toAddress?.address?.encodeAsHTML()}"/>
									</tr>
									<tr>
									<td style=""><label for='city'>City</label></td>
									<td><input type="text" id='toAddress.city' name='toAddress.city' value="${orderInstance?.toAddress?.city?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='city'>County</label></td>
									<td><input type="text" name='toAddress.county' value="${orderInstance?.toAddress?.county?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='state'>State/Province</label></td>
									<td><g:selectSTATE optionKey="id" name="toAddress.stateOrProvince.id"  value="${orderInstance?.toAddress?.stateOrProvince}" />
									<input style="display:none;" id="toAddress.stateOrProvince" type="text" name="toAddress.stateOrProvince.id"  value="${orderInstance?.toAddress?.stateOrProvince}" />
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
									<g:countrySelect id="toAddress.country" name="toAddress.country" value="${orderInstance?.toAddress?.country}"
                 						default="usa"/>
								
									</tr>
									<tr>
									<td style=""><label for='postalCode'>Zip Code</label></td>
									<td><input type="text" id='toAddress.postalCode' name='toAddress.postalCode' value="${orderInstance?.toAddress?.postalCode?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label>Delivery Start</label></td>
									<td>
									<input type="text" name="deliveryStart" id="deliveryStart" value="${orderInstance?.deliveryStart }">
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
										value="${orderInstance?.deliveryStart }" 
										format="MM/dd/yyyy"
										size="25"
										showTrigger="false" />--%>
										</td>
										</tr>
										<tr>
										<td style=""><label>Delivery End</label></td>
										<td>
										<input type="text" name="deliveryEnd" id="deliveryEnd" value="${orderInstance?.deliveryEnd }">
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
										value="${orderInstance?.deliveryEnd }" 
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
								<td id="horizontalLine"/><td/>
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
			<label for="uom"><warehouse:message code="orderItem.uom.label" default="UOM" /></label>
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
			<td valign="top" class="dtl-header">
			<label for="priceCurrency">Price Currency</label>
			</td>
			<td valign="top" class="dtl-header">
			<label for="Item Details">Item Details</label>
			</td>
			<td valign="top" class="dtl-header"></td>
			</tr> 
			
			</table>
	      	<div valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItems', 'errors')}">
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		       <g:render template="orderItems" model="['orderInstance':orderInstance]" />
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		    </div>
			
	                        <table>
		                        <tr class="prop">
		                        	
		                        	<td valign="top">
						                <%--<div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'CREATE')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'CANCEL')}</g:link>
						                   --%><div class="action-menu">
												<g:render template="actionsCreate" model="[orderInstance:orderInstance]"/>
											</div><%--
						                </div>                        	
		                        	--%></td>
		                        </tr>
						</table>
						
							
					
					
					
				</fieldset>
			
		</g:form>
	</div>
	<g:comboBox />	
	
	<!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    <g:render template='orderItem' model="['orderItem':null,'i':'_clone','hidden':true]"/>
    <!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
</body>
</div>
</html>