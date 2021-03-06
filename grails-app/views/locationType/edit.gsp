
<%@ page import="com.cimbidia.wm.core.LocationType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'locationType.label', default: 'LocationType')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationTypeInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${locationTypeInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${locationTypeInstance?.id}" />
	                <g:hiddenField name="version" value="${locationTypeInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><warehouse:message code="default.name.label" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: locationTypeInstance, field: 'name', 'errors')}">
	                                    <g:textField name="name" value="${locationTypeInstance?.name}" />
	                                </td>
	                            </tr>
	                        	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="description"><warehouse:message code="default.description.label" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: locationTypeInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${locationTypeInstance?.description}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="sortOrder"><warehouse:message code="default.sortOrder.label" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: locationTypeInstance, field: 'sortOrder', 'errors')}">
	                                    <g:textField name="sortOrder" value="${fieldValue(bean: locationTypeInstance, field: 'sortOrder')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
										<label for="supportedActivities"><warehouse:message code="locationType.supportedActivities.label" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: locationTypeInstance, field: 'supportedActivities', 'errors')}">
	                                	<g:set var="activityList" value="${com.cimbidia.wm.core.ActivityCode.list() }"/>
	                                	<g:select name="supportedActivities" multiple="true" from="${activityList }" size="${activityList.size() }" style="width: 300px" 
	                                		optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${locationTypeInstance?.supportedActivities}" />
	                                </td>
	                            </tr>	                            
	                        	                        
                            	<tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">                        	
						                <div class="buttons left">
						                    <g:actionSubmit class="save" action="update" value="${warehouse.message(code: 'default.button.save.label', default: 'Save')}" />
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
