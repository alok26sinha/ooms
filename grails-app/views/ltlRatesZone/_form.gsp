<%@ page import="com.cimbidia.wm.core.rg.LtlRatesZone" %>



<div class="fieldcontain ${hasErrors(bean: ltlRatesZoneInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="ltlRatesZone.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${ltlRatesZoneInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ltlRatesZoneInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="ltlRatesZone.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${ltlRatesZoneInstance?.name}" />
</div>

