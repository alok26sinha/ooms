<div id="orderItem${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
   <div>
    <g:hiddenField name='orderItems[${i}].deleted' value='false'/>
    </div>
     <div class="dtl-small" style="width:1%">
	
	<g:textField style="height:20px" readonly="readonly" name="orderItems[${i}].lineNum" value="${orderItem?.lineNum}" />												
																  
	</div>
    <div class="dtl" style="width:7%">
	
	<g:selectLocation name="orderItems[${i}].origin.id" optionKey="id" value="${orderItem?.origin?.id}" noSelection="['':'']"/>												
																  
	</div>
    <div class="dtl" style="width:7%">
    <g:selectProduct name="orderItems[${i}].product.id" optionKey="id" value="${orderItem?.product?.id}" noSelection="['':'']"/>		
	</div>
    <div class="dtl" >
    <g:selectPC name="orderItems[${i}].pc.id" optionKey="id"
										value="${orderItem?.pc?.id}" noSelection="['':'']"/>
    </div>
    <div class="dtl" style="width:5%">
    
	<g:textField style="height:20px" name='orderItems[${i}].description' value='${orderItem?.description}' />
	</div>
    <div class="dtl" style="width:6%">
    <g:textField style="height:20px" name='orderItems[${i}].quantity' value='${orderItem?.quantity}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="orderItems[${i}].quantityUom.id" optionKey="id" value="${orderItem?.quantityUom?.id}" />
    </div>
    <div class="dtl" style="width:6%">
    <g:textField style="height:20px"  name='orderItems[${i}].weight' value='${orderItem?.weight}' />
 	</div>
 	 <div class="dtl" style="width:7%">
 	  <g:selectUOM name="orderItems[${i}].weightUom.id" optionKey="id" value="${orderItem?.weightUom?.id}" />
    </div>
    <div class="dtl" style="width:6%">
    <g:textField style="height:20px"  name='orderItems[${i}].volume' value='${orderItem?.volume}' />
 	</div>
 	 <div class="dtl" style="width:7%">
 	  <g:selectUOM name="orderItems[${i}].volumeUom.id" optionKey="id" value="${orderItem?.volumeUom?.id}" />
    </div>
 	 <div class="dtl" style="width:4%">
    <g:textField  style="height:20px" name='orderItems[${i}].pricePerUom' value='${orderItem?.pricePerUom}' />
 	</div>
 	<div class="dtl" style="width:7%">
    <g:selectPUOM  optionKey="id" name='orderItems[${i}].priceCurrency.id' value='${orderItem?.priceCurrency?.id}' />
 	</div>
 	<div class="dtl" style="width:5%">
    <g:textField  optionKey="id" name='orderItems[${i}].description' value='${orderItem?.description}' />
 	</div>
 	<div class="dtl"style="width:6%">
    <g:textField  name='orderItems[${i}].total' value='${orderItem?.total}' />
 	</div>
 	

	<div class="dtl-small">
    <span class="del-orderItem">
         <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:right;"/>
    </span>
    </div>
   
     
</div>