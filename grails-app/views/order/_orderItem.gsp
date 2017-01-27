<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='orderItems[${i}].deleted' value='false'/>
    </div>
     <div class="dtl-small">
    <g:textField style="height:20px" readonly="readonly" id="orderItems[${i}].lineNum" name='orderItems[${i}].lineNum' value='${i}' />
    </div>
    <div class="dtl">
	
	<g:selectLocation name="orderItems[${i}].origin" optionKey="id" value="${orderItem?.origin}" noSelection="['':'']" />												
																  
	</div>
    <div class="dtl">
    <g:selectProduct name="orderItems[${i}].product" optionKey="id" value="${orderItem?.product}" noSelection="['':'']" />		
	<%--<g:autoSuggest id="orderItems[${i}].product" class="ui-autocomplete-input" name="orderItems[${i}].product" jsonUrl="${request.contextPath }/json/productLookup"
																  valueId="${orderItem?.product?.id }" 
																  valueName="${orderItem?.product?.name }" />
													
																  
	--%></div>
    <div class="dtl">
    <g:selectPC name="orderItems[${i}].pc.id" optionKey="id"
										value="${orderItem?.pc?.id}" noSelection="['':'']"/>
    <%--<g:textField name='orderItems[${i}].pc' value='${orderItem?.pc}' />
    --%></div>
    <div class="dtl">
    
	<g:textField style="height:20px" name='orderItems[${i}].description' value='${orderItem?.description}' />
	</div>
    <div class="dtl">
    <g:textField style="height:20px"  name='orderItems[${i}].quantity' value='${orderItem?.quantity}' />
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
    <g:textField  style="height:20px"  name='orderItems[${i}].pricePerUom' value='${orderItem?.pricePerUom}' />
 	</div>
 	<div class="dtl">
    <g:selectPUOM  optionKey="id" name='orderItems[${i}].priceCurrency.id' value='${orderItem?.priceCurrency?.id}' />
 	</div>
 	<div class="dtl">
    <a>Item Dtls</a>
 	</div>
 	 <div class="dtl">
    <span class="del-orderItem">
        <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
    </div>
   
     
</div>