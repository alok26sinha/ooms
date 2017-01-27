
<%@ page import="com.cimbidia.wm.booking.Booking" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'booking.label', default: 'Booking')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.create.label" args="[entityName]" /></content>
		<script>
		$(function (){
		
			
			
		}); //end onload func
		</script>
    </head>
    <body>
     <div>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bookingInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${bookingInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <div class="content_inner">
					<label class="pagetitle">${warehouse.message(code: 'bookingCreate.label', default: 'Create Booking')}</label>
			</div>
            
           <g:form action="save" method="post" >

            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        	<g:hiddenField name="fromPage" value="create"/>
	                            <g:render template='form' model="[bookingInstance:bookingInstance]"/>
	                        
		                        <tr class="prop">
		                        	<td valign="top"></td>
		                        	<td valign="top">
						                <div class="buttons">
						                   <g:submitButton name="create" class="btn" action="save" btnPress="save"  value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />
						                   
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
        </div>
    </body>
</html>