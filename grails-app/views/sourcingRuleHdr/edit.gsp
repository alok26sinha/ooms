
<%@ page import="com.cimbidia.scm.oms.SourcingRuleHdr" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" default="Create Sourcing Rule" /></content>
		
    </head>
    <body >
   		<div class="content_inner">

    	<label class="pagetitle"><warehouse:message code="default.creates.label" args="[entityName]" default="Edit Sourcing Rule"/></label>

		</div>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sourcingRuleHdrInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${sourcingRuleHdrInstance}" as="list" />
	            </div>
            </g:hasErrors>
            
            <g:form action="update" method="post" >
            <input type="hidden" name='id' value="${sourcingRuleHdrInstance?.id?.encodeAsHTML()}"/>
            	<fieldset>
	                <div class="dialog">
	                <table><td>
	                    <table >
	                        <tbody>
	                            <tr class="prop">
	                                <td align="left" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="customer"><warehouse:message code="sourcingRuleHdr.customer.label" default="Customer" /></label>
	                                </td>
	                                <td align="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'customer', 'errors')}">
	                                    <g:autoSuggest id="customer" name="customer"
										jsonUrl="${request.contextPath }/json/customerLookup"
										valueId="${sourcingRuleHdrInstance?.customer?.id }"
										valueName="${sourcingRuleHdrInstance?.customer?.companyName }"
										styleClass="text" width="175" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td align="left" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="category"><warehouse:message code="sourcingRuleHdr.category.label" default="Category" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'category', 'errors')}">
	                                    <g:select name="category.id" from="${com.cimbidia.wm.product.Category.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.category?.id}"  noSelection="['':'']"/>
	                                </td>
	                            </tr>
	                        
	                          
	                        
	                            <tr class="prop">
	                                <td align="left" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="fulfillmentType"><warehouse:message code="sourcingRuleHdr.fulfillmentType.label" default="Fulfillment Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'fulfillmentType', 'errors')}">
	                                    <g:select name="fulfillmentType.id" from="${com.cimbidia.scm.oms.FulfillmentType.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.fulfillmentType}"  />
	                                </td>
	                            </tr>
	                        </tbody></table></td><td>
	                        
                    		<table></tbody>
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="locationType"><warehouse:message code="sourcingRuleHdr.locationType.label" default="Location Type" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'locationType', 'errors')}">
	                                    <g:select name="locationType.id" from="${com.cimbidia.wm.core.LocationType.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.locationType}" noSelection="['':'']"/>
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="product"><warehouse:message code="sourcingRuleHdr.product.label" default="Product" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'product', 'errors')}">
	                                    <g:select name="product.id" from="${com.cimbidia.wm.product.Product.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.product?.id}"  />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="productClass"><warehouse:message code="sourcingRuleHdr.productClass.label" default="Product Class" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'productClass', 'errors')}">
	                                    <g:selectPC name="productClass" optionKey="id"
										value="${sourcingRuleHdrInstance?.productClass?.id}" noSelection="['':'']" />
	                                  
	                                    
	                                </td>
	                            </tr>
	                        </tbody></table></td><td>
                   			 <table></tbody>
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="substitutionAllowed"><warehouse:message code="sourcingRuleHdr.substitutionAllowed.label" default="Substitution Allowed" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'substitutionAllowed', 'errors')}">
	                                    <g:checkBox name="substitutionAllowed" value="${sourcingRuleHdrInstance?.substitutionAllowed}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop" style="white-space: nowrap;text-align: left;">
	                                <td valign="top" class="name">
	                                    <label for="toAddressGeoRegion"><warehouse:message code="sourcingRuleHdr.toAddressGeoRegion.label" default="To Address Geo Region" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'toAddressGeoRegion', 'errors')}">
	                                    <g:textField name="toAddressGeoRegion" value="${sourcingRuleHdrInstance?.toAddressGeoRegion}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name" style="white-space: nowrap;text-align: left;">
	                                    <label for="toLocation"><warehouse:message code="sourcingRuleHdr.toLocation.label" default="To Location" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: sourcingRuleHdrInstance, field: 'toLocation', 'errors')}">
	                                    <g:select name="toLocation.id" from="${com.cimbidia.wm.core.Location.list()}" optionKey="id" value="${sourcingRuleHdrInstance?.toLocation?.id}" noSelection="['':'']" />
	                                </td>
	                            </tr>
	                         </tbody>
	                    </table></td></table>
	                    <table>
											<tr>
												<td/>
												<td  id="horizontalLine"/>
												<td/>
											</tr>
						</table>
	                    <table>
	                    
	                    <tbody>  
	                    <tr><td>
	                        		<label class="section-header" >Sources</label>
	                        		</td><td></td><td></td><td></td>
	                        	</tr>
	                        		<br/>
	                         <tr class="prop">
	                         	<td class="dtl-header" width="22%">
                                    <label for="fromLocation"><warehouse:message code="sourcingRuleDtl.num.label" default="#" /></label>
                                 </td>
	                      		<td class="dtl-header" width="41%">
                                    <label for="fromLocation" ><warehouse:message code="sourcingRuleDtl.fromLocation.label" default="From Location" /></label>
                                 </td>
                                 <td class="dtl-header" width="26%">
                                    <label for="priority"><warehouse:message code="sourcingRuleDtl.priority.label" default="Priority" /></label>
                                </td>
	                         </tr>
	                       </tbody>
	                    </table>  
	                        <div valign="top" class="value ${hasErrors(bean: sourcingRuleHdr, field: 'sourcingRuleDtl', 'errors')}">
						       <!-- Render the sourcingRuleDtls template (__sourcingRuleDtls.gsp) here -->
						       <g:render template="sourcingRuleDtls" model="['sourcingRuleHdr':sourcingRuleHdrInstance]" />
						       <!-- Render the sourcingRuleDtls template (_sourcingRuleDtls.gsp) here -->
						    </div>
	                    <table>
											<tr>
												<td/>
												<td  id="horizontalLine"/>
												<td/>
											</tr>
						</table>     
	                   <table>
	                    <tbody> 
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="save" class="save" value="${warehouse.message(code: 'default.button.edit1.label', default: 'Save')}" />
						                   
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
        
        <!-- Render the sourcingRuleDtl template (_sourcingRuleDtl.gsp) hidden so we can clone it -->
	    <g:render template='sourcingRuleDtl' model="['sourcingRuleDtl':null,'i':'_clone','hidden':true]"/>
	    <!-- Render the sourcingRuleDtl template (_sourcingRuleDtl.gsp) hidden so we can clone it -->
    </body>
</html>
