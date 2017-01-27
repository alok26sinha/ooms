
<%@ page import="com.cimbidia.wm.core.Equipment" %>
<%@ page import="com.cimbidia.wm.core.EquipmentSize" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'equipment.label', default: 'Equipment')}" />
        <title><warehouse:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
	    <g:render template="summary"/>			  
            
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: equipmentInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: equipmentInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: equipmentInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: equipmentInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${equipmentInstance?.createdBy?.id}">${equipmentInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.updatedBy.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${equipmentInstance?.updatedBy?.id}">${equipmentInstance?.updatedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${equipmentInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><warehouse:message code="equipment.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><format:datetime obj="${equipmentInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                    
	                    	<tr class="prop">
				    <td valign="top" class="name"><label><warehouse:message code="default.equipmentsize.label" /></label></td>
				    <td valign="top" class="value">
									<g:if test="${equipmentInstance?.equipmentSizes}">
										<table id="equipmentSize">
											<thead>
												<tr class="odd">
													<th><warehouse:message code="default.uom.label" /></th>
													<th><warehouse:message code="default.value.label" /></th>
													<th><warehouse:message code="default.action.label" /></th>
												</tr>
											</thead>									
											<tbody>
												<g:each var="equipmentSize" in="${equipmentInstance?.equipmentSizes}" status="i">
													<tr class="order-item ${(i % 2) == 0 ? 'even' : 'odd'}">
														<td class="order-item-quantity">
															${equipmentSize?.uom.name}
														</td>
														<td class="order-item-quantity">
															${equipmentSize?.value}
														</td>
														<td align="right">
															<g:link action="deleteSize" id="${equipmentSize.id}" params="['equipment.id':equipmentInstance?.id]" onclick="return confirm('${warehouse.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
																<img src="${createLinkTo(dir:'images/icons',file:'trash.png')}" alt="Delete" />
															</g:link>
														</td>														
													</tr>
												</g:each>
											</tbody>
										</table>
									</g:if>
									<g:else>
										<span class="fade"><warehouse:message code="default.noItems.label" /></span>
									</g:else>
				    </td>
	                        </tr>	 



                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
