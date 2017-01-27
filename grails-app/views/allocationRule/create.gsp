
<%@ page import="com.cimbidia.scm.oms.AllocationRule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'allocationRule.label', default: 'AllocationRule')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
    	<div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Create Allocation Rule"/></label>

		</div>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${allocationRuleInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${allocationRuleInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    
	      	                           <table class="allocationTable" style="z-index:100;">
	                        	 <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="description"><warehouse:message code="allocationRule.description.label" default="Description" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationRuleInstance, field: 'description', 'errors')}">
	                                    <g:textField name="description" value="${allocationRuleInstance?.description}" />
	                                </td>
	                            </tr>
	                          </table>
	                          <table rules="rows" class="allocationTable" style="z-index:100;">
	                          <tr><td colspan="6" valign="bottom" style="color:blue;" >Inventory Considerations</td></tr>
	                            <tr  class="prop" style="height:60px">
	                               
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="considerFutureInventory"><warehouse:message code="allocationRule.considerFutureInventory.label" default="Consider Future Inventory" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'considerFutureInventory', 'errors')}">
	                                    <g:checkBox name="considerFutureInventory" value="${allocationRuleInstance?.considerFutureInventory}" />
	                                </td> 	
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="applyOnHandSafetyFactor"><warehouse:message code="allocationRule.applyOnHandSafetyFactor.label" default="Apply Safety Factor" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;"class="value ${hasErrors(bean: allocationRuleInstance, field: 'applyOnHandSafetyFactor', 'errors')}">
	                                    <g:checkBox name="applyOnHandSafetyFactor" value="${allocationRuleInstance?.applyOnHandSafetyFactor}" />
	                                </td>
	                                
	                               
	                                <%--<td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="applyFutureSafetyFactor"><warehouse:message code="allocationRule.applyFutureSafetyFactor.label" default="Apply Future Safetey Factor" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'applyFutureSafetyFactor', 'errors')}">
	                                    <g:checkBox name="applyFutureSafetyFactor" value="${allocationRuleInstance?.applyFutureSafetyFactor}" />
	                                </td>
	                                --%><td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for=""><warehouse:message code="allocationRule.honorPriorCommittments.label" default="Honor Prior Committments" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'honorPriorCommittments', 'errors')}">
	                                    <g:checkBox name="honorPriorCommittments" value="${allocationRuleInstance?.honorPriorCommittments}" />
	                                </td>
	                            </tr>
	                            </table>
	                         <br/>
	                        <table class="allocationTable" rules="rows" style="z-index:100;">
	                          <tr><td colspan="8" valign="bottom" style="color:blue;">Shipping Constraints</td></tr>
	                          <tr class="prop"  style="height:60px">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="shipComplete"><warehouse:message code="allocationRule.shipComplete.label" default="Ship Complete" /></label>
	                                </td>
	                                <td valign="top"  style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'shipComplete', 'errors')}">
	                                    <g:checkBox name="shipComplete" value="${allocationRuleInstance?.shipComplete}" />
	                                </td>
	                           
	                                <td valign="top"   class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="shipSingleLocation"><warehouse:message code="allocationRule.shipSingleLocation.label" default="Ship Single Location" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'shipSingleLocation', 'errors')}">
	                                    <g:checkBox name="shipSingleLocation" value="${allocationRuleInstance?.shipSingleLocation}" />
	                                </td>
	                           
	                                <td valign="top"   class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="lineShipComplete"><warehouse:message code="allocationRule.lineShipComplete.label" default="Line Ship Complete" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'lineShipComplete', 'errors')}">
	                                    <g:checkBox name="lineShipComplete" value="${allocationRuleInstance?.lineShipComplete}" />
	                                </td>
	                           
	                                <td valign="top"  style="width:50px;" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="lineShipSingleLocation"><warehouse:message code="allocationRule.lineShipSingleLocation.label" default="Line Ship Single Location" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'lineShipSingleLocation', 'errors')}">
	                                    <g:checkBox name="lineShipSingleLocation" value="${allocationRuleInstance?.lineShipSingleLocation}" />
	                                </td>
	                            </tr>
	                        
	                            </table>
	                          
	                        
	                          <br/>
	                         <table class="allocationTable" rules="rows">
	                          <tr><td colspan="2" valign="bottom" style="color:blue;">Optimize on</td></tr>
	                           
	                            <tr class="prop" style="height:60px">
	                                <td valign="top" class="name">
	                                    <label for="optimizationType"><warehouse:message code="allocationRule.optimizationType.label" default="Optimization Type" /></label>
	                                </td>
	                                <td valign="top" style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'optimizationType', 'errors')}">
	                                   <g:select name="optimizationType.id" from="${com.cimbidia.scm.oms.OptimizationType.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.optimizationType?.id}"  />
	                                   
	                                  
	                                </td>
	                            </tr>
	                        </table>
	                        <br/>
	                         <table class="allocationTable" rules="rows">
	                          <tr><td colspan="4" valign="bottom" style="color:blue;">When Optimize on Priority </td></tr>
	                            <tr class="prop" style="height:60px">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="weightToDistance"><warehouse:message code="allocationRule.weightToDistance.label" default="Weight To Distance" /></label>
	                                </td>
	                                <td valign="top"style="width:50px;" class="value ${hasErrors(bean: allocationRuleInstance, field: 'weightToDistance', 'errors')}">
	                                    <g:textField name="weightToDistance" value="${fieldValue(bean: allocationRuleInstance, field: 'weightToDistance')}" />
	                                </td>
	                           
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="weightToLocation"><warehouse:message code="allocationRule.weightToLocation.label" default="Weight To Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationRuleInstance, field: 'weightToLocation', 'errors')}">
	                                    <g:textField name="weightToLocation" value="${fieldValue(bean: allocationRuleInstance, field: 'weightToLocation')}" />
	                                </td>
	                            </tr>
	                        
	                        </table><br/>
	                         <table class="allocationTable" rules="rows">
	                          <tr><td colspan="2" valign="bottom" style="color:blue;">Finalization Strategy </td></tr>
	                            <tr class="prop">
	                                <td valign="top" class="name"style="white-space: nowrap;text-align: left;">
	                                    <label for="cancelOrderOnFail"><warehouse:message code="allocationRule.cancelOrderOnFail.label" default="Cancel Order On Fail" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: allocationRuleInstance, field: 'cancelOrderOnFail', 'errors')}">
	                                    <g:checkBox name="cancelOrderOnFail" value="${allocationRuleInstance?.cancelOrderOnFail}" />
	                                </td>
	                            </tr>
	                            
	                        </table>
	                        <table class="allocationTable" rules="rows">
		                        <tr class="prop" colspan="2" valign="bottom">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
						                   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
						                   
						                </div>                        	
		                        	</td>
		                        </tr>
		                        
	                         </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
