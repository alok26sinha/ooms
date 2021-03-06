
<%@ page import="com.cimbidia.wm.core.rg.RatingLaneLtlRates" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLaneLtlRates.label', default: 'RatingLaneLtlRates')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ratingLaneLtlRatesInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${ratingLaneLtlRatesInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${ratingLaneLtlRatesInstance?.id}" />
	                <g:hiddenField name="version" value="${ratingLaneLtlRatesInstance?.version}" />
	                 <g:hiddenField name="ratingLaneCarrier.id" value="${ratingLaneLtlRatesInstance?.ratingLaneCarrier?.id}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                          
	                      
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="ltlClass"><warehouse:message code="ratingLaneLtlRates.ltlClass.label" default="Ltl Class" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'ltlClass', 'errors')}">
	                                    <g:selectCMDT style="width:150px;"name="ltlClass" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'ltlClass')}" />
	                                </td>
	                            </tr>
	                            
	                         
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="rate"><warehouse:message code="ratingLaneLtlRates.rate.label" default="Rate" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'rate', 'errors')}">
	                                    <g:textField style="width:150px;" name="rate" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'rate')}" />
	                                </td>
	                            </tr>
	                            
	                             <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="rate"><warehouse:message code="ratingLaneLtlRates.fromZone.label" default="Source Zone" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'fromZone', 'errors')}">
	                                    <g:textField style="width:150px;" name="fromZone" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'fromZone')}" />
	                                </td>
	                            </tr>
	                            
	                             <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left ; padding:0px;">
	                                    <label for="rate"><warehouse:message code="ratingLaneLtlRates.toZone.label" default="Destination Zone" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: ratingLaneLtlRatesInstance, field: 'toZone', 'errors')}">
	                                    <g:textField style="width:150px;" name="toZone" value="${fieldValue(bean: ratingLaneLtlRatesInstance, field: 'toZone')}" />
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
