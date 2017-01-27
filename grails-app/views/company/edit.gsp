
<%@ page import="com.cimbidia.scm.admin.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'company.label', default: 'Company')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
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
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${companyInstance?.id}" />
	                <g:hiddenField name="version" value="${companyInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody><%--
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="companyId"><warehouse:message code="company.companyId.label" default="Company Id" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'companyId', 'errors')}">
	                                    <g:textField name="companyId" value="${fieldValue(bean: companyInstance, field: 'companyId')}" />
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
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="createdDttm"><warehouse:message code="company.createdDttm.label" default="Created Dttm" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'createdDttm', 'errors')}">
	                                    <g:datePicker name="createdDttm" precision="minute" value="${companyInstance?.createdDttm}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="company.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${companyInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="lastUpdatedDttm"><warehouse:message code="company.lastUpdatedDttm.label" default="Last Updated Dttm" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'lastUpdatedDttm', 'errors')}">
	                                    <g:datePicker name="lastUpdatedDttm" precision="minute" value="${companyInstance?.lastUpdatedDttm}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="logo"><warehouse:message code="company.logo.label" default="Logo" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'logo', 'errors')}">
	                                    <g:textField name="logo" value="${companyInstance?.logo}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
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
	                                      <g:selectCOMP name="type.id" optionKey="type.id" value="${companyInstance?.type.id}"/>
	                                </td>
	                            </tr>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="carrierMots"><warehouse:message code="company.carrierMots.label" default="Carrier Mots" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: companyInstance, field: 'carrierMots', 'errors')}">
	                                    
										<ul>
										<g:each in="${companyInstance?.carrierMots?}" var="c">
										    <li><g:link controller="carrierMot" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
										</g:each>
										</ul>
										<g:link controller="carrierMot" action="create" params="['company.id': companyInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'carrierMot.label', default: 'CarrierMot')])}</g:link>

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
