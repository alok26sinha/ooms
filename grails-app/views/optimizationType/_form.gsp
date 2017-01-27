<%@ page import="com.cimbidia.scm.oms.OptimizationType" %>



<div class="fieldcontain ${hasErrors(bean: optimizationTypeInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="optimizationType.type.label" default="Type" />
		
	</label>
	<g:textField name="type" value="${optimizationTypeInstance?.type}" />
</div>

