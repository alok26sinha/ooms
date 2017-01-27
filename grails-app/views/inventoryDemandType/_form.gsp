<%@ page import="com.cimbidia.scm.oms.InventoryDemandType" %>



<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'allocatedDemand', 'error')} ">
	<label for="allocatedDemand">
		<g:message code="inventoryDemandType.allocatedDemand.label" default="Allocated Demand" />
		
	</label>
	<g:checkBox name="allocatedDemand" value="${inventoryDemandTypeInstance?.allocatedDemand}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'committedDemand', 'error')} ">
	<label for="committedDemand">
		<g:message code="inventoryDemandType.committedDemand.label" default="Committed Demand" />
		
	</label>
	<g:checkBox name="committedDemand" value="${inventoryDemandTypeInstance?.committedDemand}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventoryDemandType.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${inventoryDemandTypeInstance?.createdBy}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'createdDttm', 'error')} required">
	<label for="createdDttm">
		<g:message code="inventoryDemandType.createdDttm.label" default="Created Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryDemandTypeInstance?.createdDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'demandType', 'error')} ">
	<label for="demandType">
		<g:message code="inventoryDemandType.demandType.label" default="Demand Type" />
		
	</label>
	<g:textField name="demandType" value="${inventoryDemandTypeInstance?.demandType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="inventoryDemandType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${inventoryDemandTypeInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventoryDemandType.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:textField name="modifiedBy" value="${inventoryDemandTypeInstance?.modifiedBy}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'modifiedDttm', 'error')} required">
	<label for="modifiedDttm">
		<g:message code="inventoryDemandType.modifiedDttm.label" default="Modified Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryDemandTypeInstance?.modifiedDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandTypeInstance, field: 'promisedDemand', 'error')} ">
	<label for="promisedDemand">
		<g:message code="inventoryDemandType.promisedDemand.label" default="Promised Demand" />
		
	</label>
	<g:checkBox name="promisedDemand" value="${inventoryDemandTypeInstance?.promisedDemand}" />
</div>

