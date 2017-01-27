<%@ page import="com.cimbidia.scm.oms.InventoryFuture" %>



<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventoryFuture.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryFutureInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventoryFuture.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryFutureInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventoryFuture.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryFutureInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventoryFuture.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryFutureInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'itemLocation', 'error')} required">
	<label for="itemLocation">
		<g:message code="inventoryFuture.itemLocation.label" default="Item Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="itemLocation.id" from="${com.cimbidia.scm.oms.ItemLocation.list()}" optionKey="id" value="${inventoryFutureInstance?.itemLocation?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'inventoryIdentifier', 'error')} required">
	<label for="inventoryIdentifier">
		<g:message code="inventoryFuture.inventoryIdentifier.label" default="Inventory Identifier" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryIdentifier.id" from="${com.cimbidia.scm.oms.InventoryIdentifier.list()}" optionKey="id" value="${inventoryFutureInstance?.inventoryIdentifier?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="inventoryFuture.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryFutureInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'allocQty', 'error')} required">
	<label for="allocQty">
		<g:message code="inventoryFuture.allocQty.label" default="Alloc Qty" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="allocQty" value="${fieldValue(bean: inventoryFutureInstance, field: 'allocQty')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'averageCost', 'error')} required">
	<label for="averageCost">
		<g:message code="inventoryFuture.averageCost.label" default="Average Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="averageCost" value="${fieldValue(bean: inventoryFutureInstance, field: 'averageCost')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'costCurrency', 'error')} ">
	<label for="costCurrency">
		<g:message code="inventoryFuture.costCurrency.label" default="Cost Currency" />
		
	</label>
	<g:textField name="costCurrency" value="${inventoryFutureInstance?.costCurrency}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="inventoryFuture.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="endDate" precision="minute" value="${inventoryFutureInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'objectDtlId', 'error')} ">
	<label for="objectDtlId">
		<g:message code="inventoryFuture.objectDtlId.label" default="Object Dtl Id" />
		
	</label>
	<g:textField name="objectDtlId" value="${inventoryFutureInstance?.objectDtlId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'objectId', 'error')} ">
	<label for="objectId">
		<g:message code="inventoryFuture.objectId.label" default="Object Id" />
		
	</label>
	<g:textField name="objectId" value="${inventoryFutureInstance?.objectId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'objectType', 'error')} ">
	<label for="objectType">
		<g:message code="inventoryFuture.objectType.label" default="Object Type" />
		
	</label>
	<g:textField name="objectType" value="${inventoryFutureInstance?.objectType}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="inventoryFuture.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: inventoryFutureInstance, field: 'quantity')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="inventoryFuture.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="startDate" precision="minute" value="${inventoryFutureInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryFutureInstance, field: 'unitCost', 'error')} required">
	<label for="unitCost">
		<g:message code="inventoryFuture.unitCost.label" default="Unit Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="unitCost" value="${fieldValue(bean: inventoryFutureInstance, field: 'unitCost')}" />
</div>

