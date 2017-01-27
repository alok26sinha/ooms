<%@ page import="com.cimbidia.scm.oms.ItemLocation" %>



<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="itemLocation.createdBy.label" default="Created By" />
		
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${itemLocationInstance?.createdBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'modifiedBy', 'error')} ">
	<label for="modifiedBy">
		<g:message code="itemLocation.modifiedBy.label" default="Modified By" />
		
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${itemLocationInstance?.modifiedBy?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'createdDttm', 'error')} ">
	<label for="createdDttm">
		<g:message code="itemLocation.createdDttm.label" default="Created Dttm" />
		
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${itemLocationInstance?.createdDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'modifiedDttm', 'error')} ">
	<label for="modifiedDttm">
		<g:message code="itemLocation.modifiedDttm.label" default="Modified Dttm" />
		
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${itemLocationInstance?.modifiedDttm}" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="itemLocation.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${itemLocationInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="itemLocation.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${itemLocationInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="itemLocation.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="location.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${itemLocationInstance?.location?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="itemLocation.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${itemLocationInstance?.product?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: itemLocationInstance, field: 'safetyStock', 'error')} required">
	<label for="safetyStock">
		<g:message code="itemLocation.safetyStock.label" default="Safety Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="safetyStock" value="${fieldValue(bean: itemLocationInstance, field: 'safetyStock')}" />
</div>

