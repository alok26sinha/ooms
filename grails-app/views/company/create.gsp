
<%@ page import="com.cimbidia.scm.admin.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'company.label', default: 'Company')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${companyInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <%--<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="id"><warehouse:message code="company.id.label" default="Company Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'id', 'errors')}">
	                                    <g:textField name="id" value="${fieldValue(bean: companyInstance, field: 'id')}" />
	                                </td>
	                            </tr>
	                        
	                            --%><tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="companyName"><warehouse:message code="company.companyName.label" default="Company Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'companyName', 'errors')}">
	                                    <g:textField name="companyName" value="${companyInstance?.companyName}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactAddress1"><warehouse:message code="company.contactAddress1.label" default="Contact Address1" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactAddress1', 'errors')}">
	                                    <g:textField name="contactAddress1" value="${companyInstance?.contactAddress1}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactAddress2"><warehouse:message code="company.contactAddress2.label" default="Contact Address2" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactAddress2', 'errors')}">
	                                    <g:textField name="contactAddress2" value="${companyInstance?.contactAddress2}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactCountry"><warehouse:message code="company.contactCountry.label" default="Contact Country" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactCountry', 'errors')}">
	                                    <g:textField name="contactCountry" value="${companyInstance?.contactCountry}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactEmail"><warehouse:message code="company.contactEmail.label" default="Contact Email" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactEmail', 'errors')}">
	                                    <g:textField name="contactEmail" value="${companyInstance?.contactEmail}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactName"><warehouse:message code="company.contactName.label" default="Contact Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactName', 'errors')}">
	                                    <g:textField name="contactName" value="${companyInstance?.contactName}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactPhone"><warehouse:message code="company.contactPhone.label" default="Contact Phone" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactPhone', 'errors')}">
	                                    <g:textField name="contactPhone" value="${companyInstance?.contactPhone}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactState"><warehouse:message code="company.contactState.label" default="Contact State" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactState', 'errors')}">
	                                    <g:textField name="contactState" value="${companyInstance?.contactState}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="contactZip"><warehouse:message code="company.contactZip.label" default="Contact Zip" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'contactZip', 'errors')}">
	                                    <g:textField name="contactZip" value="${companyInstance?.contactZip}" />
	                                </td>
	                            </tr>
	                        
	                            <%--<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="createDttm"><warehouse:message code="company.createDttm.label" default="Create Dttm" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'createDttm', 'errors')}">
	                                    <g:datePicker name="createDttm" precision="minute" value="${companyInstance?.createDttm}"  />
	                                </td>
	                            </tr>
	                        
	                            --%><tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="description"><warehouse:message code="company.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${companyInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            
	                        
	                            <%--<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="logo"><warehouse:message code="company.logo.label" default="Logo" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'logo', 'errors')}">
	                                    <g:textField name="logo" value="${companyInstance?.logo}" />
	                                </td>
	                            </tr>
	                        
	                            --%><tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="parentCompanyId"><warehouse:message code="company.parentCompanyId.label" default="Parent Company Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'parentCompanyId', 'errors')}">
	                                    <g:textField name="parentCompanyId" value="${fieldValue(bean: companyInstance, field: 'parentCompanyId')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="type"><warehouse:message code="company.type.label" default="Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'type', 'errors')}">
	                                    <g:selectCOMP name="type.id" value="${companyInstance?.type?.id}"/>
									</td>
	                            </tr>
	                        
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
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
