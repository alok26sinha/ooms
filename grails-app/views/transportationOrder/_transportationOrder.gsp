<%@ page import="com.cimbidia.wm.core.IdentifierService" %>
<%@ page import="com.cimbidia.wm.core.Constants" %>
<%

    def identifierService = grailsApplication.classLoader.loadClass('com.cimbidia.wm.core.IdentifierService').newInstance()
%>

<div id="transportationOrder${i}" class="orderItem-div" <g:if test="${hidden}">style="display:none;"</g:if>>
   
    <div>
    <g:hiddenField name='transportationOrder[${i}].deleted' value='false'/>
    </div>
    
    <div class="dtl">
	<%--<g:textField name='transportationOrder[${i}].toNumber' value='${transportationOrder?.toNumber}' />
	--%><%--<g:autoSuggest id="transportationOrder[${i}].orderNumber" class="ui-autocomplete-input" name="transportationOrder[${i}].product" jsonUrl="${request.contextPath }/json/productLookup"
																  valueId="${transportationOrder?.product?.id }" 
																  valueName="${transportationOrder?.product?.name }" />
	--%></div>
	<div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'toNumber','errors')}'>
    <g:textField name='transportationOrder[${i}].toNumber' value='${transportationOrder?.toNumber}' />
    </div>
	<%--
    <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'pc','errors')}'>
    <g:textField name='transportationOrder[${i}].productClass' value='${transportationOrder?.productClass}' />
    </div>
    <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'description','errors')}'>
    
	<g:textField name='transportationOrder[${i}].description' value='${transportationOrder?.description}' />
	</div>
    <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'quantity','errors')}'>
    <g:textField name='transportationOrder[${i}].quantity' value='${transportationOrder?.quantity}' />
 	</div>
 	<div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'priceuom','errors')}'>
    <g:textField name='transportationOrder[${i}].priceuom' value='${transportationOrder?.priceuom}' />
 	</div>
 	 
 	 <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'totalValue','errors')}'>
    <g:textField name='transportationOrder[${i}].totalValue' value='${transportationOrder?.totalValue}' />
 	</div>
 	 <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'tempctrl','errors')}'>
    <g:textField name='transportationOrder[${i}].tempctrl' value='${transportationOrder?.tempctrl}' />
 	</div>
 	 <div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'perishable','errors')}'>
    <g:textField name='transportationOrder[${i}].perishable' value='${transportationOrder?.perishable}' />
 	</div>
 	<div class="dtl" class='value ${hasErrors(bean:transportationOrders,field:'sizes','errors')}'>
    <g:textField name='transportationOrder[${i}].sizes' value='${transportationOrder?.sizes}' />
 	</div>
		
--%></div>

