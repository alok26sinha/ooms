<%@ page import="com.cimbidia.scm.admin.UserGroup" %>



<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'groups', 'error')} required">
	<label for="groups">
		<g:message code="userGroup.groups.label" default="Groups" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="groups.id" from="${com.cimbidia.scm.admin.Groups.list()}" optionKey="id" value="${userGroupInstance?.groups?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userGroup.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="user.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${userGroupInstance?.user?.id}"  />
</div>

