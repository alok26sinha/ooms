  
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <meta name="layout" content="index" />
         <title><warehouse:message code="shipping.enterShipmentDetails.label"/></title>         
    </head>
    <body>
    
<style>
.showShipmentHeader{
	background-color: rgb(80,80,80);
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
width: 9%;
text-align: center;
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
			
	 		<g:if test="${addLocation}">
	 			<g:render template="addLocation" model="['locationInstance':locationInstance]"/>
	 		</g:if>
			
			
           	<g:form action="update" method="post" autocomplete="off">
				
				<%--<g:form role="form" action="update" method="post">
				--%><g:hiddenField name="id" value="${shipmentInstance?.id}"/>
				
					<%--<g:render template="../shipment/summary" />	
					--%><%--<g:render template="flowHeader" model="['currentState':'Details']"/>--%>
					<div class="showShipmentHeader"><label style="color:white"><warehouse:message code="shipping.showShipmentHeader.label"/></label></div>
					<div class="dialog box">
					
               		<table>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipmentNumber','errors')}'>
               							<label for='shipmentNumber'><warehouse:message code="shipping.shipmentNum.label"/></label>
               				</td><td>			
										<input type="text" name='shipmentNumber' value="${shipmentInstance?.shipmentNumber?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'status','errors')}'>
               							<label for='status'><warehouse:message code="shipping.status.label"/></label>
               							</td><td>
										<input type="text" name='shipmentStatus' value="${shipmentInstance?.status?.name}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'masterBOL','errors')}'>
               							<label for='masterBOL'><warehouse:message code="shipping.masterBOL.label"/></label>
               							</td><td>
										<input type="text" name='masterBOL' value="${shipmentInstance?.masterBOL?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'businessUnit','errors')}'>
               							<label for='businessUnit'><warehouse:message code="shipping.businessUnit.label"/></label>
               							</td><td>
										<input type="text" name='businessUnit' value="${shipmentInstance?.businessUnit?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'transResp','errors')}'>
               							<label for='transResp'><warehouse:message code="shipping.transResp.label"/></label>
               							</td><td>
										<input type="text" name='transResp' value="${shipmentInstance?.transResp?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrier','errors')}'>
               							<label for='carrier'><warehouse:message code="shipping.carrier.label"/></label>
               							</td><td>
										<input type="text" name='carrier' value="${shipmentInstance?.carrier?.firstName?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pos','errors')}'>
               							<label for='pos'><warehouse:message code="shipping.pos.label"/></label>
               							</td><td>
										<input type="text" name='pos' value="${shipmentInstance?.pos?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'cos','errors')}'>
               							<label for='name'><warehouse:message code="shipping.cos.label"/></label>
               							</td><td>
										<input type="text" name='name' value="${shipmentInstance?.cos?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'booking','errors')}'>
               							<label for='tos'><warehouse:message code="shipping.tos.label" default="Booking Number"/></label>
               							</td><td>
										 <g:link action="show" id="${shipmentInstance?.booking?.id?.encodeAsHTML()}">
                            				${shipmentInstance?.booking?.bookingNumber}
                           				 </g:link>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'origin','errors')}'>
               							<label for='origin'><warehouse:message code="shipping.shipfrom.label"/></label>
               							</td><td>
               							<input type="text" name='origin.id' value="${shipmentInstance?.origin?.name}" size="25" readonly="readonly"/>
										<%--<g:select name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.id}"  readonly="readonly"/>
						--%></td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'destination','errors')}'>
               							<label for='destination'><warehouse:message code="shipping.shipto.label"/></label>
               							</td><td>
               							<input type="text" name='origin.id' value="${shipmentInstance?.destination?.name}" size="25" readonly="readonly"/>
										 <%--<g:select name="destination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.destination?.id}" readonly="readonly" />--%>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'billTo','errors')}'>
               							<label for='billTo'><warehouse:message code="shipping.billto.label"/></label>
               							</td><td>
										<input type="text" name='billTo' value="${shipmentInstance?.billTo?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'productClass','errors')}'>
               							<label for='productClass'><warehouse:message code="shipping.productClass.label"/></label>
               							</td><td>
										<input type="text" name='productClass' value="${shipmentInstance?.productClass?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tempCtrl','errors')}'>
               							<label for='tempCtrl'><warehouse:message code="shipping.tempCtrl.label"/></label>
               							</td><td>
										<input type="text" name='tempCtrl' value="${shipmentInstance?.tempCtrl?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'isPerish','errors')}'>
               							<label for='isPerish'><warehouse:message code="shipping.isPerish.label"/></label>
               							</td><td>
										<input type="text" name='isPerish' value="${shipmentInstance?.isPerish?.encodeAsHTML()}" size="25" readonly="readonly" />
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'equipment','errors')}'>
               							<label for='equipment'><warehouse:message code="shipping.equipment.label"/></label>
               							</td><td>
										<input type="text" name='equipment' value="${shipmentInstance?.equipment?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'trailerId','errors')}'>
               							<label for='trailerId'><warehouse:message code="shipping.trailerId.label"/></label>
               							</td><td>
										<input type="text" name='trailerId' value="${shipmentInstance?.trailerId?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tractorId','errors')}'>
               							<label for='tractorId'><warehouse:message code="shipping.tractorId.label"/></label>
               							</td><td>
										<input type="text" name='tractorId' value="${shipmentInstance?.tractorId?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'sealNumber','errors')}'>
               							<label for='sealNumber'><warehouse:message code="shipping.sealNo.label"/></label>
               							</td><td>
										<input type="text" name='sealNumber' value="${shipmentInstance?.sealNumber?.encodeAsHTML()}" size="25" readonly="readonly" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'mode','errors')}'>
               							<label for='mode'><warehouse:message code="shipping.mode.label"/></label>
               							</td><td>
										<input type="text" name='mode' value="${shipmentInstance?.mode?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipper','errors')}'>
               							<label for='shipper'><warehouse:message code="shipping.shipper.label"/></label>
               							</td><td>
										<input type="text" name='shipper' value="${shipmentInstance?.shipper?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'seller','errors')}'>
               							<label for='seller'><warehouse:message code="shipping.seller.label"/></label>
               							</td><td>
										<input type="text" name='seller' value="${shipmentInstance?.seller?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'payMethod','errors')}'>
               							<label for='payMethod'><warehouse:message code="shipping.paymethod.label"/></label>
               							</td><td>
										<input type="text" name='payMethod' value="${shipmentInstance?.payMethod?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipmentPrice','errors')}'>
               							<label for='shipmentPrice'><warehouse:message code="shipping.shipmentPrice.label"/></label>
               							</td><td>
										<input type="text" name='shipmentPrice' value="${shipmentInstance?.shipmentPrice?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrierPrice','errors')}'>
               							<label for='carrierPrice'><warehouse:message code="shipping.carrierPrice.label"/></label>
               							</td><td>
										<input type="text" name='carrierPrice' value="${shipmentInstance?.carrierPrice?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupStart','errors')}'>
               							<label for='pickupStart'><warehouse:message code="shipping.pickupStart.label"/></label>
               							</td><td>
										<input type="text" name='pickupStart' value="${shipmentInstance?.pickupStart?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupEnd','errors')}'>
               							<label for='pickupEnd'><warehouse:message code="shipping.pickupEnd.label"/></label>
               							</td><td>
										<input type="text" name='pickupEnd' value="${shipmentInstance?.pickupEnd?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'expectedShippingDate','errors')}'>
               							<label for='expectedShippingDate'><warehouse:message code="shipping.deliveryStart.label"/></label>
               							</td>
               							<td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'expectedShippingDate', 'errors')}">
               							<input type="text" name='pickupEnd' value="${shipmentInstance?.expectedShippingDate?.encodeAsHTML()}" size="25" readonly="readonly"/>
               							</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'expectedDeliveryDate','errors')}'>
               							<label for='expectedDeliveryDate'><warehouse:message code="shipping.deliveryEnd.label"/></label>
               							</td>
               							<td valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'expectedDeliveryDate', 'errors')}">
               							<input type="text" name='pickupEnd' value="${shipmentInstance?.expectedDeliveryDate?.encodeAsHTML()}" size="25" readonly="readonly"/>
               						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfDeparture','errors')}'>
               							<label for='timeOfDeparture'><warehouse:message code="shipping.timeOfDepart.label"/></label>
               							</td><td>
										<input type="text" name='timeOfDeparture' value="${shipmentInstance?.timeOfDeparture?.encodeAsHTML()}" size="25" readonly="readonly" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfArrival','errors')}'>
               							<label for='timeOfArrival'><warehouse:message code="shipping.timeOfArr.label"/></label>
               							</td><td>
										<input type="text" name='timeOfArrival' value="${shipmentInstance?.timeOfArrival?.encodeAsHTML()}" size="25" readonly="readonly"/>
						</td>
               			
               		</tr>
               		<tr>
               			<td>
               							<label for='name'><warehouse:message code="shipping.size.label"/></label>
               							</td>
               			
               			
               		</tr>
               		</table>
               <div valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentSizes', 'errors')}">
		       <!-- Render the shipmentSizes template (_shipmentSizes.gsp) here -->
		       <g:render template="../shipment/shipmentSizes" model="['shipmentInstance':shipmentInstance]" />
		       <!-- Render the shipmentSizes template (_shipmentSizes.gsp) here -->
		   </div>
               		<div style="font-weight:bold;font-size:16px;color:gray;"><label for='lineitems'><warehouse:message code="default.tolineitems.label" default="Line Items"/></label></div>
						<table>										
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label for="orderItems"><g:message code="orderItem.Item.label" default="Item" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName"><warehouse:message code="orderItem.productClass.label" default="Poduct Class" /></label>
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
							
							</tr> 
							</table>
               				<table>
						  		<tr valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'transportaitonOrders', 'errors')}">
							       <!-- Render the transportation order template (_transportationOrders.gsp) here -->
							       <g:render template="../transportationOrder/transportationOrders" model="['shipmentInstance':shipmentInstance]" />
							       <!-- Render the transportation order template (_transportationOrders.gsp) here -->
							   	</tr></table>
			                 
		               
            <div class="action-menu" style="float:right">
												<g:render template="../shipment/actionsEdit" model="[shipmentInstance:shipmentInstance]"/>
											</div> </g:form>
        </div>
        
        
        <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it -->
    <g:render template='../shipment/shipmentSize' model="['shipmentSizes':null,'i':'_clone','hidden':true]"/>
    <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it -->
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it -->
    <g:render template='../transportationOrder/transportationOrder' model="['transportationOrders':null,'i':'_clone','hidden':true]"/>
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it -->
    </body>
</html>
