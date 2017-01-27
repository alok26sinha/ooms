<div id="asnItem${i}" class="asnItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='asnItems[${i}].deleted' value='false'/>
    </div>
   
     <div class="dtl-small">
    <g:textField style="height:20px" readonly="readonly" id="asnItems[${i}].lineNum" name='asnItems[${i}].lineNum' value='${i}' />
    </div>
    <div class="dtl">
    <g:selectOrder name="asnItems[${i}].order.id" optionKey="id" value="${asnItem?.order}" noSelection="['':'']" />																  
	</div>
    <div class="dtl">
    <g:selectItem name="asnItems[${i}].orderItem.id" optionKey="id" value="${asnItem?.orderItem}" noSelection="['':'']" />																  
	</div>
    <div class="dtl">
    <g:selectPC name="asnItems[${i}].pc.id" optionKey="id"
										value="${asnItem?.pc?.id}" noSelection="['':'']"/>
    <%--<g:textField name='asnItems[${i}].pc' value='${asnItem?.pc}' />
    --%></div>
   
    <div class="dtl">
    <g:textField style="height:20px"  name='asnItems[${i}].quantity' value='${asnItem?.quantity}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="asnItems[${i}].quantityUom" optionKey="id" value="${asnItem?.quantityUom}" />
    </div>
    
    <div class="dtl">
    <g:textField style="height:20px"  name='asnItems[${i}].weight' value='${asnItem?.weight}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="asnItems[${i}].weightUom" optionKey="id" value="${asnItem?.weightUom}" />
    </div>
    <div class="dtl">
    <g:textField style="height:20px"  name='asnItems[${i}].volume' value='${asnItem?.volume}' />
 	</div>
 	 <div class="dtl">
 	  <g:selectUOM name="asnItems[${i}].volumeUom" optionKey="id" value="${asnItem?.volumeUom}" />
    </div>
     
 	 <div class="dtl">
 	  <g:selectUOM name="asnItems[${i}].pricePerUom" optionKey="id" value="${asnItem?.pricePerUom}" />
    </div>
 	<div class="dtl">
    <g:selectPUOM  optionKey="id" name='asnItems[${i}].priceCurrency' value='${asnItem?.priceCurrency}' />
 	</div>
 	<div class="dtl">
    <a>Item Dtls</a>
 	</div>
 	 <div class="dtl-small">
    <span class="del-asnItem">
        <img src="${resource(dir:'images', file:'icon_delete.png')}"
            style="vertical-align:middle;"/>
    </span>
    </div>
   
     
</div>