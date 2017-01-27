
<%@ page import="com.cimbidia.scm.oms.AllocationTemplate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationTemplate.label', default: 'AllocationTemplate')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${allocationTemplateInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${allocationTemplateInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="update" method="post" >
            <input type="hidden" name='id' value="${allocationTemplateInstance?.id?.encodeAsHTML()}"/>
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                           <tr><td>
	                        		<label class="section-header" >Allocation Template</label>
	                        		</td>
	                        	</tr>
	                        
	                           <table>
	                        	<tbody>
	                        	<table>
										<tr>
											<td/>
											<td  id="horizontalLine"/>
											<td/>
										</tr>
								</table>
	                        	<tr><td>
	                        		<label class="section-header" >Filter Orders to Allocate</label>
	                        		</td>
	                        	</tr>
	                        	<br/>
	                        	<br/>
	                        	<br/>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="customer"><warehouse:message code="allocationTemplate.customer.label" default="Customer" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'customer', 'errors')}">
	                                    <g:selectCustomer name="customer.id" optionKey="id" value="${allocationTemplateInstance?.customer?.id}"  />
	                                    
	                                </td>
	                            	  <td valign="top" class="name">
	                                    <label for="status"><warehouse:message code="allocationTemplate.status.label" default="Status" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'status', 'errors')}">
	                                    <g:select name="status" from="${com.cimbidia.wm.customerOrder.CustomerOrderStatus?.values()-com.cimbidia.wm.customerOrder.CustomerOrderStatus.ALLOCATED}" value="${allocationTemplateInstance?.status}"  />
	                                </td>
	                                <td valign="top" class="name">
	                                    <label for="dueDate"><warehouse:message code="allocationTemplate.dueDate.label" default="Due Date" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'dueDate', 'errors')}">
	                                    <g:jqueryDatePicker name="dueDate" precision="minute" value="${allocationTemplateInstance?.dueDate}"  />
	                                </td>
	                           		 <td valign="top" class="name">
	                                    <label for="shipTo"><warehouse:message code="allocationTemplate.shipTo.label" default="Ship To" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'shipTo', 'errors')}">
	                                    <g:select name="shipTo.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${allocationTemplateInstance?.shipTo?.id}"  />
	                                </td>
	                                <td valign="top" class="name">
	                                    <label for="orderNumber"><warehouse:message code="allocationTemplate.orderNumber.label" default="Order Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'orderNumber', 'errors')}">
	                                    <g:textField name="orderNumber" value="${allocationTemplateInstance?.orderNumber}" />
	                                </td>
	                           		
	                              
	                           
	                              
	                            </tr>
	                             <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.show.label', default: 'Show Filtered Orders')}" />
						                   
						                     
						                </div>                        	
		                        	</td>
		                        </tr>
	                             <table>
											<tr>
												<td/>
												<td  id="horizontalLine"/>
												<td/>
											</tr>
									</table>
	                            </tbody>
	                    </table>
	                   
	                    	<table>
	                        	<tbody>
	                        	<tr><td>
	                        		<label class="section-header" >Apply Allocation Rule</label>
	                        		</td><td></td>
	                        	</tr>
	                        		<br/>
	                        
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="rule"><warehouse:message code="allocationTemplate.rule.label" default="Allocation Rule" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'rule', 'errors')}">
	                                    <g:select name="rule.id" from="${com.cimbidia.scm.oms.AllocationRule.list()}" optionKey="id" value="${allocationTemplateInstance?.rule?.id}"  />
	                                </td>
	                            </tr>
	                            <table>
										<tr>
											<td/>
											<td  id="horizontalLine"/>
											<td/>
										</tr>
								</table>
	                          </tbody>
	                    </table>
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:actionSubmit action="run" value="${warehouse.message(code: 'default.button.run.label', default: 'Run Template')}" />
						                    <g:submitButton name="save" class="save" value="${warehouse.message(code: 'default.button.save.label', default: 'Save Template')}" />
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
