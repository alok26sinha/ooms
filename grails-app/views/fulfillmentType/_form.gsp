<%@ page import="com.cimbidia.scm.oms.FulfillmentType" %>



<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="fulfillmentType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${fulfillmentTypeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="fulfillmentType.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${fulfillmentTypeInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="fulfillmentType.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${fulfillmentTypeInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="fulfillmentType.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${fulfillmentTypeInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'lastUpdatedDttm', 'error')} ">
	<label for="lastUpdatedDttm">
		<g:message code="fulfillmentType.lastUpdatedDttm.label" default="Last Updated Dttm" />
		
	</label>
	<g:jqueryDatePicker name="lastUpdatedDttm" precision="minute" value="${fulfillmentTypeInstance?.lastUpdatedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="fulfillmentType.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${fulfillmentTypeInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fulfillmentTypeInstance, field: 'fulfillmentType', 'error')} ">
	<label for="fulfillmentType">
		<g:message code="fulfillmentType.fulfillmentType.label" default="Fulfillment Type" />
		
	</label>
	<g:textField name="fulfillmentType" value="${fulfillmentTypeInstance?.fulfillmentType}" />
</div>

