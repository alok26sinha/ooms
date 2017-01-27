<%@ page import="com.cimbidia.scm.collab.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="message.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${messageInstance?.message}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'object', 'error')} ">
	<label for="object">
		<g:message code="message.object.label" default="Object" />
		
	</label>
	<g:textField name="object" value="${messageInstance?.object}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'context', 'error')} ">
	<label for="context">
		<g:message code="message.context.label" default="Context" />
		
	</label>
	<g:textField name="context" value="${messageInstance?.context}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'objectId', 'error')} ">
	<label for="objectId">
		<g:message code="message.objectId.label" default="Object Id" />
		
	</label>
	<g:textField name="objectId" value="${messageInstance?.objectId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'sender', 'error')} required">
	<label for="sender">
		<g:message code="message.sender.label" default="Sender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sender" name="sender.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" required="" value="${messageInstance?.sender?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'companyId', 'error')} required">
	<label for="companyId">
		<g:message code="message.companyId.label" default="Company Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="companyId" type="number" value="${messageInstance.companyId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="message.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${messageInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'receivers', 'error')} ">
	<label for="receivers">
		<g:message code="message.receivers.label" default="Receivers" />
		
	</label>
	<g:select name="receivers" from="${com.cimbidia.wm.core.User.list()}" multiple="multiple" optionKey="id" size="5" value="${messageInstance?.receivers*.id}" class="many-to-many"/>
</div>

