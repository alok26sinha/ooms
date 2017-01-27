<%@ page import="com.cimbidia.scm.oms.SourcingRuleDtl" %>



<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="sourcingRuleDtl.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="sourcingRuleDtl.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="sourcingRuleDtl.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${sourcingRuleDtlInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'lastUpdatedDttm', 'error')} ">
	<label for="lastUpdatedDttm">
		<g:message code="sourcingRuleDtl.lastUpdatedDttm.label" default="Last Updated Dttm" />
		
	</label>
	<g:jqueryDatePicker name="lastUpdatedDttm" precision="minute" value="${sourcingRuleDtlInstance?.lastUpdatedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'fromLocation', 'error')} required">
	<label for="fromLocation">
		<g:message code="sourcingRuleDtl.fromLocation.label" default="From Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="fromLocation.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${sourcingRuleDtlInstance?.fromLocation?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'fulfillmentType', 'error')} ">
	<label for="fulfillmentType">
		<g:message code="sourcingRuleDtl.fulfillmentType.label" default="Fulfillment Type" />
		
	</label>
	<g:textField name="fulfillmentType" value="${sourcingRuleDtlInstance?.fulfillmentType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="sourcingRuleDtl.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="priority" value="${fieldValue(bean: sourcingRuleDtlInstance, field: 'priority')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingRuleDtlInstance, field: 'sourcingRuleHdr', 'error')} ">
	<label for="sourcingRuleHdr">
		<g:message code="sourcingRuleDtl.sourcingRuleHdr.label" default="Sourcing Rule Hdr" />
		
	</label>
	<g:textField name="sourcingRuleHdr" value="${sourcingRuleDtlInstance?.sourcingRuleHdr}" />
</div>

