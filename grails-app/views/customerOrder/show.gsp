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
border: 2px solid white !important;
width:6%;
text-align: center;
color:white !important;

}
.dtl-header label{
color:white !important;
}
.dtl-header-small {
background-color: cornflowerblue;
border: 2px solid white !important;
width: 2.5%;
text-align: center;
color:white !important;
vertical-align: top;

}
.dtl {
background-color: white;
border: 3px solid white !important;
width: 6.9%;
text-align: center;
float:left;

}
.dtl-small {
background-color: white;
border: 3px solid white !important;
width: 2.95%;
text-align: center;
float:left;

}
.dtl-rts{
background-color: white;
border: 2px solid white !important;
width: 13.90%;
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
	<%--<div style="float:left;"><g:render template="chat" model="[customerOrderInstance:order]"/></div>
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
		<g:form role="form" action="update" method="post">
		
		<div class="poheader"><label style="color:white"><warehouse:message code="order.showpo.label" default="Purchase Order Details"/></label></div>
			<div class="dialog">
			
				<fieldset>
            		<table>
						<tbody>
						<tr>
						<td style="text-align:right"><label for='orderNumber'><warehouse:message code="default.orderNumber.label"/></label></td>
						<td><input type="text" readonly="readonly"  name='orderNumber' value="${customerOrderInstance?.orderNumber?.encodeAsHTML()}" size="25" readonly="readonly"/></td>
						<td style="text-align:right"><label for='bu'><warehouse:message code="order.bu.label" default="BU"/></label></td>
						<td><g:selectBU disabled="true" name="bu" optionKey="bu" value="${order?.bu}" />
						<td style="text-align:right"><label for='status'><warehouse:message code="order.status.label"/></label></td>
						<td><input type="text" readonly="readonly"  name='status' value="${customerOrderInstance?.status}"  size="25" readonly="readonly"/></td>
						
						</tr>
						<tr>
								<td style=""><label for='dateOrdered'><warehouse:message
											code="order.orderedOn.label" /></label></td>
								<td >
								<input type="text" readonly="readonly" name="dateOrdered" id="dateOrdered" value="${customerOrderInstance?.dateOrdered }">
								<%--<g:jqueryDatePicker readOnly="true" readOnly="true" cssClass="disabled" id="dateOrdered" name="dateOrdered"
										value="${customerOrderInstance?.dateOrdered }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />
										--%></td>
								<td style=""><label for='dueDate'><warehouse:message
											code="order.duedate.label" />&nbsp;&nbsp;</label></td>
								<td>
								<input type="text" readonly="readonly" name="dueDate" id="dueDate" value="${customerOrderInstance?.dueDate }">
								<%--<g:jqueryDatePicker readOnly="true" id="duedate" name="dueDate"
										value="${customerOrderInstance?.dueDate }" format="MM/dd/yyyy"
										size="25" showTrigger="false" />
										--%></td>
								
								<td style=""><label for='via'><warehouse:message
											code="order.seller.label" default="Seller" /></label></td>
								<td><g:autoSuggest id="seller" name="seller"
										jsonUrl="${request.contextPath }/json/vendorLookup"
										valueId="${customerOrderInstance?.seller?.id }"
										valueName="${customerOrderInstance?.seller?.companyName }"
										styleClass="text disabled" width="175" /></td>
							</tr>

							<tr>
								<td style=""><label for='transportation'><warehouse:message
											code="order.transportation.label" /></label></td>
								<td><g:selectTR disabled="true" name="transResp.id" optionKey="id"
										value="${customerOrderInstance?.transResp?.id}" /></td>
								<td style=""><label for='incoterms'><warehouse:message
											code="order.incoterms.label" /></label></td>
								<td><g:selectIncoterm disabled="true" name="incoterm.id" optionKey="id"
										value="${customerOrderInstance?.incoterm?.id}" /></td>
								<td style=""><label for='billTo'><warehouse:message
											code="order.billTo.label" /></label></td>
								<td><g:autoSuggest id="billTo" name="billTo"
										jsonUrl="${request.contextPath }/json/companyLookup"
										valueId="${customerOrderInstance?.billTo?.id }"
										valueName="${customerOrderInstance?.billTo?.companyName }"
										styleClass="text disabled" width="175" /></td>
							</tr>
							<tr>
								<td style=""><label for='shipmentType'><warehouse:message
											code="order.shipmentType.label" /></label></td>
								<td><g:selectMOT disabled="true" name="mot.id" optionKey="id"
										value="${customerOrderInstance?.mot?.id}" /></td>
								<td style=""><label for='carrier'>Designated
										Carrier</label></td>
								<td><g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${customerOrderInstance?.carrier?.id }"
										valueName="${customerOrderInstance?.carrier?.companyName }"
										styleClass="text disabled" width="175" /></td>
								<td style=""><label for='mst'><warehouse:message
											code="order.mst.label" default="Must Ship Together" /></label></td>
								<td><g:checkBox disabled="true" name="mst"
										value="${customerOrderInstance?.mst}" /></td>
							</tr>
							

						</tbody>
					</table>

					<br>
					<table>
						<tr>

							<td style="width: 21.5%"><label for='contentdescription'><warehouse:message
										code="default.contentdescription.label" /></label></td>
							<td><input type="text" readonly="readonly"  name='contentDescription'
								value="${customerOrderInstance?.contentDescription?.encodeAsHTML()}"
								size="80" /></td>
						</tr>
					</table>
						<br/>
					<table>
						<tr style="width: 100%">
							<td style="width: 50%"><label
								style="font-weight: bold; font-size: 16px; color: gray;"><b>Origin</b></label>
								<table style="border: 1px solid lightgrey">
									<tr>
										<td style=""><label for='origin'><warehouse:message
													code="order.origin.label" default="Ship From" /></label></td>
										<td>
											<%--<g:selectOrderSupplier name="origin.id" optionKey="id" value="${customerOrderInstance?.origin?.id}" noSelection="['':'-Choose origin location-']"/>
										--%> <span id="origin-span" class="span"
											style="text-align: left; display: none;"></span> <input
											id="origin-value" class="value" type="hidden" value="1"
											name="origin.id"> <input id="fromAddress.id"
											class="value" type="hidden" value="" name="fromAddress.id">
											<span class="ui-helper-hidden-accessible" role="status"
											aria-live="polite">1</span> <input id="origin-suggest"
											class="autocomplete text ui-autocomplete-input" type="text" readonly="readonly" 
											style="width: 175px; display: inline;" value="${customerOrderInstance?.origin?.name}"
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
											value="${customerOrderInstance?.fromAddress?.address?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>City</label></td>
										<td><input type="text" readonly="readonly"  id='fromAddress.city'
											name='fromAddress.city'
											value="${customerOrderInstance?.fromAddress?.city?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='city'>County</label></td>
										<td><input type="text" readonly="readonly"  name='fromAddress.county'
											value="${customerOrderInstance?.fromAddress?.county?.encodeAsHTML()}" />
									</tr>
									<tr>
										<td style=""><label for='state'>State/Province</label></td>
										<td><g:selectSTATE disabled="true" optionKey="id"
												name="fromAddress.stateOrProvince.id"
												value="${customerOrderInstance?.fromAddress?.stateOrProvince}" /> <input
											style="display: none;" id="fromAddress.stateOrProvince"
											type="text" readonly="readonly"  name="fromAddress.stateOrProvince.id"
											value="${customerOrderInstance?.fromAddress?.stateOrProvince}" /></td>
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
												value="${customerOrderInstance?.fromAddress?.country}" default="usa" />
									</tr>
									<tr>
										<td style=""><label>Pickup Start</label></td>
										<td>
										<input type="text" readonly="readonly" name="pickupStart" id="pickupStart" value="${customerOrderInstance?.pickupStart }">
										<%--<g:jqueryDatePicker readOnly="true" id="pickupStart"
												name="pickupStart" value="${customerOrderInstance?.pickupStart }"
												format="MM/dd/yyyy" size="25" showTrigger="false" />
												
												--%></td>
									</tr>
									<tr>
										<td style=""><label>Pickup End</label></td>
										<td>
										<input type="text" readonly="readonly" name="pickupEnd" id="pickupEnd" value="${customerOrderInstance?.pickupEnd }">
										<%--<g:jqueryDatePicker readOnly="true" id="pickupEnd" name="pickupEnd"
												value="${customerOrderInstance?.pickupEnd }" format="MM/dd/yyyy"
												size="25" showTrigger="false" />
												--%></td>
								</table></td>
							<td style="width: 50%"><label
								style="font-weight: bold; font-size: 16px; color: gray;"><b>Destination</b></label>
								<table style="border: 1px solid lightgrey">
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
											class="autocomplete text ui-autocomplete-input" type="text" readonly="readonly" 
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
									<td><input type="text" readonly="readonly"  name='toAddress.address' id='toAddress.address' value="${customerOrderInstance?.toAddress?.address?.encodeAsHTML()}"/>
									</tr>
									<tr>
									<td style=""><label for='city'>City</label></td>
									<td><input type="text" readonly="readonly"  id='toAddress.city' name='toAddress.city' value="${customerOrderInstance?.toAddress?.city?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='city'>County</label></td>
									<td><input type="text" readonly="readonly"  name='toAddress.county' value="${customerOrderInstance?.toAddress?.county?.encodeAsHTML()}"/>
								
									</tr>
									<tr>
									<td style=""><label for='state'>State/Province</label></td>
									<td><g:selectSTATE disabled="true" optionKey="id" name="toAddress.stateOrProvince.id"  value="${customerOrderInstance?.toAddress?.stateOrProvince}" />
									<input style="display:none;" id="toAddress.stateOrProvince" type="text" readonly="readonly"  name="toAddress.stateOrProvince.id"  value="${customerOrderInstance?.toAddress?.stateOrProvince}" />
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
									<g:countrySelect disabled="true" id="toAddress.country" name="toAddress.country" value="${customerOrderInstance?.toAddress?.country}"
                 						default="usa"/>
								
									</tr>
									<tr>
									<td style=""><label>Delivery Start</label></td>
									<td>
									<input type="text" readonly="readonly" name="deliveryStart" id="deliveryStart" value="${customerOrderInstance?.deliveryStart }">
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
										<input type="text" readonly="readonly" name="deliveryEnd" id="deliveryEnd" value="${customerOrderInstance?.deliveryEnd }">
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
						<div style="font-weight:bold;font-size:16px;color:gray;"><label for='lineitems'><warehouse:message code="default.lineitems.label" default="Line Items"/></label></div>
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
		       <g:render template="orderItemsShow" model="['customerOrderInstance':customerOrderInstance]" />
		       <!-- Render the orderItems template (_orderItems.gsp) here -->
		   </tr>
			
	                        
		                        
						</table>
						
						</div>
							
						<table>
						<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="action-menu" style="float:right">
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
	      </fieldset>
        </form>
	</div>
	<!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
    <g:render template='orderItem' model="['orderItem':null,'i':'_clone','hidden':true]"/>
    <!-- Render the orderItem template (_orderItem.gsp) hidden so we can clone it -->
</body>
</div>
</html>