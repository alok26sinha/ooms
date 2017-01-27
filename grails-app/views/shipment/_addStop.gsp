<div id="shipmentStop${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>


<div class="dtl">
    <g:hiddenField name='shipmentStop[${i}].id' value='' />
    </div>
    <div class="dtl">
    <label for='quantity'><warehouse:message code="shipping.quantity.label"/></label></td>
    </div>
    <div class="dtl">
    <g:textField name='shipmentStop[${i}].quantity' value='${shipmentSize?.quantity}' />
	</div>
	
	<div class="dtl">
	<label for='uom'><warehouse:message code="shipping.uom.label"/></label></td>
	</div>
	<div class="dtl">
	<%--<g:selectUnitOfMeasure name="uom" optionKey="" optionValue=""></g:selectUnitOfMeasure>
	--%><%--<g:selectUnitOfMeasure from="" noSelection="" optionKey="" optionValue=""></g:selectUnitOfMeasure>
	<g:selectBU name="businessUnit" optionKey="bu" 	value="${orderInstance?.businessUnit}" />
    --%><g:textField name='shipmentSize[${i}].uom' value='${shipmentSize?.uom}' />
	</div>

</div>