

<%@ page import="com.cimbidia.wm.core.rg.RoutingGuide" %>
<%@ page import="com.cimbidia.wm.core.rg.RatingRoutingLocationType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'routingGuide.label', default: 'RoutingGuide')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${routingGuideInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${routingGuideInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
            	<div class="content_inner">
					<label class="pagetitle">${warehouse.message(code: 'default.button.createRoutingGuide.label', default: 'Create Routing Guide')}</label>
				</div>
            	
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                      <g:render template='form' model="[routingGuideInstance:routingGuideInstance]"/>

		                        <tr class="prop">
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="save" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
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
