<%@ page import="com.cimbidia.scm.oms.InvAvailSafetyFactor" %>



<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="invAvailSafetyFactor.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="invAvailSafetyFactor.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="invAvailSafetyFactor.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${invAvailSafetyFactorInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="invAvailSafetyFactor.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${invAvailSafetyFactorInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="invAvailSafetyFactor.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'invertorySupplyType', 'error')} required">
	<label for="invertorySupplyType">
		<g:message code="invAvailSafetyFactor.invertorySupplyType.label" default="Invertory Supply Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="invertorySupplyType.id" from="${com.cimbidia.scm.oms.InventorySupplyType.list()}" optionKey="id" value="${invAvailSafetyFactorInstance?.invertorySupplyType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: invAvailSafetyFactorInstance, field: 'safetyFactor', 'error')} required">
	<label for="safetyFactor">
		<g:message code="invAvailSafetyFactor.safetyFactor.label" default="Safety Factor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="safetyFactor" value="${fieldValue(bean: invAvailSafetyFactorInstance, field: 'safetyFactor')}" />
</div>

