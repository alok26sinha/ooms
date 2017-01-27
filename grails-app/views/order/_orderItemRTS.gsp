<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='orderItemRTS[${i}].deleted' value='false'/>
    </div>
    
    <div class=dtl-rts>
	<g:textField  readOnly="readOnly" name='orderItemRTS[${i}].product' value='${orderItemRTS?.product?.name}' />
	</div>
    <div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].pc' value='${orderItemRTS?.pc.name}' />
    </div>
    <div class=dtl-rts>
    
	<g:textField  readOnly="readOnly" name='orderItemRTS[${i}].description' value='${orderItemRTS?.description}' />
	</div>
    <div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].rtsQuantity' value='${orderItemRTS?.rtsQuantity}' />
 	</div>
 	 <div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].quantityUom' value='${orderItemRTS?.quantityUom?.name}' />
 	</div>
 	<%--<div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].pricePerUom' value='${orderItemRTS?.product?.pricePerUom}' />
 	</div>
 	 <div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].priceuom' value='${orderItemRTS?.product?.pricePerUnit}' />
 	</div>
 	 --%><div class=dtl-rts>
 	 
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].startdt' value='${orderItemRTS?.pickupStart}' />
 	</div>
 	 <div class=dtl-rts>
    <g:textField  readOnly="readOnly" name='orderItemRTS[${i}].enddt' value='${orderItemRTS?.pickupEnd}' />
 	</div>
  	 
	<%--<div class=dtl-rts>
    <span class="del-orderItem">
         <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
    </div>
   
     
--%></div>