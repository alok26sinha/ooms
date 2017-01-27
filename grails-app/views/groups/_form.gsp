<%@ page import="com.cimbidia.scm.admin.Groups" %>



<div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="groups.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${groupsInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: groupsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="groups.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${groupsInstance?.name}" />
</div>

