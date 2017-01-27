<%@ page import="com.cimbidia.scm.admin.Company" %>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyId', 'error')} required">
	<label for="companyId">
		<g:message code="company.companyId.label" default="Company Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="companyId" value="${fieldValue(bean: companyInstance, field: 'companyId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyName', 'error')} ">
	<label for="companyName">
		<g:message code="company.companyName.label" default="Company Name" />
		
	</label>
	<g:textField name="companyName" value="${companyInstance?.companyName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactAddress1', 'error')} ">
	<label for="contactAddress1">
		<g:message code="company.contactAddress1.label" default="Contact Address1" />
		
	</label>
	<g:textField name="contactAddress1" value="${companyInstance?.contactAddress1}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactAddress2', 'error')} ">
	<label for="contactAddress2">
		<g:message code="company.contactAddress2.label" default="Contact Address2" />
		
	</label>
	<g:textField name="contactAddress2" value="${companyInstance?.contactAddress2}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactCountry', 'error')} ">
	<label for="contactCountry">
		<g:message code="company.contactCountry.label" default="Contact Country" />
		
	</label>
	<g:textField name="contactCountry" value="${companyInstance?.contactCountry}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactEmail', 'error')} ">
	<label for="contactEmail">
		<g:message code="company.contactEmail.label" default="Contact Email" />
		
	</label>
	<g:textField name="contactEmail" value="${companyInstance?.contactEmail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactName', 'error')} ">
	<label for="contactName">
		<g:message code="company.contactName.label" default="Contact Name" />
		
	</label>
	<g:textField name="contactName" value="${companyInstance?.contactName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactPhone', 'error')} ">
	<label for="contactPhone">
		<g:message code="company.contactPhone.label" default="Contact Phone" />
		
	</label>
	<g:textField name="contactPhone" value="${companyInstance?.contactPhone}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactState', 'error')} ">
	<label for="contactState">
		<g:message code="company.contactState.label" default="Contact State" />
		
	</label>
	<g:textField name="contactState" value="${companyInstance?.contactState}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'contactZip', 'error')} ">
	<label for="contactZip">
		<g:message code="company.contactZip.label" default="Contact Zip" />
		
	</label>
	<g:textField name="contactZip" value="${companyInstance?.contactZip}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'createDttm', 'error')} required">
	<label for="createDttm">
		<g:message code="company.createDttm.label" default="Create Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createDttm" precision="minute" value="${companyInstance?.createDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="company.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${companyInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'lastUpdatedDttm', 'error')} required">
	<label for="lastUpdatedDttm">
		<g:message code="company.lastUpdatedDttm.label" default="Last Updated Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastUpdatedDttm" precision="minute" value="${companyInstance?.lastUpdatedDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="company.logo.label" default="Logo" />
		
	</label>
	<g:textField name="logo" value="${companyInstance?.logo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'parentCompanyId', 'error')} required">
	<label for="parentCompanyId">
		<g:message code="company.parentCompanyId.label" default="Parent Company Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="parentCompanyId" value="${fieldValue(bean: companyInstance, field: 'parentCompanyId')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="company.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" value="${fieldValue(bean: companyInstance, field: 'type')}" />
</div>

