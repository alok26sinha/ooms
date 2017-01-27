
<%@ page import="com.cimbidia.wm.core.rg.RatingLane" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'ratingLane.label', default: 'RatingLane')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ratingLaneInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${ratingLaneInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form method="post" >
            	<fieldset>
	                <g:hiddenField name="id" value="${ratingLaneInstance?.id}" />
	                <g:hiddenField name="version" value="${ratingLaneInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
								<g:render template='form' model="[ratingLaneInstance:ratingLaneInstance]"/>
	                    		 
	                        	
	                        	<tr>
	                        	
	                        	<table>
		                    		 	<div>
											<label class="section-header" for='carriers'>
												<warehouse:message code="default.carriers.label" default="Carriers"/>
											</label>
										</div>
										<thead>
											<tr id="carrierHead">
												<th/>
												<th>
													Carrier
												</th>
												
												<th>
													Secondary Carrier
												</th>
												<th>
													Mode
												</th>
												<th>
													Temperature control
												</th>
												<th>
													Service Level
												</th>
												<th>
													Frequency
												</th>
												<th>
													Equipment
												</th>
												<th>
													Payee
												</th>
												<th>
													Rate
												</th>
												<th>
													Total Cost
												</th>
											</tr>
									</thead>
									<tbody id="carrierBody">
								
										 <g:if test="${ratingLaneInstance?.ratingLaneCarrierList?.size() > 0}">	          					
				          					<g:render template='ratingLaneCarrier' collection="${ratingLaneInstance?.ratingLaneCarrierList}" var="ratingLaneCar" model="['i':ratingLaneCar?.id]"/>
										</g:if>
										<div>
										<g:render template='ratingLaneCarrier' model="['ratingLaneCar':null,'i':'_clone','hidden':true]"/>
										</div>	
									</tbody>
									</table>
	                        	</tr>
	                        	<tr>
									<td id="addCarrier">
											<g:link controller="ratingLaneCarrier" action="create" params="['ratingLane.id': ratingLaneInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'ratingLaneCarrier.label', default: 'RatingLaneCarrier')])}</g:link>
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
