
<%@ page import="com.cimbidia.scm.oms.ItemLocation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'itemLocation.label', default: 'ItemLocation')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${itemLocationInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${itemLocationInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${itemLocationInstance?.id}" />
	                <g:hiddenField name="version" value="${itemLocationInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="company"><warehouse:message code="itemLocation.company.label" default="Company" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemLocationInstance, field: 'company', 'errors')}">
	                                    <g:select name="company.id" from="${com.cimbidia.scm.admin.Company.list()}" optionKey="id" value="${itemLocationInstance?.company?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="isActive"><warehouse:message code="itemLocation.isActive.label" default="Is Active" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemLocationInstance, field: 'isActive', 'errors')}">
	                                    <g:checkBox name="isActive" value="${itemLocationInstance?.isActive}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="location"><warehouse:message code="itemLocation.location.label" default="Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemLocationInstance, field: 'location', 'errors')}">
	                                    <g:select name="location.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${itemLocationInstance?.location?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="product"><warehouse:message code="itemLocation.product.label" default="Product" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemLocationInstance, field: 'product', 'errors')}">
	                                    <g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${itemLocationInstance?.product?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="safetyStock"><warehouse:message code="itemLocation.safetyStock.label" default="Safety Stock" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemLocationInstance, field: 'safetyStock', 'errors')}">
	                                    <g:textField name="safetyStock" value="${fieldValue(bean: itemLocationInstance, field: 'safetyStock')}" />
	                                </td>
	                            </tr>
	                        	                        
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.update.label', default: 'Update')}" />
						                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						                </div>
		    						</td>                    	
	                        	</tr>	                        
	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
