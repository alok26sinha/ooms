
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
   		<div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Create Allocation Template"/></label>

		</div>
    
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${allocationTemplateInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${allocationTemplateInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    
	                        
	                           <table class="allocationTemplate" rules="rows" style="z-index:1;" >
	                        	<tbody>
	                        	
	                        	
	                        		 <tr><td colspan="6" valign="bottom" style="color:blue;" >Filter Orders to Allocate</td></tr>
	                        	
	                        		
	                        	
	                        	
	                            <tr class="prop">
	                                <td valign="top" >
	                                    <label for="customer"  style="white-space: nowrap;text-align: left;"><warehouse:message code="allocationTemplate.customer.label" default="Customer" /></label>
	                                </td>
	                                <td valign="top"  ${hasErrors(bean: allocationTemplateInstance, field: 'customer', 'errors')}">
	                                    <g:selectCustomer name="customer" optionKey="id" value="${allocationTemplateInstance?.customer?.id}" noSelection="['':'']" />
	                                    
	                                </td>
	                            	  <td valign="top"   style="white-space: nowrap;text-align: left;">
	                                    <label for="status"><warehouse:message code="allocationTemplate.status.label" default="Status" /></label>
	                                </td>
	                                <td valign="top"  ${hasErrors(bean: allocationTemplateInstance, field: 'status', 'errors')}">
	                                    <g:select name="status" from="${com.cimbidia.wm.customerOrder.CustomerOrderStatus?.values()-com.cimbidia.wm.customerOrder.CustomerOrderStatus.ALLOCATED}" value="${allocationTemplateInstance?.status}"  noSelection="['':'']"/>
	                                </td>
	                                <td valign="top" class="name"  style="white-space: nowrap;text-align: left;">
	                                    <label for="dueDate"><warehouse:message code="allocationTemplate.dueDate.label" default="Due Date" /></label>
	                                </td>
	                                <td valign="top" class="value" ${hasErrors(bean: allocationTemplateInstance, field: 'dueDate', 'errors')}">
	                                    <g:jqueryDatePicker name="dueDate" precision="minute" value="${allocationTemplateInstance?.dueDate}"  />
	                                </td>
	                           		 <td valign="top"   style="white-space: nowrap;text-align: left;">
	                                    <label for="shipTo"><warehouse:message code="allocationTemplate.shipTo.label" default="Ship To" /></label>
	                                </td>
	                                <td valign="top"  ${hasErrors(bean: allocationTemplateInstance, field: 'shipTo', 'errors')}">
	                                    <g:select name="shipTo" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${allocationTemplateInstance?.shipTo?.id}" noSelection="['':'']" />
	                                </td>
	                                <td valign="top"   style="white-space: nowrap;text-align: left;">
	                                    <label for="orderNumber"><warehouse:message code="allocationTemplate.orderNumber.label" default="Order Number" /></label>
	                                </td>
	                                <td valign="top" ${hasErrors(bean: allocationTemplateInstance, field: 'orderNumber', 'errors')}">
	                                    <g:textField name="orderNumber" value="${allocationTemplateInstance?.orderNumber}" />
	                                </td>
	                           		
	                              
	                           
	                              
	                            </tr>
	                             <tr class="prop">
		                        	<td></td>
		                        	<td></td>
		                        	<td></td>
		                        	<td></td>
		                        	<td colspan="8" valign="top" align="center">
						                <div class="buttons">

						                  
						                   <input type="button"  class="orderlist-dialog" value="${warehouse.message(code: 'default.button.show.label', default: 'Show Filtered Orders')}" />						                     
											
						                </div>                        	
		                        	</td>
		                        </tr>
	                             
	                            </tbody>
	                    </table>
	                   
	                    	<table  class="allocationTemplate" rules="rows" style="z-index:1;">
	                        	<tbody>
	                        	 <tr><td colspan="6" valign="bottom" style="color:blue;" >Apply Allocation Rule</td></tr>
	                        	
	                        		
	                        
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="rule"><warehouse:message code="allocationTemplate.rule.label" default="Allocation Rule" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationTemplateInstance, field: 'rule', 'errors')}">
	                                    <g:select name="rule.id" from="${com.cimbidia.scm.oms.AllocationRule.list()}" optionKey="id" value="${allocationTemplateInstance?.rule?.id}"  />
	                                </td>
	                            </tr>
	                           
	                          </tbody>
	                    </table>
	                    <table>
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:actionSubmit action="run" value="${warehouse.message(code: 'default.button.run.label', default: 'Run Template')}" />
						                    <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.save.label', default: 'Save Template')}" />
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
						                </div>                        	
		                        	</td>
		                        </tr>
		                        </table>
	                       
	                </div>
                </fieldset>
            </g:form>
        </div>
        <div id="dialog-orderList" title="Filtered Customer Order(s)">
	   <g:render template="filteredOrderlist" model="[customerOrders:customerOrders]" />
	   
	   </div>
    </body>
</html>
