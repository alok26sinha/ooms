<%@ page import="com.cimbidia.scm.oms.Inventory" %>



<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="inventory.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="inventory.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${inventoryInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="inventory.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${inventoryInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="inventory.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${inventoryInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'allocQty', 'error')} required">
	<label for="allocQty">
		<g:message code="inventory.allocQty.label" default="Alloc Qty" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="allocQty" value="${fieldValue(bean: inventoryInstance, field: 'allocQty')}" />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="inventory.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${inventoryInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'inventoryStatus', 'error')} required">
	<label for="inventoryStatus">
		<g:message code="inventory.inventoryStatus.label" default="Inventory Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="inventoryStatus.id" from="${com.cimbidia.scm.oms.InventoryStatus.list()}" optionKey="id" value="${inventoryInstance?.inventoryStatus?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="inventory.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="location.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${inventoryInstance?.location?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="inventory.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${inventoryInstance?.product?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inventoryInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="inventory.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quantity" value="${fieldValue(bean: inventoryInstance, field: 'quantity')}" />
</div>

