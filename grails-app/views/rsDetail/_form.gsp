<%@ page import="com.cimbidia.scm.rs.RsDetail" %>



<div class="fieldcontain ${hasErrors(bean: rsDetailInstance, field: 'autoTender', 'error')} ">
	<label for="autoTender">
		<g:message code="rsDetail.autoTender.label" default="Auto Tender" />
		
	</label>
	<g:checkBox name="autoTender" value="${rsDetailInstance?.autoTender}" />
</div>

<div class="fieldcontain ${hasErrors(bean: rsDetailInstance, field: 'cycleType', 'error')} ">
	<label for="cycleType">
		<g:message code="rsDetail.cycleType.label" default="Cycle Type" />
		
	</label>
	<g:textField name="cycleType" value="${rsDetailInstance?.cycleType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: rsDetailInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="rsDetail.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="level" value="${fieldValue(bean: rsDetailInstance, field: 'level')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: rsDetailInstance, field: 'parentId', 'error')} ">
	<label for="parentId">
		<g:message code="rsDetail.parentId.label" default="Parent Id" />
		
	</label>
	<g:textField name="parentId" value="${rsDetailInstance?.parentId}" />
</div>

