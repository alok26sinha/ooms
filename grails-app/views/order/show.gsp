<%@ page import="com.cimbidia.wm.order.Order" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<title><warehouse:message code="order.enterOrderDetails.label"/></title>

</head>
<body>
<style>
.disabled{
disabled=true;
}
.poheader{
	background-color: rgb(96, 166, 232)
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
width:6%;
text-align: center;
color:white !important;

}
.dtl-header label{
color:white !important;
}
.dtl-header-small label{
color:white !important;
}
.dtl-header-small {

	width: 2%;
	border: 1px solid white !important;
	
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
.dtl {
background-color: white;
border: 2px solid white !important;
width: 7.15%;
text-align: center;
float:left;

}
.dtl-small {
background-color: white;
border: 1px solid white !important;
width: 2.2%;
text-align: center;
float:left;
padding-left: 1px;
}
.dtl-rts{
background-color: white;
border: 1px solid white !important;
width: 14.1%;
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
<div>
	<%--<div style="float:left;"><g:render template="chat" model="[orderInstance:order]"/></div>
	--%><%--<div class="nav">
		<span class="linkButton"><a href="${createLinkTo(dir:'')}"><warehouse:message code="default.home.label"/></a>
		</span>
	</div>
	--%><div >
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
		<g:form role="form" action="update" method="post">
		<div class="content_inner ">
		<div class="pagetitle"><label style="color:white"><warehouse:message code="order.showpo.label" default="Purchase Order Details"/></label>
		</div>
		</div>
			
			
				<fieldset>
				<div class="right"><a href="javascript:void(0);" >
					<span class="plus">
			            +
			        </span></a>&nbsp;
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
						<td style=""><label for='orderNumber'><warehouse:message code="default.orderNumber.label"/></label></td>
						<td><input type="text" readonly="readonly"  name='orderNumber' value="${orderInstance?.orderNumber?.encodeAsHTML()}" size="25" readonly="readonly"/></td>
						<td style=""><label for='bu'><warehouse:message code="order.bu.label" default="BU"/></label></td>
						<td><g:selectBU disabled="true" name="bu" optionKey="bu" value="${order?.bu}" />
						<td style=""><label for='status'><warehouse:message code="order.status.label"/></label></td>
						<td><input type="text" readonly="readonly"  name='status' value="${orderInstance?.status}"  size="25" readonly="readonly"/></td>
						
						</tr>
						<tr>
								<td style=""><label for='dateOrdered'><warehouse:message
											code="order.orderedOn.label" /></label></td>
								<td >
								<input type="text" readonly="readonly" name="dateOrdered" id="dateOrdered" value="${formatDate(format:'yyyy-MM-dd', date:orderInstance?.dateOrdered )}">
								<%--<g:jqueryDatePicker readOnly="true" readOnly="true" cssClass="disabled" id="dateOrdered" name="dateOrdered"
										value="${orderInstance?.dateOrdered }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />
										--%></td>
								<td style=""><label for='dueDate'><warehouse:message
											code="order.duedate.label" />&nbsp;&nbsp;</label></td>
								<td>
								<input type="text" readonly="readonly" name="dueDate" id="dueDate" value="${formatDate(format:'yyyy-MM-dd', date:orderInstance?.dueDate )}">
								<%--<g:jqueryDatePicker readOnly="true" id="duedate" name="dueDate"
										value="${orderInstance?.dueDate }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />
										--%></td>
								
								<td style=""><label for='via'><warehouse:message
											code="order.seller.label" default="Seller" /></label></td>
								<td><g:autoSuggest id="seller" name="seller"
										jsonUrl="${request.contextPath }/json/vendorLookup"
										valueId="${orderInstance?.seller?.id }"
										valueName="${orderInstance?.seller?.companyName }"
										styleClass="text disabled" width="175" /></td>
							</tr>

							<tr>
								<td style=""><label for='transportation'><warehouse:message
											code="order.transportation.label" /></label></td>
								<td><g:selectTR disabled="true" name="transResp.id" optionKey="id"
										value="${orderInstance?.transResp?.id}" /></td>
								<td style=""><label for='incoterms'><warehouse:message
											code="order.incoterms.label" /></label></td>
								<td><g:selectIncoterm disabled="true" name="incoterm.id" optionKey="id"
										value="${orderInstance?.incoterm?.id}" /></td>
								<td style=""><label for='billTo'><warehouse:message
											code="order.billTo.label" /></label></td>
								<td><g:autoSuggest id="billTo" name="billTo"
										jsonUrl="${request.contextPath }/json/companyLookup"
										valueId="${orderInstance?.billTo?.id }"
										valueName="${orderInstance?.billTo?.companyName }"
										styleClass="text disabled" width="175" /></td>
							</tr>
							<tr>
								<td style=""><label for='shipmentType'><warehouse:message
											code="order.shipmentType.label" /></label></td>
								<td><g:selectMOT disabled="true" name="mot.id" optionKey="id"
										value="${orderInstance?.mot?.id}" /></td>
								<td style=""><label for='carrier'>Designated
										Carrier</label></td>
								<td><g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${orderInstance?.carrier?.id }"
										valueName="${orderInstance?.carrier?.companyName }"
										styleClass="text disabled" width="175" /></td>
								<td style=""><label for='mst'><warehouse:message
											code="order.mst.label" default="Must Ship Together" /></label></td>
								<td><g:checkBox disabled="true" name="mst"
										value="${orderInstance?.mst}" /></td>
							</tr>
							

						</tbody>
					</table>

					<br>
					<table>
						<tr>

							<td style="width: 21.5%"><label for='contentdescription'><warehouse:message
										code="default.contentdescription.label" /></label></td>
							<td><input type="text" readonly="readonly"  name='contentDescription'
								value="${orderInstance?.contentDescription?.encodeAsHTML()}"
								size="80" /></td>
						</tr>
					</table>
						<br/>
					<table>
						<tr style="width: 100%">
							<td style="width: 50%"><label
								  class="section-header"><b>Origin</b></label>
								<table style="border: 1px solid lightgrey">
									<tr>
										<td style=""><label for='origin'><warehouse:message
													code="order.origin.label" default="Ship From" /></label></td>
										<td>
											<%--<g:selectOrderSupplier name="origin.id" optionKey="id" value="${orderInstance?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
										--%> <span id="origin-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="origin-value" class="value" type="hidden" value="1"
											name="origin.id"> <input id="fromAddress.id"
											class="value" type="hidden" value="" name="fromAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="origin-suggest"
											class="autocomplete text ui-autocomplete-input" type="text" readonly="readonly" 
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
											
												$("#fromAddress\\.country").val(ui.item.country);
												//$("#fromAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#fromAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#fromAddress\\.address").val(ui.item.address);
											$("#origin-value").val(ui.item.value);
											$("#fromAddress\\.id").val(ui.item.value);
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
										<td><input type="text" readonly="readonly"  name='fromAddress.address'
											id='fromAddress.address'
											value="${orderInstance?.fromAddress?.address?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>City</label></td>
										<td><input type="text" readonly="readonly"  id='fromAddress.city'
											name='fromAddress.city'
											value="${orderInstance?.fromAddress?.city?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>County</label></td>
										<td><input type="text" readonly="readonly"  name='fromAddress.county'
											value="${orderInstance?.fromAddress?.county?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='state'>State/Province</label></td>
										<td><g:selectSTATE disabled="true" optionKey="id"
												name="fromAddress.stateOrProvince.id"
												value="${orderInstance?.fromAddress?.stateOrProvince}" /> <input
											style="display: none;" id="fromAddress.stateOrProvince"
											type="text" readonly="readonly"  name="fromAddress.stateOrProvince.id"
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
										<td><g:countrySelect disabled="true" id="fromAddress.country"
												name="fromAddress.country"
												value="${orderInstance?.fromAddress?.country}" default="usa" />
									</tr>
									<tr>
										<td style=""><label>Pickup Start</label></td>
										<td>
										<input type="text" readonly="readonly" name="pickupStart" id="pickupStart" value="${orderInstance?.pickupStart }">
										<%--<g:jqueryDatePicker readOnly="true" id="pickupStart"
												name="pickupStart" value="${orderInstance?.pickupStart }"
												format="MM/dd/yyyy" size="25" showTrigger="false" />
												
												--%></td>
									</tr>
									<tr>
										<td style=""><label>Pickup End</label></td>
										<td>
										<input type="text" readonly="readonly" name="pickupEnd" id="pickupEnd" value="${orderInstance?.pickupEnd }">
										<%--<g:jqueryDatePicker readOnly="true" id="pickupEnd" name="pickupEnd"
												value="${orderInstance?.pickupEnd }" format="MM/dd/yyyy"
												size="25" showTrigger="false" />
												--%></td>
								</table></td>
							<td style="width: 50%"><label
								class="section-header"><b>Destination</b></label>
								<table style="border: 1px solid lightgrey">
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
											class="autocomplete text ui-autocomplete-input" type="text" readonly="readonly" 
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
											
												$("#toAddress\\.country").val(ui.item.country);
												//$("#toAddress\\.stateOrProvince").val(ui.item.stateOrProvince);
												$("#toAddress\\.stateOrProvince\\.id").val(ui.item.stateOrProvince);
											
											$("#toAddress\\.address").val(ui.item.address);
											$("#toAddress\\.id").val(ui.item.value);
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
									<td><input type="text" readonly="readonly"  name='toAddress.address' id='toAddress.address' value="${orderInstance?.toAddress?.address?.encodeAsHTML()}"/>
									</tr>
									<tr>
									<td style=""><label for='city'>City</label></td>
									<td><input type="text" readonly="readonly"  id='toAddress.city' name='toAddress.city' value="${orderInstance?.toAddress?.city?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='city'>County</label></td>
									<td><input type="text" readonly="readonly"  name='toAddress.county' value="${orderInstance?.toAddress?.county?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='state'>State/Province</label></td>
									<td><g:selectSTATE disabled="true" optionKey="id" name="toAddress.stateOrProvince.id"  value="${orderInstance?.toAddress?.stateOrProvince}" />
									<input style="display:none;" id="toAddress.stateOrProvince" type="text" readonly="readonly"  name="toAddress.stateOrProvince.id"  value="${orderInstance?.toAddress?.stateOrProvince}" />
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
									<g:countrySelect disabled="true" id="toAddress.country" name="toAddress.country" value="${orderInstance?.toAddress?.country}"
                 						default="usa"/>
								
									</tr>
									<tr>
									<td style=""><label>Delivery Start</label></td>
									<td>
									<input type="text" readonly="readonly" name="deliveryStart" id="deliveryStart" value="${orderInstance?.deliveryStart }">
									<%--<g:jqueryDatePicker readOnly="true" 
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
										<input type="text" readonly="readonly" name="deliveryEnd" id="deliveryEnd" value="${orderInstance?.deliveryEnd }">
										<%--<g:jqueryDatePicker readOnly="true" 
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
						<br/>
						<div style="font-weight:bold;font-size:16px;color:gray;"><label class="section-header" for='lineitems'><warehouse:message code="default.lineitems.label" default="Line Items"/></label></div>
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
			<td valign="top" class="dtl-header">
			<label for="priceCurrency">Price Currency</label>
			</td>
			<%--<td valign="top" class="dtl-header">
			<label for="Item Details">Item Details</label>
			</td>
			--%><td valign="top" class="dtl-header"><warehouse:message code="orderItem.rts.label" default="RTS" /></td>
	</tr> 
	</table>
	<table>
	  <tr valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItems', 'errors')}">
		       <%--<!-- Render the orderItems template (_orderItems.gsp) here -->--%>
		       <g:render template="orderItemsShow" model="['orderInstance':orderInstance]" />
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		   </tr>
			
	                        
		                        
						</table>
						<br/>
						<!--  rts section -->
						<div <g:if test="${orderInstance?.orderItemsRTS.size()==0}">style="display:none;"</g:if>>	
						<div style="font-weight:bold;font-size:16px;color:gray;"><label class="section-header" for='rtslines'><warehouse:message code="default.rtslines.label" default="RTS Lines"/></label></div>
						<table>										
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label for="items"><g:message code="orderItemRTS.Item.label" default="Item" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName"><warehouse:message code="orderItemRTS.productClass.label" default="Poduct Class" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDesc"><warehouse:message code="orderItemRTS.itemDesc.label" default="Item Description" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Quantity"><warehouse:message code="orderItemRTS.Quantity.label" default="Quantity" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="uom"><warehouse:message code="orderItemRTS.uom.label" default="UOM" /></label>
							</td>
							<%--<td valign="top" class="dtl-header">
							<label for="priceUom"><warehouse:message code="orderItemRTS.priceUom.label" default="Price/UOM" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="priceUom"><warehouse:message code="orderItemRTS.priceUom.label" default="Price/UOM" /></label>
							</td>
							--%><td valign="top" class="dtl-header">
							<label for="startDt"><warehouse:message code="orderItemRTS.startDt.label" default="Pickup Start Date" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="endDt"><warehouse:message code="orderItemRTS.endDt.label" default="Pickup End Date"/></label>
							</td>
							
							</tr> 
							</table>
							<table>
						  		<tr valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderItemsRTS', 'errors')}">
							       <!-- Render the orderItems template (_orderItems.gsp) here -->
							       <g:render template="orderItemsRTS" model="['orderInstance':orderInstance]" />
							       <!-- Render the orderItems template (_orderItems.gsp) here -->
							   	</tr>  
		                        
						</table>
						</div>
							
						<table>
						<tr class="prop">
		                        	
		                        	<td valign="top">
						                <div class="action-menu" style="float:left">
											<g:render template="actionsShow" model="[orderInstance:orderInstance]"/>
										</div>                 	
		                        	</td>
		                        </tr>
						</table>
					
					
				</fieldset>
			</div>
		</g:form>
	</div>
	<g:comboBox />	
	<div id="dialog-form" title="Mark item ready to ship">
        <form id="rtsForm">
          <fieldset>
          <div class="bootstrap">
          	<input type="hidden" name="orderid" id="orderid" value="${orderInstance?.id}"/>
          	<input type="hidden" name="itemid" id="itemid" value="${orderItem?.id}"/>
         
        <div class="row">
        <div class="col-md-6"><label for="rtsWeight">Ready to Ship Wt and Wt UOM</label></div>
	<div class="col-md-6">	<input type="text" class="text ui-widget-content ui-corner-all" name="rtsWeight" id="rtsWeight" class="text ui-widget-content ui-corner-all" /><g:selectUOM name="weightUom.id" optionKey="id" value="${orderItem?.weightUom?.id}" /></div>
	 	<div class="col-md-6"><label for="rtsVolume">Ready to Ship Vol and Vol UOM</label></div>
	<div class="col-md-6">	<input type="text" class="text ui-widget-content ui-corner-all" name="rtsVolume" id="rtsVolume" class="text ui-widget-content ui-corner-all" /><g:selectUOM name="volumeUom.id" optionKey="id" value="${orderItem?.volumeUom?.id}" /></div>
	 	<div class="col-md-6"><label for="rtsQuantity">Ready to Ship Qty and Qty UOM</label></div>
	<div class="col-md-6">	<input type="text" class="text ui-widget-content ui-corner-all" name="rtsQuantity" id="rtsQuantity" class="text ui-widget-content ui-corner-all" /><g:selectUOM name="quantityUom.id" optionKey="id" value="${orderItem?.quantityUom?.id}" /></div>
	
	</div>
	<div class="row">
	<div class="col-md-6">	<label for="pickupStartDt">Pickup Start Date</label></div>
	<div class="col-md-6">
		<%--<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="pickupStart" id="pickupStartDt" value="${orderItem?.pickupStart}" format="MM/dd/yyyy" />
		</div>--%>
		<input type="text" name="pickupStart" id="pickupStart"	value="${orderItem?.pickupStart }"> 
									<script	type="text/javascript">
										$(function() {
											$('*[name=pickupStart]')
													.datetimepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y H:i'
															});
										});
									</script>
	</div>
	<div class="row">
	<div class="col-md-6">	<label for="pickupEndDt">Pickup End Date</label></div>
	<div class="col-md-6">	
	<input type="text" name="pickupEnd" id="pickupEnd"	value="${orderItem?.pickupEnd }"> 
									<script	type="text/javascript">
										$(function() {
											$('*[name=pickupEnd]')
													.datetimepicker(
															{
																"closeOnSelected" : true,
																"format" : 'm/d/Y H:i'
															});
										});
									</script>
	<%--<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="pickupEnd" id="pickupEndDt" value="${orderItem?.pickupEnd}" format="MM/dd/yyyy" /></div>--%>
	
	</div>
	 </div>
	
          </fieldset>
        </form>
	
	 <script>
	 	
	  <g:remoteFunction controller="message" action="setReceipient" params="{companyId:${(session?.company.type.code==1)?orderInstance.seller.id:orderInstance.company.id}}"/>
	   </script>
	   <div id="dialog-collab" title="Cim Collab">
	   <g:render template="/message/omessages" />
	   </div>
	  <div id="dialog-msgtrail" title="Messages" style="display:none">
 		 	 <g:render template="/message/msgtrail" />
		</div>
	<!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    <g:render template='orderItem' model="['orderItem':null,'i':'_clone','hidden':true]"/>
    <!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
</body>
</div>
</html>