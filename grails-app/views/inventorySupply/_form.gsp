<%@ page import="com.cimbidia.scm.oms.InventorySupply" %>



<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventorySupply.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventorySupplyInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventorySupply.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventorySupplyInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventorySupply.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventorySupplyInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventorySupply.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventorySupplyInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'inventorySupplyType', 'error')} ">
	<label for="inventorySupplyType">
		<g:message code="inventorySupply.inventorySupplyType.label" default="Inventory Supply Type" />
		
	</label>
	<g:select name="inventorySupplyType.id" from="${com.cimbidia.scm.oms.InventorySupplyType.list()}" optionKey="id" value="${inventorySupplyInstance?.inventorySupplyType?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'itemLocation', 'error')} ">
	<label for="itemLocation">
		<g:message code="inventorySupply.itemLocation.label" default="Item Location" />
		
	</label>
	<g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventorySupplyInstance?.itemLocation?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="inventorySupply.company.label" default="Company" />
		
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventorySupplyInstance?.company?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="inventorySupply.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="endDate" precision="minute" value="${inventorySupplyInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'inventoryIdentifier', 'error')} required">
	<label for="inventoryIdentifier">
		<g:message code="inventorySupply.inventoryIdentifier.label" default="Inventory Identifier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventorySupplyInstance?.inventoryIdentifier?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="inventorySupply.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: inventorySupplyInstance, field: 'quantity')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="inventorySupply.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="startDate" precision="minute" value="${inventorySupplyInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'supplyReferenceType', 'error')} ">
	<label for="supplyReferenceType">
		<g:message code="inventorySupply.supplyReferenceType.label" default="Supply Reference Type" />
		
	</label>
	<g:textField name="supplyReferenceType" value="${inventorySupplyInstance?.supplyReferenceType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventorySupplyInstance, field: 'supplyReferences', 'error')} ">
	<label for="supplyReferences">
		<g:message code="inventorySupply.supplyReferences.label" default="Supply References" />
		
	</label>
	<g:textField name="supplyReferences" value="${inventorySupplyInstance?.supplyReferences}" />
</div>

