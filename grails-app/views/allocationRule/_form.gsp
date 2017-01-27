<%@ page import="com.cimbidia.scm.oms.AllocationRule" %>



<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="allocationRule.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${allocationRuleInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="allocationRule.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${allocationRuleInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="allocationRule.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${allocationRuleInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'lastUpdatedDttm', 'error')} ">
	<label for="lastUpdatedDttm">
		<g:message code="allocationRule.lastUpdatedDttm.label" default="Last Updated Dttm" />
		
	</label>
	<g:jqueryDatePicker name="lastUpdatedDttm" precision="minute" value="${allocationRuleInstance?.lastUpdatedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'applyFutureSafeteyFactor', 'error')} ">
	<label for="applyFutureSafeteyFactor">
		<g:message code="allocationRule.applyFutureSafeteyFactor.label" default="Apply Future Safetey Factor" />
		
	</label>
	<g:checkBox name="applyFutureSafeteyFactor" value="${allocationRuleInstance?.applyFutureSafeteyFactor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'applyOnHandSafetyFactor', 'error')} ">
	<label for="applyOnHandSafetyFactor">
		<g:message code="allocationRule.applyOnHandSafetyFactor.label" default="Apply On Hand Safety Factor" />
		
	</label>
	<g:checkBox name="applyOnHandSafetyFactor" value="${allocationRuleInstance?.applyOnHandSafetyFactor}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'cancelOrderOnFail', 'error')} ">
	<label for="cancelOrderOnFail">
		<g:message code="allocationRule.cancelOrderOnFail.label" default="Cancel Order On Fail" />
		
	</label>
	<g:checkBox name="cancelOrderOnFail" value="${allocationRuleInstance?.cancelOrderOnFail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="allocationRule.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${allocationRuleInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'considerFutureInventory', 'error')} ">
	<label for="considerFutureInventory">
		<g:message code="allocationRule.considerFutureInventory.label" default="Consider Future Inventory" />
		
	</label>
	<g:checkBox name="considerFutureInventory" value="${allocationRuleInstance?.considerFutureInventory}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="allocationRule.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${allocationRuleInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'lineShipComplete', 'error')} ">
	<label for="lineShipComplete">
		<g:message code="allocationRule.lineShipComplete.label" default="Line Ship Complete" />
		
	</label>
	<g:checkBox name="lineShipComplete" value="${allocationRuleInstance?.lineShipComplete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'lineShipSingleLocation', 'error')} ">
	<label for="lineShipSingleLocation">
		<g:message code="allocationRule.lineShipSingleLocation.label" default="Line Ship Single Location" />
		
	</label>
	<g:checkBox name="lineShipSingleLocation" value="${allocationRuleInstance?.lineShipSingleLocation}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'optimizationType', 'error')} ">
	<label for="optimizationType">
		<g:message code="allocationRule.optimizationType.label" default="Optimization Type" />
		
	</label>
	<g:textField name="optimizationType" value="${allocationRuleInstance?.optimizationType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'shipComplete', 'error')} ">
	<label for="shipComplete">
		<g:message code="allocationRule.shipComplete.label" default="Ship Complete" />
		
	</label>
	<g:checkBox name="shipComplete" value="${allocationRuleInstance?.shipComplete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'shipSingleLocation', 'error')} ">
	<label for="shipSingleLocation">
		<g:message code="allocationRule.shipSingleLocation.label" default="Ship Single Location" />
		
	</label>
	<g:checkBox name="shipSingleLocation" value="${allocationRuleInstance?.shipSingleLocation}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'weightToDistance', 'error')} required">
	<label for="weightToDistance">
		<g:message code="allocationRule.weightToDistance.label" default="Weight To Distance" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="weightToDistance" value="${fieldValue(bean: allocationRuleInstance, field: 'weightToDistance')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationRuleInstance, field: 'weightToLocation', 'error')} required">
	<label for="weightToLocation">
		<g:message code="allocationRule.weightToLocation.label" default="Weight To Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="weightToLocation" value="${fieldValue(bean: allocationRuleInstance, field: 'weightToLocation')}" />
</div>

