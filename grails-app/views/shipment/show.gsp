<%@ page import="com.cimbidia.wm.shipment.ShipmentService" %>
<%
    def shipmentService = grailsApplication.classLoader.loadClass('com.cimbidia.wm.shipment.ShipmentService').newInstance()
%>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="index" />
         <title><warehouse:message code="shipping.enterShipmentDetails.label"/></title>         
    </head>
    <body>
    
<style>
.editShipmentHeader{
	
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
border: 2px solid white !important;

text-align: center;
color:white !important;

}
.dtl-header1{
background-color: cornflowerblue;
border: 2px solid white !important;

text-align: center;
color:white !important;

}
.dtl-header1 label{
color:white !important;
}
.dtl-header label{
color:white !important;
}
.dtl {
background-color: white;
border: 2px solid white !important;
width: 8.50%;
text-align: center;
float:left;
margin-left: 0.1%;
}
.dtl-rts{
background-color: white;
border: 4px solid white !important;
width: 11.7%;
text-align: center;
float:left;
margin-left: 0.1%;
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

.ui-widget-header .ui-icon {
    background-image: url('${resource(dir: "images", file: "ui-icons_ffffff_256x240.png")}') !important;
}
</style>
        <div class="body">
        
			<g:if test="${message}">
				<div class="message">${message}</div>
			</g:if>   
			<g:hasErrors bean="${shipmentInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipmentInstance}" as="list" />
	            </div>				
			</g:hasErrors>
			<g:form action="update" method="post" autocomplete="off">
				
				<%--<g:form role="form" action="update" method="post">
				--%><%--<g:render template="../shipment/summary" />	
					--%><%--<g:render template="flowHeader" model="['currentState':'Details']"/>--%>
					<div class="editShipmentHeader"><label style="color:white"><warehouse:message code="shipping.editShipmentHeader.label"/></label></div>
					<div class="dialog box">
					<g:hiddenField name='id' value="${shipmentInstance?.id?.encodeAsHTML()}"/>
               		<table>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipmentNumber','errors')}'>
               							<label for='shipmentNumber'><warehouse:message code="shipping.shipmentNum.label"/></label>
               				</td><td>			
										<input type="text" name='shipmentNumber' value="${shipmentInstance?.shipmentNumber?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'status','errors')}'>
               							<label for='status'><warehouse:message code="shipping.status.label"/></label>
               							</td><td>
										<input type="text" name='shipStatus' value="${shipmentInstance?.shipStatus?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'masterBOL','errors')}'>
               							<label for='masterBOL'><warehouse:message code="shipping.masterBOL.label"/></label>
               							</td><td>
										<input type="text" name='masterBOL' value="${shipmentInstance?.masterBOL?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'businessUnit','errors')}'>
               							<label for='businessUnit'><warehouse:message code="shipping.businessUnit.label"/></label>
               							</td><td>
										<g:selectBU name="businessUnit.id" optionKey="id" 	value="${shipmentInstance?.businessUnit?.id}" disabled="true"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'transResp','errors')}'>
               							<label for='transResp'><warehouse:message code="shipping.transResp.label"/></label>
               							</td><td>
               							<g:selectTR name="transResp.id" optionKey="id"
										value="${shipmentInstance?.transResp?.id}" disabled="true"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrier','errors')}'>
               							<label for='carrier'><warehouse:message code="shipping.carrier.label"/></label>
               							</td><td>
               							<g:autoSuggest id="carrierCompany" name="carrierCompany"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${shipmentInstance?.carrierCompany?.id }"
										valueName="${shipmentInstance?.carrierCompany?.companyName }"
										 width="175" styleClass="text disabled"/>
										
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pos','errors')}'>
               							<label for='pos'><warehouse:message code="shipping.pos.label"/></label>
               							</td>
               							<td>
               							<g:each var="to" in="${shipmentInstance.getUniquePOs()}" status="i">
               							<g:if test="${to.poId != null}">
               							<g:if test="${shipmentInstance.getUniquePOs().size()-1 == i}">
               							 <g:link controller="order" params="[id='${to.poId}']" action="show" id="${to.poId}"><label>${to?.poNumber}</label></g:link>
										</g:if>
										<g:elseif test="${shipmentInstance.getUniquePOs().size()-1 != i}">
										<g:link controller="order" params="[id='${to.poId}']" action="show" id="${to.poId}"><label>${to?.poNumber}</label></g:link>
										</g:elseif>
										</g:if>
										<g:elseif test="${to.poId == null}">
										<label>${to?.poNumber}</label>
										</g:elseif>
               							</g:each>
               							</td>
               							<%--<td>
										<input type="text" name='pos' value="${shipmentInstance?.pos?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			--%><%--<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'cos','errors')}'>
               							<label for='name'><warehouse:message code="shipping.cos.label"/></label>
               							</td><td>
										<input type="text" name='cos' value="${shipmentInstance?.cos?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tos','errors')}'>
               							<label for='tos'><warehouse:message code="shipping.tos.label"/></label>
               							</td><td>
										<input type="text" name='tos' value="${shipmentInstance?.tos?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               		--%></tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'origin','errors')}'>
               							<%--<label for='origin'><warehouse:message code="shipping.shipfrom.label"/></label>
               							--%></td><td>
										<%--<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.id}"  />
						--%></td>
               			<td valign='top' style="">
               							</td><td>
									</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'billTo','errors')}'>
               							<label for='billTo'><warehouse:message code="shipping.billto.label"/></label>
               							</td><td>
               							<g:autoSuggest id="billTo" name="billTo"
										jsonUrl="${request.contextPath }/json/companyLookup"
										valueId="${shipmentInstance?.billTo?.id }"
										valueName="${shipmentInstance?.billTo?.companyName }"
										styleClass="text" width="175" styleClass="text disabled"/>
										
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'productClass','errors')}'>
               							<label for='productClass'><warehouse:message code="shipping.productClass.label"/></label>
               							</td><td>
               							<%--<g:selectPC name="pc.id" optionKey="id"
										value="${shipmentInstance?.pc?.id}" />
										--%>
										<g:selectPC name="pc.id" optionKey="id"
										value="${shipmentInstance?.pc?.id}" disabled="true"/>
										<%--<input type="text" name='productClass' value="${shipmentInstance?.productClass?.encodeAsHTML()}" size="22" readonly="readonly"/>
						--%></td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tempCtrl','errors')}'>
               							<label for='tempCtrl'><warehouse:message code="shipping.tempCtrl.label"/></label>
               							</td><td>
										<input type="text" name='tempCtrl' value="${shipmentInstance?.tempCtrl?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'isPerish','errors')}'>
               							<label for='isPerish'><warehouse:message code="shipping.isPerish.label"/></label>
               							</td><td>
										<input type="text" name='isPerish' value="${shipmentInstance?.isPerish?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'equipment','errors')}'>
               							<label for='equipment'><warehouse:message code="shipping.equipment.label"/></label>
               							</td><td>
               							<g:selectEQUIP name="equipment" optionKey="id"
										value="${shipmentInstance?.equipment}" disabled="true"/>
										<%--<input type="text" name='equipment' value="${shipmentInstance?.equipment?.encodeAsHTML()}" size="22" />
						--%></td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'trailerId','errors')}'>
               							<label for='trailerId'><warehouse:message code="shipping.trailerId.label"/></label>
               							</td><td>
										<input type="text" name='trailerId' value="${shipmentInstance?.trailerId?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tractorId','errors')}'>
               							<label for='tractorId'><warehouse:message code="shipping.tractorId.label"/></label>
               							</td><td>
										<input type="text" name='tractorId' value="${shipmentInstance?.tractorId?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'sealNumber','errors')}'>
               							<label for='sealNumber'><warehouse:message code="shipping.sealNo.label"/></label>
               							</td><td>
										<input type="text" name='sealNumber' value="${shipmentInstance?.sealNumber?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'mode','errors')}'>
               							<label for='mode'><warehouse:message code="shipping.mode.label"/></label>
               							</td><td>
               							<g:selectMOT name="mot.id" optionKey="id"
										value="${shipmentInstance?.mot?.id}" disabled="true"/>
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipper','errors')}'>
               							<%--<label for='shipper'><warehouse:message code="shipping.shipper.label"/></label>
               							--%></td><td>
										<%--<input type="text" name='shipper' value="${shipmentInstance?.shipper?.encodeAsHTML()}" size="22"/>
						--%></td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'seller','errors')}'>
               							<label for='seller'><warehouse:message code="shipping.seller.label"/></label>
               							</td><td>
               							<g:autoSuggest id="seller" name="seller"
										jsonUrl="${request.contextPath }/json/vendorLookup"
										valueId="${shipmentInstance?.seller?.id }"
										valueName="${shipmentInstance?.seller?.companyName }"
										styleClass="text" width="175" styleClass="text disabled"/>
										<%--<input type="text" name='seller' value="${shipmentInstance?.seller?.encodeAsHTML()}" size="22" />
						--%></td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'payMethod','errors')}'>
               							<label for='payMethod'><warehouse:message code="shipping.paymethod.label"/></label>
               							</td><td>
										<input type="text" name='payMethod' value="${shipmentInstance?.payMethod?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipmentPrice','errors')}'>
               							<label for='shipmentPrice'><warehouse:message code="shipping.shipmentPrice.label"/></label>
               							</td><td>
										<input type="text" name='shipmentPrice' value="${shipmentInstance?.shipmentPrice?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrierPrice','errors')}'>
               							<label for='carrierPrice'><warehouse:message code="shipping.carrierPrice.label"/></label>
               							</td><td>
										<input type="text" name='carrierPrice' value="${shipmentInstance?.carrierPrice?.encodeAsHTML()}" size="22" readonly="readonly"/>
						</td>
               			
               		</tr>
               		<tr>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'origin','errors')}'>
               							<label for='origin'><warehouse:message code="shipping.shipfrom.label"/></label>
               							
										<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.id?.encodeAsHTML()}"  disabled="true"/>
					</td>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupStart','errors')}'>
               							<label for='pickupStart'><warehouse:message code="shipping.pickupStart.label"/></label>
               							<jqueryPicker:time name="pickupStart" value="${shipmentInstance?.pickupStart}" readonly="true"/>
						</td>
						
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupEnd','errors')}'>
               							<label for='pickupEnd'><warehouse:message code="shipping.pickupEnd.label"/></label>
               							<jqueryPicker:time name="pickupEnd" value="${shipmentInstance?.pickupEnd}" readonly="true"/>
						</td>
						
						<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfDeparture','errors')}'>
               							<label for='timeOfDeparture'><warehouse:message code="shipping.timeOfDepart.label"/></label>
               							<jqueryPicker:time name="expectedShippingDate" value="${shipmentInstance?.expectedShippingDate}" readonly="true"/>
               			</td>
               			<td></td>
               			<td></td>
               		</tr>
               		<tr>
               		<td>
               		<div>
		       		
		   			</div></td>
               		</tr>
               		<tr>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipDestination','errors')}'>
               							<label for='shipDestination'><warehouse:message code="shipping.shipto.label"/></label>
               							<g:select name="shipDestination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.shipDestination?.id?.encodeAsHTML()}"  disabled="true"/>
						</td>
						<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'deliveryStart','errors')}'>
               							<label for='deliveryStart'><warehouse:message code="shipping.deliveryStart.label"/></label>
               							<jqueryPicker:time name="deliveryStart" value="${shipmentInstance?.deliveryStart}" readonly="true"/>
	                    </td>
	                    
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'deliveryEnd','errors')}'>
               							<label for='deliveryEnd'><warehouse:message code="shipping.deliveryEnd.label"/></label>
               							<jqueryPicker:time name="deliveryEnd" value="${shipmentInstance?.deliveryEnd}" readonly="true"/>
	                    </td>
	                    
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfArrival','errors')}'>
               							<label for='timeOfArrival'><warehouse:message code="shipping.timeOfArr.label"/></label>
               							<jqueryPicker:time name="expectedDeliveryDate" value="${shipmentInstance?.expectedDeliveryDate}" readonly="true"/>
               			</td>
               			<td></td>
               			<td></td>
               		</tr>
               		
               		<%--<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupStart','errors')}'>
               							<label for='pickupStart'><warehouse:message code="shipping.pickupStart.label"/></label>
               							</td><td>
										<input type="text" name='pickupStart' value="${shipmentInstance?.pickupStart?.encodeAsHTML()}" size="22"/>
										<g:jqueryDatePicker 
										id="pickupStart" 
										name="pickupStart" 
										value="${shipmentInstance?.pickupStart}" 
										format="MM/dd/yyyy"
										size="22"
										showTrigger="false" noSelection="['': '']" />
						
								<jqueryPicker:date name="pickupStartDate" value="${shipmentInstance?.pickupStart}" />
								<jqueryPicker:time name="pickupStart" value="${shipmentInstance?.pickupStart}" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupEnd','errors')}'>
               							<label for='pickupEnd'><warehouse:message code="shipping.pickupEnd.label"/></label>
               							</td><td>
										<input type="text" name='pickupEnd' value="${shipmentInstance?.pickupEnd?.encodeAsHTML()}" size="22"/>
										<g:jqueryDatePicker 
										id="pickupEnd" 
										name="pickupEnd" 
										value="${shipmentInstance?.pickupEnd}" 
										format="MM/dd/yyyy"
										size="22"
										showTrigger="false" noSelection="['': '']" />
										<jqueryPicker:time name="pickupEnd" value="${shipmentInstance?.pickupEnd}" />
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'expectedShippingDate','errors')}'>
               							<label for='expectedShippingDate'><warehouse:message code="shipping.deliveryStart.label"/></label>
               							</td>
               							<td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'expectedShippingDate', 'errors')}">
               							<%--<g:jqueryDatePicker 
										id="expectedShippingDate" 
										name="expectedShippingDate" 
										value="${shipmentInstance?.expectedShippingDate}" 
										format="MM/dd/yyyy"
										size="22"
										showTrigger="false" noSelection="['': '']" />
	                                   <jqueryPicker:time name="expectedShippingDate" value="${shipmentInstance?.expectedShippingDate}" />
	                                    </td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'expectedDeliveryDate','errors')}'>
               							<label for='expectedDeliveryDate'><warehouse:message code="shipping.deliveryEnd.label"/></label>
               							</td>
               							<td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'expectedDeliveryDate', 'errors')}">
               							<%--<g:jqueryDatePicker 
										id="expectedDeliveryDate" 
										name="expectedDeliveryDate" 
										value="${shipmentInstance?.expectedDeliveryDate}" 
										format="MM/dd/yyyy"
										size="22"
										showTrigger="false" noSelection="['': '']" />
	                                    <jqueryPicker:time name="expectedDeliveryDate" value="${shipmentInstance?.expectedDeliveryDate}" />
	                                </td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfDeparture','errors')}'>
               							<label for='timeOfDeparture'><warehouse:message code="shipping.timeOfDepart.label"/></label>
               							</td><td>
               							<input type="text" name='timeOfDeparture' value="${shipmentInstance?.timeOfDeparture?.encodeAsHTML()}" size="22" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfArrival','errors')}'>
               							<label for='timeOfArrival'><warehouse:message code="shipping.timeOfArr.label"/></label>
               							</td><td>
               							<input type="text" name='timeOfArrival' value="${shipmentInstance?.timeOfArrival?.encodeAsHTML()}" size="22" />
						</td>
               			
               		</tr>--%>
               		<tr>
               			<td>
               							<label for='name'><warehouse:message code="shipping.size.label"/></label>
               							</td>
               			
               			
               		</tr>
               		</table>
               <div valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentSizes', 'errors')}">
		       <!-- Render the shipmentSizes template (_shipmentSizes.gsp) here -->
		       <g:render template="shipmentSizes" model="['shipmentInstance':shipmentInstance]" />
		       <!-- Render the shipmentSizes template (_shipmentSizes.gsp) here-->
		   </div>
               		<div style="font-weight:bold;font-size:16px;color:gray;"><label for='lineitems'><warehouse:message code="default.tolineitems.label" default="Line Items"/></label></div>
						<table>										
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label for="orderItems"><g:message code="orderItem.Item.label" default="Item" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName"><warehouse:message code="to.productClass.label" default="Product Class" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDesc"><warehouse:message code="orderItem.itemDesc.label" default="Item Description" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Quantity"><warehouse:message code="orderItem.Quantity.label" default="Quantity" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="uom"><warehouse:message code="orderItem.uom.label" default="UOM" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="totalValue"><warehouse:message code="to.totalValue.label" default="Total Value" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="tempCtrl"><warehouse:message code="orderItem.tempCtrl.label" default="Temp. Control" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="perishable"><warehouse:message code="to.isPerishable.label" default="Is Pesishable"/></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="sizes"><warehouse:message code="to.sizes.label" default="Sizes" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemdetail"><warehouse:message code="to.itemDetail.label" default="Item Details" /></label>
							</td>
							
							</tr><%-- 
							<g:each var="transportationOrder" in="${shipmentInstance.transportationOrders}" status="i">
							<tr id="transportationOrder${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td><g:textField name='transportationOrder[${i}].orderNumber' value='${transportationOrder?.orderNumber}' readonly="readonly"/></td>
    						</tr>
    						</g:each>
							--%></table>
               				<table>
               				
						  		<tr valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'transportaitonOrders', 'errors')}">
							       <g:if test="${shipmentInstance.transportationOrders.size() != 0}">
							       <!-- Render the transportation order template (_transportationOrders.gsp) here -->
							       <g:render template="../transportationOrder/transportationOrders" model="['shipmentInstance':shipmentInstance]" />
							       <!-- Render the transportation order template (_transportationOrders.gsp) here -->
							   	</g:if>
								<g:elseif test="${shipmentInstance.transportationOrders.size() == 0}"> 
								<td>No Records Found</td>
							</g:elseif>
							   	</tr>
							   	
							   	</table>
			                 <div style="font-weight:bold;font-size:16px;color:gray;"><label><warehouse:message code="shiping.shipmentstops.label" default="Line Items"/></label></div>
		               <table>										
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label><warehouse:message code="shipping.stopno.label" default="Stop No" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.stop.label" default="Stop" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.stopaction.label" default="Stop Action" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.plannedarrival.label" default="Estimated Arrival" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.planneddepart.label" default="Estimated Departure" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.actualarrival.label" default="Actual Arrival" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.actualdepart.label" default="Actual Departure" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.appointment.label" default="Apointment" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.comments.label" default="Comments" /></label>
							</td>
							</tr> 
							<g:if test="${shipmentInstance.shipmentStops.size() != 0}">
							<g:each var="shipmentStop" in="${shipmentInstance.shipmentStops}" status="i">
							<tr id="shipmentStop${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>${shipmentStop?.stopNumber}</td>
							<td>${shipmentStop?.address?.address?.encodeAsHTML()},
    							${shipmentStop?.address?.address2?.encodeAsHTML()},
    							${shipmentStop?.address?.city?.encodeAsHTML()},
    							${shipmentStop?.address?.country?.encodeAsHTML()}</td>
    						<td>${shipmentStop?.stopAction}</td>
    						<td>${shipmentStop?.estdArrival?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${shipmentStop?.estdDeparture?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${shipmentStop?.actualArrival?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${shipmentStop?.actualDeparture?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>
    						<g:if test="${shipmentStop?.apptDate == null}">
								<a onclick=""><label><warehouse:message code="shipping.createappointment.label"/></label></a>
							</g:if>
							<g:elseif test="${shipmentStop.apptDate != null }">
								${shipmentStop?.apptDate?.format('MM/dd/yyyy HH:mm')}
							</g:elseif>
    						
    						</td>
    						<td>${shipmentStop?.comments}</td>
        					</tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${shipmentInstance.shipmentStops.size() == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
							</table>
							
							<div style="font-weight:bold;font-size:16px;color:gray;"><label><warehouse:message code="shiping.trackingMsg.label" default="Line Items"/></label></div>
		               <table>										
						<tr class="prop">
							
						   <td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.carrier.label" default="Carrier" /></label>
							</td>
						   <td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgType.label" default="Message Type" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgDate.label" default="Message Date" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.comments.label" default="Comments" /></label>
							</td>
							
		
							</tr> 
							<g:if test="${shipmentInstance.trackingMsgs?.size() != 0}">
							<g:each var="trackingMsg" in="${shipmentInstance.trackingMsgs}" status="i">
							<tr id="trackingMsg${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>${trackingMsg?.carrier?.companyName}</td>
    						<td>${trackingMsg?.msgType}</td>
    						<td>${trackingMsg?.msgDate.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${trackingMsg?.Comments}</td>
    						
    						
        					</tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${shipmentInstance.trackingMsgs?.size() == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
							</table>
               				<%--<table>
						  		<tr valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentStops', 'errors')}">
							      <!-- Render the addStops template (_addStops.gsp) here -->
		       		<g:render template="addStops" model="['shipmentInstance':shipmentInstance]" />
		       		<!-- Render the addStops template (_addStops.gsp) here -->
							   	</tr></table>
            		<div class="action-menu" style="float:right">
												<g:render template="../shipment/actionsEdit" model="[shipmentInstance:shipmentInstance]"/>
											</div>--%> </g:form>
											
        </div>
        
        
        
    
    
    
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it -->
    <g:render template='../transportationOrder/transportationOrder' model="['transportationOrders':null,'i':'_clone','hidden':true]"/>
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it -->
    <!-- Render the addStop template (_addStop.gsp) hidden so we can clone it -->
    <%--<g:render template='addStop' model="['shipmentStops':null,'i':'_clone','hidden':true]"/>--%>
    <!-- Render the addStop template (_addStop.gsp) hidden so we can clone it -->
    <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it -->
    <g:render template='shipmentSize' model="['shipmentSizes':null,'i':'_clone','hidden':true]"/>
    <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it-->
    </body>
</html>
