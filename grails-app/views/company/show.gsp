
<%@ page import="com.cimbidia.scm.admin.Company" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'company.label', default: 'Company')}" />
        <title><warehouse:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <%--<tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.companyId.label" default="Company Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "companyId")}</td>
                            
                        </tr>
                    
                        --%><tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.companyName.label" default="Company Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "companyName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactAddress1.label" default="Contact Address1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactAddress1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactAddress2.label" default="Contact Address2" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactAddress2")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactCountry.label" default="Contact Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactEmail.label" default="Contact Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactName.label" default="Contact Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactPhone.label" default="Contact Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactPhone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactState.label" default="Contact State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactState")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.contactZip.label" default="Contact Zip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "contactZip")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.createdDttm.label" default="Create Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${companyInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.lastUpdatedDttm.label" default="Last Updated Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${companyInstance?.lastUpdatedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.logo.label" default="Logo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "logo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.parentCompanyId.label" default="Parent Company Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: companyInstance, field: "parentCompanyId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.type.label" default="Type" /></td>
                             
                            <td valign="top" class="value"> <g:selectCOMP name="type" optionKey="type" value="${companyInstance?.type}"/></td>
                            
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="company.carrierMots.label" default="Carrier Mots" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${companyInstance.carrierMots}" var="c">
                                    <li><g:link controller="carrierMot" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${companyInstance?.id}" />
					                    <g:actionSubmit class="edit" action="edit" value="${warehouse.message(code: 'default.button.edit.label', default: 'Edit')}" />
					                    <g:actionSubmit class="delete" action="delete" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					                </g:form>
					            </div>
							</td>
						</tr>                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
