<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='orderItems[${i}].deleted' value='false'/>
    </div>
     <div class="dtl-small">
	
	<g:textField style="height:20px" readonly="readonly" name="orderItems[${i}].lineNum" value="${orderItem?.lineNum}" />												
																  
	</div>
    <div class="dtl">
	
	<g:selectLocation name="orderItems[${i}].origin.id" optionKey="id" value="${orderItem?.origin?.id}" noSelection="['':'']" />												
																  
	</div>
    <div class="dtl">
    <g:selectProduct name="orderItems[${i}].product.id" optionKey="id" value="${orderItem?.product?.id}"  noSelection="['':'']"/>		
	</div>
    <div class="dtl">
    <g:selectPC name="orderItems[${i}].pc.id" optionKey="id"
										value="${orderItem?.pc?.id}" noSelection="['':'']" />
    </div>
    <div class="dtl">
    
	<g:textField style="height:20px" name='orderItems[${i}].description' value='${orderItem?.description}' />
	</div>
    <div class="dtl">
    <g:textField style="height:20px" name='orderItems[${i}].quantity' value='${orderItem?.quantity}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="orderItems[${i}].quantityUom.id" optionKey="id" value="${orderItem?.quantityUom?.id}" />
    </div>
    <div class="dtl">
    <g:textField style="height:20px"  name='orderItems[${i}].weight' value='${orderItem?.weight}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="orderItems[${i}].weightUom.id" optionKey="id" value="${orderItem?.weightUom?.id}" />
    </div>
    <div class="dtl">
    <g:textField style="height:20px"  name='orderItems[${i}].volume' value='${orderItem?.volume}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="orderItems[${i}].volumeUom.id" optionKey="id" value="${orderItem?.volumeUom?.id}" />
    </div>
 	 <div class="dtl">
    <g:textField  style="height:20px" name='orderItems[${i}].pricePerUom' value='${orderItem?.pricePerUom}' />
 	</div>
 	<div class="dtl" style="width:7.5%">
    <g:selectPUOM  optionKey="id" name='orderItems[${i}].priceCurrency.id' value='${orderItem?.priceCurrency?.id}' />
 	</div>
 	<div class="dtl-small">
		<a href="javascript:void(0);" id="${orderItem?.lineNum}" class="open-dialog"><img style="height:20px" src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="RTS" /></a>
	</div>

	<div class="dtl-small">
    <span class="del-orderItem">
         <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
    </div>
       
</div>

<%--<div id="dialog-form${i}" title="Mark item ready to ship">
        <form id="rtsForm">
          <fieldset>
          <div class="bootstrap">
          	<input type="hidden" name="orderItemRTS[${i}].orderId" id="orderItemRTS[${i}].orderId" value="${orderInstance?.id}"/>
          	<input type="hidden" name="orderItemRTS[${i}].orderLineNumber" id="orderItemRTS[${i}].orderLineNumber" value="${orderItem?lineNum}"/>
         	<input type="hidden"  name="orderItemRTS[${i}].companyId" id="orderItemRTS[${i}].companyId" value="${orderInstance?.companyId}"/>
         	<input type="hidden"  name="orderItemRTS[${i}].pc" id="orderItemRTS[${i}].pc" value="${orderItem?.pc}"/>
         	<input type="hidden"  name="orderItemRTS[${i}].uom" id="orderItemRTS[${i}].uom" value="${orderItem?.uom}"/>
        <div class="row">
        <div class="col-md-6"><label for="rtsQuantity">Ready to Ship Qty</label></div>
	<div class="col-md-6">	<input type="text" class="text ui-widget-content ui-corner-all" name="rtsQuantity" id="rtsQuantity" class="text ui-widget-content ui-corner-all" /></div>
	 	
	</div>
	<div class="row">
	<div class="col-md-6">	<label for="pickupStartDt">Pickup Start Date</label></div>
	<div class="col-md-6">	<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="pickupStart" id="pickupStartDt" value="${orderItem?.pickupStart}" format="MM/dd/yyyy" /></div>
	</div>
	<div class="row">
	<div class="col-md-6">	<label for="pickupEndDt">Pickup End Date</label></div>
	<div class="col-md-6">	<g:jqueryDatePicker styleClass="text ui-widget-content ui-corner-all" name="pickupEnd" id="pickupEndDt" value="${orderItem?.pickupEnd}" format="MM/dd/yyyy" /></div>
	</div>
	 </div>
          </fieldset>
        </form>
	</div>--%>