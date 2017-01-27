<%@ page import="com.cimbidia.scm.collab.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'companyId', 'error')} required">
	<label for="companyId">
		<g:message code="message.companyId.label" default="Company Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyId" value="${fieldValue(bean: messageInstance, field: 'companyId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'context', 'error')} ">
	<label for="context">
		<g:message code="message.context.label" default="Context" />
		
	</label>
	<g:textField name="context" value="${messageInstance?.context}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="message.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="minute" value="${messageInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'message', 'error')} ">
	<label for="message">
		<g:message code="message.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${messageInstance?.message}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'object', 'error')} ">
	<label for="object">
		<g:message code="message.object.label" default="Object" />
		
	</label>
	<g:textField name="object" value="${messageInstance?.object}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'objectId', 'error')} ">
	<label for="objectId">
		<g:message code="message.objectId.label" default="Object Id" />
		
	</label>
	<g:textField name="objectId" value="${messageInstance?.objectId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'receiver', 'error')} ">
	<label for="receiver">
		<g:message code="message.receiver.label" default="Receiver" />
		
	</label>
	<g:textField name="receiver" value="${messageInstance?.receiver}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'sender', 'error')} ">
	<label for="sender">
		<g:message code="message.sender.label" default="Sender" />
		
	</label>
	<g:textField name="sender" value="${messageInstance?.sender}" />
</div>

