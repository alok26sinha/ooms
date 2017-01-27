<%@ page import="com.cimbidia.scm.oms.AllocationTemplate" %>



<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'company', 'error')} required">
	<label for="company">
		<g:message code="allocationTemplate.company.label" default="Company" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${allocationTemplateInstance?.company?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="allocationTemplate.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="createdBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${allocationTemplateInstance?.createdBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'createdDttm', 'error')} required">
	<label for="createdDttm">
		<g:message code="allocationTemplate.createdDttm.label" default="Created Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="createdDttm" precision="minute" value="${allocationTemplateInstance?.createdDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'customer', 'error')} required">
	<label for="customer">
		<g:message code="allocationTemplate.customer.label" default="Customer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="customer.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${allocationTemplateInstance?.customer?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'dueDate', 'error')} required">
	<label for="dueDate">
		<g:message code="allocationTemplate.dueDate.label" default="Due Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="dueDate" precision="minute" value="${allocationTemplateInstance?.dueDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'modifiedBy', 'error')} required">
	<label for="modifiedBy">
		<g:message code="allocationTemplate.modifiedBy.label" default="Modified By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="modifiedBy.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${allocationTemplateInstance?.modifiedBy?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'modifiedDttm', 'error')} required">
	<label for="modifiedDttm">
		<g:message code="allocationTemplate.modifiedDttm.label" default="Modified Dttm" />
		<span class="required-indicator">*</span>
	</label>
	<g:jqueryDatePicker name="modifiedDttm" precision="minute" value="${allocationTemplateInstance?.modifiedDttm}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'orderNumber', 'error')} ">
	<label for="orderNumber">
		<g:message code="allocationTemplate.orderNumber.label" default="Order Number" />
		
	</label>
	<g:textField name="orderNumber" value="${allocationTemplateInstance?.orderNumber}" />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'rule', 'error')} required">
	<label for="rule">
		<g:message code="allocationTemplate.rule.label" default="Rule" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rule.id" from="${com.cimbidia.scm.oms.AllocationRule.list()}" optionKey="id" value="${allocationTemplateInstance?.rule?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'shipTo', 'error')} required">
	<label for="shipTo">
		<g:message code="allocationTemplate.shipTo.label" default="Ship To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="shipTo.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${allocationTemplateInstance?.shipTo?.id}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: allocationTemplateInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="allocationTemplate.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.cimbidia.wm.customerOrder.CustomerOrderStatus?.values()}" value="${allocationTemplateInstance?.status}"  />
</div>

