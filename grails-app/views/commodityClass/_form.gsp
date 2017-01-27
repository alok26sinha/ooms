<%@ page import="com.cimbidia.wm.core.rg.CommodityClass" %>



<div class="fieldcontain ${hasErrors(bean: commodityClassInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="commodityClass.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${commodityClassInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: commodityClassInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="commodityClass.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${commodityClassInstance?.name}" />
</div>

