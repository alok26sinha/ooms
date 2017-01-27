
<%@ page import="com.cimbidia.scm.oms.SourcingRuleHdr" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'sourcingRuleHdr.label', default: 'SourcingRuleHdr')}" />
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
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleHdrInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${sourcingRuleHdrInstance?.createdBy?.id}">${sourcingRuleHdrInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${sourcingRuleHdrInstance?.modifiedBy?.id}">${sourcingRuleHdrInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    </tbody></table>
                    <table></tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.createdDttm.label" default="Created Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${sourcingRuleHdrInstance?.createdDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.lastUpdatedDttm.label" default="Last Updated Dttm" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${sourcingRuleHdrInstance?.lastUpdatedDttm}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.buyer.label" default="Buyer" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${sourcingRuleHdrInstance?.buyer?.id}">${sourcingRuleHdrInstance?.buyer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    </tbody></table>
                    <table></tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.category.label" default="Category" /></td>
                            
                            <td valign="top" class="value"><g:link controller="category" action="show" id="${sourcingRuleHdrInstance?.category?.id}">${sourcingRuleHdrInstance?.category?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value"><g:link controller="company" action="show" id="${sourcingRuleHdrInstance?.company?.id}">${sourcingRuleHdrInstance?.company?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.fulfillmentType.label" default="Fulfillment Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="fulfillmentType" action="show" id="${sourcingRuleHdrInstance?.fulfillmentType?.id}">${sourcingRuleHdrInstance?.fulfillmentType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    </tbody></table>
                    <table></tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.locationType.label" default="Location Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleHdrInstance, field: "locationType")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.product.label" default="Product" /></td>
                            
                            <td valign="top" class="value"><g:link controller="product" action="show" id="${sourcingRuleHdrInstance?.product?.id}">${sourcingRuleHdrInstance?.product?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.productClass.label" default="Product Class" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleHdrInstance, field: "productClass")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.substitutionAllowed.label" default="Substitution Allowed" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${sourcingRuleHdrInstance?.substitutionAllowed}" /></td>
                  </tbody></table>
                    <table></tbody>          
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.toAddressGeoRegion.label" default="To Address Geo Region" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sourcingRuleHdrInstance, field: "toAddressGeoRegion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="sourcingRuleHdr.toLocation.label" default="To Location" /></td>
                            
                            <td valign="top" class="value"><g:link controller="location" action="show" id="${sourcingRuleHdrInstance?.toLocation?.id}">${sourcingRuleHdrInstance?.toLocation?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    
						<tr class="prop">
                        	<td valign="top"></td>
                        	<td valign="top">                         
					            <div class="buttons">
					                <g:form>
					                    <g:hiddenField name="id" value="${sourcingRuleHdrInstance?.id}" />
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
