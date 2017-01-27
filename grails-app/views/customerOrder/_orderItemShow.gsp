<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='orderItems[${i}].deleted' value='false'/>
    </div>
    <div class="dtl-small">
    <g:textField readOnly="readOnly" name='orderItems[${i}].id' value='${orderItem?.lineNum}' />
    </div>
    <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].origin' value='${orderItem?.origin}' />
    </div>
     <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].product' value='${orderItem?.product}' />
    </div>
    <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].name' value='${orderItem?.pc?.name}' />
    </div>
    <div class="dtl"> 
	<g:textField readOnly="readOnly" name='orderItems[${i}].description' value='${orderItem?.description}' />
	</div>
    <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].quantity' value='${orderItem?.quantity}' />
 	</div>
 	 <div class="dtl">
 	  <g:textField readOnly="readOnly" name="orderItems[${i}].quantityUom.id"  value="${orderItem?.quantityUom?.name}" />
    </div>
    <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].weight' value='${orderItem?.weight}' />
 	</div>
 	 <div class="dtl">
 	  <g:textField readOnly="readOnly" name="orderItems[${i}].weightUom.id" value="${orderItem?.weightUom?.name}" />
    </div>
    <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].volume' value='${orderItem?.volume}' />
 	</div>
 	 <div class="dtl">
 	  <g:textField readOnly="readOnly" name="orderItems[${i}].volumeUom.id" value="${orderItem?.volumeUom?.name}" />
    </div>
 	 <div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].pricePerUom' value='${orderItem?.pricePerUom}' />
 	</div>
 	<div class="dtl">
    <g:textField readOnly="readOnly" name='orderItems[${i}].priceCurrency' value='${orderItem?.priceCurrency?.name}' />
 	</div>
 	 <div class="dtl">
		<a href="javascript:void(0);" id="${orderItem?.id}" class="open-dialog"><img style="height:20px" src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="RTS" /></a>
	</div>
    
   
     
</div>