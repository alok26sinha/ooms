
<html>
    <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
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
.assignBtn{
	background: linear-gradient(to bottom, #7A9FA6 0%, #9BC0C8 100%) repeat scroll 0 0 rgba(0, 0, 0, 0);
    color: #FFFFFF;
    height: 24px;
    text-transform: uppercase;
    cursor:pointer;
}
</style>
        <div>
        
			<g:if test="${message}">
				<div class="message">${message}</div>
			</g:if>   
			<g:hasErrors bean="${shipmentInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipmentInstance}" as="list" />
	            </div>				
			</g:hasErrors>
			<g:form role="form" action="update" method="post">
				<div class="content_inner"><label class="pagetitle"><warehouse:message code="shipping.editShipmentHeader.label"/></label></div>
				
					<g:hiddenField name='id' value="${shipmentInstance?.id?.encodeAsHTML()}"/>
					<fieldset>
					<div class="right">
					<a href="javascript:void(0);" ><span class="plus">
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
										<input type="text" name='masterBOL' value="${shipmentInstance?.masterBOL?.encodeAsHTML()}" size="22" />
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'businessUnit','errors')}'>
               							<label for='businessUnit'><warehouse:message code="shipping.businessUnit.label"/></label>
               							</td><td>
										<g:selectBU name="businessUnit.id" optionKey="id" 	value="${shipmentInstance?.businessUnit?.id}" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'transResp','errors')}'>
               							<label for='transResp'><warehouse:message code="shipping.transResp.label"/></label>
               							</td><td>
               							<g:selectTR name="transResp.id" optionKey="id"
										value="${shipmentInstance?.transResp?.id}" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrier','errors')}'>
               							<label for='carrier'><warehouse:message code="shipping.carrier.label"/></label>
               							</td><td>
               							<g:autoSuggest id="carrierCompany" name="carrierCompany"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${shipmentInstance?.carrierCompany?.id }"
										valueName="${shipmentInstance?.carrierCompany?.companyName }"
										styleClass="text" width="175" />
										
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
               		<td><label for='pos'>CO#S</label></td>
               		<td>
               							<g:each var="to" in="${shipmentInstance.getUniqueCOs()}" status="i">
               							<g:if test="${to.coId != null}">
               							<g:if test="${shipmentInstance.getUniqueCOs().size()-1 == i}">
               							 <g:link controller="customerOrder" params="[id='${to.coId}']" action="edit" id="${to.coId}"><label>${to?.coNumber}</label></g:link>
										</g:if>
										<g:elseif test="${shipmentInstance.getUniqueCOs().size()-1 != i}">
										<g:link controller="CustomerOrder" params="[id='${to.coId}']" action="edit" id="${to.coId}"><label>${to?.coNumber}</label></g:link>
										</g:elseif>
										</g:if>
										<g:elseif test="${to.coId == null}">
										<label>${to?.coNumber}</label>
										</g:elseif>
               							</g:each>
               							</td>
               							<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'booking','errors')}' >
               								<label for='productClass'>Booking Number</label>
               							</td><td style="color:#000000;">
										 <g:link action="edit" controller="booking" id="${shipmentInstance?.booking?.id?.encodeAsHTML()}">
                            				${shipmentInstance?.booking?.bookingNumber}
                           				 </g:link>
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'origin','errors')}'>
               							</td>
               							<td>
										</td>
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
										styleClass="text" width="175" />
										
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'productClass','errors')}'>
               							<label for='productClass'><warehouse:message code="shipping.productClass.label"/></label>
               							</td><td>
               							<g:selectPC name="pc.id" optionKey="id"
										value="${shipmentInstance?.pc?.id}" />
										</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tempCtrl','errors')}'>
               							<label for='tempCtrl'><warehouse:message code="shipping.tempCtrl.label"/></label>
               							</td><td>
										<input type="text" name='tempCtrl' value="${shipmentInstance?.tempCtrl?.encodeAsHTML()}" size="22"/>
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'isPerish','errors')}'>
               							<label for='isPerish'><warehouse:message code="shipping.isPerish.label"/></label>
               							</td><td>
										<input type="text" name='isPerish' value="${shipmentInstance?.isPerish?.encodeAsHTML()}" size="22" />
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'equipment','errors')}'>
               							<label for='equipment'><warehouse:message code="shipping.equipment.label"/></label>
               							</td><td>
               							<g:selectEQUIP name="equipment" optionKey="id"
										value="${shipmentInstance?.equipment?.id}" noSelection="['':warehouse.message(code:'default.all.label')]" />
										</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'trailerId','errors')}'>
               							<label for='trailerId'><warehouse:message code="shipping.trailerId.label"/></label>
               							</td><td>
										<input type="text" name='trailerId' value="${shipmentInstance?.trailerId?.encodeAsHTML()}" size="22" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'tractorId','errors')}'>
               							<label for='tractorId'><warehouse:message code="shipping.tractorId.label"/></label>
               							</td><td>
										<input type="text" name='tractorId' value="${shipmentInstance?.tractorId?.encodeAsHTML()}" size="22" />
						</td>
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'sealNumber','errors')}'>
               							<label for='sealNumber'><warehouse:message code="shipping.sealNo.label"/></label>
               							</td><td>
										<input type="text" name='sealNumber' value="${shipmentInstance?.sealNumber?.encodeAsHTML()}" size="22" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'mode','errors')}'>
               							<label for='mode'><warehouse:message code="shipping.mode.label"/></label>
               							</td><td>
               							<g:selectMOT name="mot.id" optionKey="id"
										value="${shipmentInstance?.mot?.id}" />
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
										styleClass="text" width="175" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'payMethod','errors')}'>
               							<label for='payMethod'><warehouse:message code="shipping.paymethod.label"/></label>
               							</td><td>
										<input type="text" name='payMethod' value="${shipmentInstance?.payMethod?.encodeAsHTML()}" size="22" />
						</td>
               		</tr>
               		<tr>
               			<td valign='top'>
               							<label for='weight'>Weight(Lbs)</label>
               							</td><td>
										<input type="text" name='weight' value="${shipmentInstance?.weight?.encodeAsHTML()}" size="15" />
						</td>
               			<td valign='top'>
               							<label for='volume'>Volume(Cubic Feet)</label>
               							</td><td>
										<input type="text" name='volume' value="${shipmentInstance?.volume?.encodeAsHTML()}" size="15" />
						</td>
						<td valign='top'>
               							<label for='quantity'>Quantity(Pallets)</label>
               							</td><td>
										<input type="text" name='quantity' value="${shipmentInstance?.quantity?.encodeAsHTML()}" size="15" />
						</td>
               			
               		</tr>
               		<tr>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipmentPrice','errors')}'>
               							<label for='shipmentPrice'><warehouse:message code="shipping.shipmentPrice.label"/></label>
               							</td><td>
										<input type="text" name='shipmentPrice' value="${shipmentInstance?.shipmentPrice?.encodeAsHTML()}" size="22" />
						</td>
               			<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'carrierPrice','errors')}'>
               							<label for='carrierPrice'><warehouse:message code="shipping.carrierPrice.label"/></label>
               							</td><td>
										<input type="text" name='carrierPrice' value="${shipmentInstance?.carrierPrice?.encodeAsHTML()}" size="22" />
						</td>
               			
               		</tr>
               		
               		<tr>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'origin','errors')}'>
               							<label for='origin'><warehouse:message code="shipping.shipfrom.label"/></label>
               							
										<g:select onchange="calcRoute();" id="origin" name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.id?.encodeAsHTML()}"  />
					</td>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupStart','errors')}'>
               							<label for='pickupStart'><warehouse:message code="shipping.pickupStart.label"/></label>
               						         </br>     						
					<input type="text" name="pickupStart" id="pickupStart" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.pickupStart )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
					 </td>
						
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'pickupEnd','errors')}'>
               							<label for='pickupEnd'><warehouse:message code="shipping.pickupEnd.label"/></label>
               							<input type="text" name="pickupEnd" id="pickupEnd" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.pickupEnd )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=pickupEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
						</td>
						
						<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfDeparture','errors')}'>
               							<label for='timeOfDeparture'><warehouse:message code="shipping.timeOfDepart.label"/></label>
               							<input type="text" name="timeOfDeparture" id="timeOfDeparture" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.timeOfDeparture )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=timeOfDeparture]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
               			</td>
               			<td>
               			<%--<div id="content-pane">
     						 <div id="inputs">
        							<p><button type="button" onclick="calculateDistances();">Calculate distances</button></p>
          
          					</div>
      					</div>
               			--%>
               			<label>Distance</label>
               			</td>
               			<td>
          					${shipmentInstance?.distance}&nbsp;&nbsp;&nbsp;K&nbsp;m
          				</td>
               		</tr>
               		<tr>
               		<td>
               		<div>
		       		
		   			</div></td>
               		</tr>
               		<tr>
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'shipDestination','errors')}'>
               							<label for='shipDestination'><warehouse:message code="shipping.shipto.label"/></label></br>
               							<g:select id="destination" onchange="calcRoute();" name="shipDestination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.shipDestination?.id?.encodeAsHTML()}"  />
						</td>
						<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'deliveryStart','errors')}'>
               							<label for='deliveryStart'><warehouse:message code="shipping.deliveryStart.label"/></label></br>
               							<input type="text" name="deliveryStart" id="deliveryStart" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.deliveryStart )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryStart]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
               			</td>
	                    
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'deliveryEnd','errors')}'>
               							<label for='deliveryEnd'><warehouse:message code="shipping.deliveryEnd.label"/></label></br>
               							<input type="text" name="deliveryEnd" id="deliveryEnd" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.deliveryEnd )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=deliveryEnd]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
	                    </td>
	                    
               		<td valign='top' style="" class='value ${hasErrors(bean:shipmentInstance,field:'timeOfArrival','errors')}'>
               							<label for='timeOfArrival'><warehouse:message code="shipping.timeOfArr.label"/></label></br>
               							<input type="text" name="timeOfArrival" id="timeOfArrival" value="${formatDate(format:'MM/dd/yyyy HH:mm', date:shipmentInstance?.timeOfArrival )}">
									<script type="text/javascript">
										$(function(){
										$('*[name=timeOfArrival]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
               			</td>
               			<td>
               			<%--<div id="outputDiv"></div>--%><label>Time</label>
               		</td>
               			<td><%--<div class="dtl-small">
									<a href="javascript:void(0);" id="" class="map"><label>Show Map</label></a>
								</div>--%>
								${shipmentInstance?.time}&nbsp;&nbsp;&nbsp;&nbsp;Hrs
								</td>
               		</tr>
               		
               		
               		<tr>
               			<td>
               							<label  class="section-header" for='name'><warehouse:message code="shipping.size.label"/></label>
               							</td>
               			
               			
               		</tr>
               		</table>
               <div valign="top" class="value ${hasErrors(bean: shipmentInstance, field: 'shipmentSizes', 'errors')}">
               <%-- Render the shipmentSizes template (_shipmentSizes.gsp) here  --%>
               <g:render template="shipmentSizes" model="['shipmentInstance':shipmentInstance]" />
		       <!-- Render the shipmentSizes template (_shipmentSizes.gsp) here-->
		       
		
    
    
		     
		       
		       
		   </div>
               		<%--
						TO Number, Product Class, Weight, Volume, Quantity, PO Number
						--%><table>	
						<tr><td><div>
               		<label  class="section-header" for='lineitems'><warehouse:message code="default.tolineitems.label" default="Line Items"/></label></div></td></tr>									
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label for="orderItems"><g:message code="to.toNumber.label" default="To Number" /></label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName"><warehouse:message code="to.productClass.label" default="Product Class" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDesc"><warehouse:message code="to.weight.label" default="Weight" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Quantity"><warehouse:message code="to.volume.label" default="Volume" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="uom"><warehouse:message code="to.quantity.label" default="Quantity" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="totalValue"><warehouse:message code="to.poNumber.label" default="Po Number" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="coNumber"><warehouse:message code="to.coNumber.label" default="Co Number" /></label>
							</td>
							</tr>
							<g:if test="${shipmentInstance.transportationOrders?.size() != 0}">
							<g:each var="to" in="${shipmentInstance.transportationOrders}" status="i">
							<tr id="to${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							
							<td>${to?.toNumber}</td>
    						<td>${to?.productClass?.name}</td>
    						<td>${to?.weight}</td>
    						<td>${to?.volume}</td>
    						<td>${to?.quantity}</td>
    						<td><g:link controller="order" params="[id='${to?.poId}']" action="show" id="${to?.poId}">${to?.poNumber}</g:link></td>
    						<td><g:link controller="customerOrder" params="[id='${to?.coId}']" action="show" id="${to?.coId}">${to?.coNumber}</g:link></td>
    						</tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${shipmentInstance.transportationOrders?.size()  == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
							</table>
							
    
							<table>
						<tr><td><div>
               		<label  class="section-header" for='lineitems'><warehouse:message code="default.carriers.label" default="Line Items"/></label></div></td></tr>									
						<tr class="prop">
						   <td valign="top" class="dtl-header">
						      <label for="orderItems"></label>
						   </td>
						   <td valign="top" class="dtl-header">
						      <label for="orderItems">Carrier</label>
						   </td>
						   <td valign="top" class="dtl-header">
							<label for="productName">Priority</label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="itemDesc" >Total Cost</label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="Quantity">Routing Lane Id</label>
							</td>
							<td valign="top" class="dtl-header">
							<label for="uom">Rating Lane Id</label>
							</td>
							
							</tr>
							
							<g:if test="${shipmentInstance.shipmentCarriers?.size() != 0}">
							<g:each var="to" in="${shipmentInstance.shipmentCarriers}" status="i">
							<tr id="to${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>
							<g:if test="${to.status.equals("ASSIGNED")}">
							<input type="radio" id="shipCarrierId" name="shipCarrierId" value="${to?.id}"  checked/>
							</g:if>
							<g:else>
							<input type="radio" id="shipCarrierId" name="shipCarrierId" value="${to?.id}" />
							</g:else>
							</td>
							<td>${to?.carrier}</td>
    						<td>${to?.carrierPriority}</td>
    						<script>
    						
    						$(document).ready(function() {
    						$('a').each(function() {
			           				this.title =jQuery('input:radio[name=shipCarrierId]:checked').val();
				    		});
    						});
    						</script>
    						<td><a  href="javascript:void(0);" id="${to?.ratingLaneCarrierId}"  name="${to?.id}" class="cost-dialog">${to?.totalCost}</a></td>
    						<td>${to?.routingGuide?.id}</td>
    						<td>${to?.ratingGuideId}</td></tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${shipmentInstance.shipmentCarriers?.size()  == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
					  		<tr><td>
					  		<div  id="assignShipment">
								<g:link controller="shipment" id="shipCarrierId" action="assignToShipment" >
										<label class="assignBtn">Assign</label>
								</g:link>
							</div>
					  		
					  		
							</td></tr>
					  		</table>
							
               				<table><tr><td>
               				
               				
			                <div>
			                
			                <label  class="section-header"><warehouse:message code="shiping.shipmentstops.label" default="Line Items"/></label></div>
		               </td></tr></table>
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
							<label><warehouse:message code="shipping.estdarrival.label" default="Estimated Arrival" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.estddepart.label" default="Estimated Departure" /></label>
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
							<g:if test="${shipmentInstance.shipmentStops?.size() != 0}">
							<g:each var="shipmentStop" in="${shipmentInstance.shipmentStops}" status="i">
							<tr id="shipmentStop${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>${shipmentStop?.stopNumber}</td>
							<td>
							<g:link class="edit" controller="location" action="show" id="${shipmentInstance?.origin?.id}">
								${shipmentStop?.address?.address?.encodeAsHTML()},
    							${shipmentStop?.address?.address2?.encodeAsHTML()},
    							${shipmentStop?.address?.city?.encodeAsHTML()},
    							${shipmentStop?.address?.country?.encodeAsHTML()}</td>
    						<td>${shipmentStop?.stopAction}</g:link></td>
    						<td>${shipmentStop?.plannedArrival?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${shipmentStop?.plannedDeparture?.format('MM/dd/yyyy HH:mm')}</td>
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
    						<g:elseif test="${shipmentInstance.shipmentStops?.size() == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
							</table>
							<table><tr><td>
						<div><label class="section-header"><warehouse:message code="shiping.trackingMsg.label" default="Line Items"/></label></div>	
		               </td></tr></table>
		               <table>										
						<tr class="prop">
							
						   <td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.carrier.label" default="Carrier" /></label>
							</td>
						   	<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgType.label" default="Message Type" /></label>
							</td>
							<td valign="top" class="dtl-header">
						      <label><warehouse:message code="shipping.stopno.label" default="Stop No" /></label>
						   	</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.msgDate.label" default="Message Date" /></label>
							</td>
							
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.comments.label" default="Comments" /></label>
							</td>
							<td valign="top" class="dtl-header">
							<label><warehouse:message code="shipping.createdDate.label" default="Created Date" /></label>
							</td>
		
							</tr> 
							<g:if test="${shipmentInstance.trackingMsgs?.size() != 0}">
							<g:each var="trackingMsg" in="${shipmentInstance.trackingMsgs}" status="i">
							<tr id="trackingMsg${i}" <g:if test="${hidden}">style="display:none;"</g:if>>
							<td>${trackingMsg?.carrier?.companyName}</td>
    						<td>${trackingMsg?.msgType}</td>
    						<td>${trackingMsg?.stopNumber}</td>
    						<td>${trackingMsg?.msgDate?.format('MM/dd/yyyy HH:mm')}</td>
    						<td>${trackingMsg?.comments}</td>
    						<td>${trackingMsg?.createdDate?.format('MM/dd/yyyy HH:mm')}</td>
    						
        					</tr>
    						</g:each>
    						</g:if>
    						<g:elseif test="${shipmentInstance.trackingMsgs?.size() == 0}"> 
								<tr><td>No Records Found</td></tr>
					  		</g:elseif>
					  		<tr>
					  		<td></td><td></td><td></td><td></td><td></td>
					  		<td><div class="dtl-small">
									<a href="javascript:void(0);" id="${shipmentInstance.id}" class="open-trackingDialog"><label>Add</label></a>
								</div></td>
					  		</tr>
							</table>
							<table><tr><td>
							<g:if test="${session.companyTypeId == 8}">
							
               				<div class="action-menu">
												<g:render template="../shipment/actionsEdit" model="[shipmentInstance:shipmentInstance]"/>
											</div> 
											</g:if></td></tr></table>
											</fieldset></g:form>
											
        </div>
        
        <div id="trackingDialog-form" title="Arrival/Departure">
        <form id="trackingMsgForm">
        <input type="hidden" name="shipmentId" id="shipmentId" />
        <table>
        <tr><td><label for="msgType">Message Type</label></td><td><g:select name="msgType" from="${['Arrival', 'Departure']}" valueMessagePrefix="msgType" /></td></tr>
        <tr><td><label for="stopNumber">Stop Number</label></td><td><input type="text" name='stopNumber' value="" size="5" /></td></tr>
        <tr><td><label for="msgDate">Message Date</label></td><td>
        <input type="text" name="msgDate" id="msgDate" value="">
									<script type="text/javascript">
										$(function(){
										$('*[name=msgDate]').datetimepicker({
											 "closeOnSelected": true,
											 "format":'m/d/Y H:i'
											 });
										});
									</script>
        <%--<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="msgDate" id="msgDate" value="" format="MM/dd/yyyy" />--%></td></tr>
        <tr><td><label for="comments">Comments</label></td><td><input type="text" name='comments' value="" size="30" /></td></tr>
        </table>
         	
		</form>
	</div>
	
	 <div id="map" title="map"></div>
	 	<style>
html,body,#map-canvas {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}
</style>
	<style>
#directions-panel {
	height: 100%;
	float: right;
	width: 390px;
	overflow: auto;
}

#map-canvas {
	margin-right: 400px;
}

#control {
	background: #fff;
	padding: 5px;
	font-size: 14px;
	font-family: Arial;
	border: 1px solid #ccc;
	box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
	display: none;
}

@media print {
	#map-canvas {
		height: 500px;
		margin: 0;
	}
	#directions-panel {
		float: none;
		width: auto;
	}
}
#content-pane {
        float:right;
        width:48%;
        padding-left: 2%;
      }
      #outputDiv {
        font-size: 11px;
      }

</style>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
	<script>
		var directionsDisplay;
		var directionsService = new google.maps.DirectionsService();
		var map;
		var geocoder;
		var bounds = new google.maps.LatLngBounds();
		var markersArray = [];

		var origin1 = 'Denver';
		var destinationA = 'Dallas';

		var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000';
		var originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000';
				
		
		function initialize() {
			directionsDisplay = new google.maps.DirectionsRenderer();
			var mapOptions = {
				zoom : 7,
				center : new google.maps.LatLng(41.850033, -87.6500523)
			};
			var map = new google.maps.Map(
					document.getElementById('map-canvas'), mapOptions);
			geocoder = new google.maps.Geocoder();
			
			directionsDisplay.setMap(map);
			directionsDisplay.setPanel(document
					.getElementById('directions-panel'));

			var control = document.getElementById('control');
			control.style.display = 'block';
			map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
		}

		function calcRoute() {

			var start =origin1//$("#origin").children("option").is("selected").text()//$("#origin option:selected").text();
			var end = destinationA//$("#destination").children("option").is("selected").text()//$("#destination option:selected").text();

			var request = {
				origin : start,
				destination : end,
				travelMode : google.maps.TravelMode.DRIVING
			};
			directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
				}
			});
		}
		function calculateDistances() {
			  var service = new google.maps.DistanceMatrixService();
			  service.getDistanceMatrix(
			    {
			      origins: [origin1],
			      destinations: [destinationA],
			      travelMode: google.maps.TravelMode.DRIVING,
			      unitSystem: google.maps.UnitSystem.METRIC,
			      avoidHighways: false,
			      avoidTolls: false
			    }, callback);
			}

			function callback(response, status) {
			  if (status != google.maps.DistanceMatrixStatus.OK) {
			    alert('Error was: ' + status);
			  } else {
			    var origins = response.originAddresses;
			    var destinations = response.destinationAddresses;
			    var outputDiv = document.getElementById('outputDiv');
			    outputDiv.innerHTML = '';
			    deleteOverlays();

			    for (var i = 0; i < origins.length; i++) {
			      var results = response.rows[i].elements;
			      addMarker(origins[i], false);
			      for (var j = 0; j < results.length; j++) {
			        addMarker(destinations[j], true);
			        outputDiv.innerHTML += origins[i] + ' to ' + destinations[j]
			            + ': ' + results[j].distance.text + ' in '
			            + results[j].duration.text + '<br>';
			      }
			    }
			  }
			}

			function addMarker(location, isDestination) {
			  var icon;
			  if (isDestination) {
			    icon = destinationIcon;
			  } else {
			    icon = originIcon;
			  }
			  geocoder.geocode({'address': location}, function(results, status) {
			    if (status == google.maps.GeocoderStatus.OK) {
			      bounds.extend(results[0].geometry.location);
			      map.fitBounds(bounds);
			      var marker = new google.maps.Marker({
			        map: map,
			        position: results[0].geometry.location,
			        icon: icon
			      });
			      markersArray.push(marker);
			    } else {
			      alert('Geocode was not successful for the following reason: '
			        + status);
			    }
			  });
			}

			function deleteOverlays() {
			  for (var i = 0; i < markersArray.length; i++) {
			    markersArray[i].setMap(null);
			  }
			  markersArray = [];
			}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script> 
	
        <form id="mapForm">
        <div id="control">
      		<strong>Start:</strong>
      		<g:select onchange="calcRoute();" id="origin" name="origin.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.origin?.address?.city?.encodeAsHTML()}"  />
      		<strong>End:</strong>
      		<g:select id="destination" onchange="calcRoute();" name="shipDestination.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${shipmentInstance?.shipDestination?.address?.city?.encodeAsHTML()}"  />
    	 </div>

        <div id="directions-panel"></div>
        <div id="map-canvas"></div>
        
          </div>
        
        </form>
	</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function() {	

			$( "#mapForm" ).dialog({
			      autoOpen: false,
			      height: 450,
			      width: 1000,
			      modal: true,
			      
				Cancel: function() {
				  $( "#mapForm" ).dialog( "close" );
				}
			      
			    });
				
		$( ".map" ).click(function() {
			calcRoute();
			var currentId = $(this).attr('id');
			//$( "#mapForm" ).data('shipmentId', currentId );
			$( "#mapForm" ).dialog( "open" );
		      });
		      
		      
		      	
		    });
		$(document).ready(function() {	
		
		
		
		$( "#trackingDialog-form" ).dialog({
			      autoOpen: false,
			      height: 300,
			      width: 400,
			      modal: true,
			      buttons: {
				"Save": function() {
				  var bValid = true;	 
				if ( bValid ) {
					var shipmentId = $(this).data('shipmentId');
				  	$("input[id=shipmentId]").val(shipmentId)
					$.ajax({
						url: "/cimbidiaSCM/shipment/createTrackingMsg",
						type: "POST",
						
						data: $('#trackingMsgForm').serialize(),
						success: function(data) {
							alert ( 'Tracking message saved!' );
							location.reload();
						    $(this).dialog("close");
						},
						error: function(xhr, textStatus, error){
						  
						   console.log(xhr.statusText);
						   console.log(textStatus);
						   console.log(error);
						}
		        		});		    
		        		$( "#trackingDialog-form" ).dialog( "close" );
				  }
				},
				Cancel: function() {
				  $( "#trackingDialog-form" ).dialog( "close" );
				}
			      },
			      close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			      }
			    });


			$( ".open-trackingDialog" ).click(function() {
				var currentId = $(this).attr('id');
				$( "#trackingDialog-form" ).data('shipmentId', currentId );
				$( "#trackingDialog-form" ).dialog( "open" );
			      });
			$( "#resetShipId" ).click(function() {
				var currentId = $(this).attr('id');
				$("a[href='/cimbidiaSCM/shipment/resetResourceSelection/resetShipId']").attr('href', '/cimbidiaSCM/shipment/resetResourceSelection/'+currentId)
			});  
			$( "#assignShipment" ).click(function() {
			var selectedVal = "";
			var selected = $("input[type='radio'][name='shipCarrierId']:checked");
			if (selected.length > 0) {
    		selectedVal = selected.val();
    		var currentId = $(this).attr('id');
			$("a[href='/cimbidiaSCM/shipment/assignToShipment/shipCarrierId']").attr('href', '/cimbidiaSCM/shipment/assignToShipment/'+selectedVal)
    		
			}
			
			});
			      
		});
	
		(function($){
				$.fn.valList = function(){
					return $.map(this,function(elem){
						return elem.value || "";
					}).join(",");
				};
		})(jQuery);
		
		
		/*!
		* jQuery Cookie Plugin v1.4.0
		* https://github.com/carhartl/jquery-cookie
		*/
		(function (factory) {
		if (typeof define === 'function' && define.amd) {
		// AMD
		define(['jquery'], factory);
		} else if (typeof exports === 'object') {
		// CommonJS
		factory(require('jquery'));
		} else {
		// Browser globals
		factory(jQuery);
		}
		}(function ($) {

		var pluses = /\+/g;

		function encode(s) {
		return config.raw ? s : encodeURIComponent(s);
		}

		function decode(s) {
		return config.raw ? s : decodeURIComponent(s);
		}

		function stringifyCookieValue(value) {
		return encode(config.json ? JSON.stringify(value) : String(value));
		}

		function parseCookieValue(s) {
		if (s.indexOf('"') === 0) {
		// This is a quoted cookie as according to RFC2068, unescape...
		s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
		}

		try {
		// Replace server-side written pluses with spaces.
		// If we can't decode the cookie, ignore it, it's unusable.
		// If we can't parse the cookie, ignore it, it's unusable.
		s = decodeURIComponent(s.replace(pluses, ' '));
		return config.json ? JSON.parse(s) : s;
		} catch(e) {}
		}

		function read(s, converter) {
		var value = config.raw ? s : parseCookieValue(s);
		return $.isFunction(converter) ? converter(value) : value;
		}

		var config = $.cookie = function (key, value, options) {

		// Write

		if (value !== undefined && !$.isFunction(value)) {
		options = $.extend({}, config.defaults, options);

		if (typeof options.expires === 'number') {
		var days = options.expires, t = options.expires = new Date();
		t.setTime(+t + days * 864e+5);
		}

		return (document.cookie = [
		encode(key), '=', stringifyCookieValue(value),
		options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
		options.path ? '; path=' + options.path : '',
		options.domain ? '; domain=' + options.domain : '',
		options.secure ? '; secure' : ''
		].join(''));
		}

		// Read

		var result = key ? undefined : {};

		// To prevent the for loop in the first place assign an empty array
		// in case there are no cookies at all. Also prevents odd result when
		// calling $.cookie().
		var cookies = document.cookie ? document.cookie.split('; ') : [];

		for (var i = 0, l = cookies.length; i < l; i++) {
		var parts = cookies[i].split('=');
		var name = decode(parts.shift());
		var cookie = parts.join('=');

		if (key && key === name) {
		// If second argument (value) is a function it's a converter...
		result = read(cookie, value);
		break;
		}

		// Prevent storing a cookie that we couldn't decode.
		if (!key && (cookie = read(cookie)) !== undefined) {
		result[name] = cookie;
		}
		}

		return result;
		};

		config.defaults = {};

		$.removeCookie = function (key, options) {
		if ($.cookie(key) === undefined) {
		return false;
		}

		// Must not alter options, thus extending a fresh object...
		$.cookie(key, '', $.extend({}, options, { expires: -1 }));
		return !$.cookie(key);
		};

		}));

		


	</script>
        
    <script>
	   <g:remoteFunction controller="message" action="setReceipient" params="{companyId:${shipmentInstance?.carrierCompany?.id}}"/>
	   </script>
	   <div id="dialog-collab" title="Cim Collab">
	   <g:render template="/message/omessages" />
	   </div>
	   <div id="dialog-msgtrail" title="Messages" style="display:none">
 		 	 <g:render template="/message/msgtrail" />
		</div>
       <div id="dialog-cost" title="Transportation Cost">
	   <g:render template="shipmentAccessorials"/>
	   </div>
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it 
    <g:render template='../transportationOrder/transportationOrder'el="['transportationOrders':null,'i':'_clone','hidden':true]"/>-->
    <!-- Render the transportationOrder template (_transportationOrder.gsp) hidden so we can clone it -->
    <!-- Render the addStop template (_addStop.gsp) hidden so we can clone it -->
    <%--<g:render template='addStop' model="['shipmentStops':null,'i':'_clone','hidden':true]"/>--%>
    <!-- Render the addStop template (_addStop.gsp) hidden so we can clone it -->
    <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it -->
    <g:render template='shipmentSize' model="['shipmentSizes':null,'i':'_clone','hidden':true]"/>
    <!-- Render the shipmentSize template (_shipmentSize.gsp) hidden so we can clone it-->
    </body>
</html>
