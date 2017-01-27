<%@ page import="com.cimbidia.scm.oms.InventoryDemand" %>



<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventoryDemand.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryDemandInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventoryDemand.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryDemandInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventoryDemand.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryDemandInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventoryDemand.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryDemandInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'inventoryDemandType', 'error')} required">
	<label for="inventoryDemandType">
		<g:message code="inventoryDemand.inventoryDemandType.label" default="Inventory Demand Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryDemandType.id" from="${com.cimbidia.scm.oms.InventoryDemandType.list()}" optionKey="id" value="${inventoryDemandInstance?.inventoryDemandType?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'itemLocation', 'error')} required">
	<label for="itemLocation">
		<g:message code="inventoryDemand.itemLocation.label" default="Item Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryDemandInstance?.itemLocation?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'inventoryIdentifier', 'error')} required">
	<label for="inventoryIdentifier">
		<g:message code="inventoryDemand.inventoryIdentifier.label" default="Inventory Identifier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryDemandInstance?.inventoryIdentifier?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="inventoryDemand.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryDemandInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'demandCancelDate', 'error')} required">
	<label for="demandCancelDate">
		<g:message code="inventoryDemand.demandCancelDate.label" default="Demand Cancel Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="demandCancelDate" precision="minute" value="${inventoryDemandInstance?.demandCancelDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'demandReferences', 'error')} ">
	<label for="demandReferences">
		<g:message code="inventoryDemand.demandReferences.label" default="Demand References" />
		
	</label>
	<g:textField name="demandReferences" value="${inventoryDemandInstance?.demandReferences}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'demandReferencesType', 'error')} ">
	<label for="demandReferencesType">
		<g:message code="inventoryDemand.demandReferencesType.label" default="Demand References Type" />
		
	</label>
	<g:textField name="demandReferencesType" value="${inventoryDemandInstance?.demandReferencesType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'demandShipDate', 'error')} required">
	<label for="demandShipDate">
		<g:message code="inventoryDemand.demandShipDate.label" default="Demand Ship Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="demandShipDate" precision="minute" value="${inventoryDemandInstance?.demandShipDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryDemandInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="inventoryDemand.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: inventoryDemandInstance, field: 'quantity')}" />
</div>

