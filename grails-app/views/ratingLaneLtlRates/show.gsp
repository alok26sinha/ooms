
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneLtlRates" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates')}" />
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
                            <td valign="top" class="name"><warehouse:message code="ratingLaneLtlRates.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneLtlRatesInstance, field: "id")}</td>
                            
                        </tr>
                    
                        
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLaneLtlRates.ltlClass.label" default="Ltl Class" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneLtlRatesInstance, field: "ltlClass")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLaneLtlRates.rate.label" default="Rate" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ratingLaneLtlRatesInstance, field: "rate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="ratingLaneLtlRates.ratingLaneCarrier.label" default="Rating Lane Carrier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="ratingLaneCarrier" action="show" id="${ratingLaneLtlRatesInstance?.ratingLaneCarrier?.id}">${ratingLaneLtlRatesInstance?.ratingLaneCarrier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${ratingLaneLtlRatesInstance?.id}" />
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
