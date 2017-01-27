<div id="shipmentSize${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
<table>
<tr>

<div class="dtl">
    <g:hiddenField name='shipmentSize[${i}].id' value='${shipmentSize?.id}' />
    </div>
    <td valign='top' style="text-align:right">
    <label for='quantity'><warehouse:message code="shipping.quantity.label"/></label></td>
    <td>
    <div class="dtl">
    <g:textField name='shipmentSize[${i}].quantity' value='${shipmentSize?.quantity}' />
	</div>
	</td>
	<td valign='top' style="text-align:right">
	<label for='uom'><warehouse:message code="shipping.uom.label"/></label></td>
	<td>
	<div class="dtl">
	<%--<g:selectUnitOfMeasure name="uom" optionKey="" optionValue=""></g:selectUnitOfMeasure>
	--%><%--<g:selectUnitOfMeasure from="" noSelection="" optionKey="" optionValue=""></g:selectUnitOfMeasure>
	<g:selectBU name="businessUnit" optionKey="bu" 	value="${orderInstance?.businessUnit}" />
    <g:textField name='shipmentSize[${i}].uom' value='${shipmentSize?.uom?.name}' />--%>
    <g:selectUOM name="shipmentSize[${i}].uom.id" optionKey="id" value="${shipmentSize?.uom?.id}" />
	</div></td>
</tr></table>
</div>