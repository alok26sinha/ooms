
<%@ page import="com.cimbidia.wm.core.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'warehouse.label', default: 'Location')}" />
        <title><warehouse:message code="default.edit.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.edit.label" args="[entityName]" /></content>
		<link rel="stylesheet" href="${createLinkTo(dir:'js/jquery',file:'jquery.colorpicker.css')}" type="text/css" media="screen, projection" />
		<script src="${createLinkTo(dir:'js/jquery/', file:'jquery.colorpicker.js')}" type="text/javascript" ></script>
		<link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.tagsinput/',file:'jquery.tagsinput.css')}" type="text/css" media="screen, projection" />
		<script src="${createLinkTo(dir:'js/jquery.tagsinput/', file:'jquery.tagsinput.js')}" type="text/javascript" ></script>
<%--<fullcal:resources debug="true"/>
<resource:calendarMonthView />
    --%></head>
    <body><%--ABC
    <richui:calendarMonthView items="${appointments}" createLink="true" 
constraintDateFields="['startDate-endDate', 'startDate', 'endDate']" displayField="subject" teaser="true" teaserLength="20" weekOfYear="true" weekAction="week" dayAction="day" month="${month}" action="show" />


        --%><div class="body">
        
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${locationInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${locationInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <g:render template="summary"/>

            <g:form method="post" action="update">
                <g:hiddenField name="id" value="${locationInstance?.id}" />
                <g:hiddenField name="version" value="${locationInstance?.version}" />
                <div class="dialog box">
                    <table>
                        <tbody>
                            <tr class="prop">
                            
                                <td valign="top" class="name">
									<label for="name"><warehouse:message code="default.name.label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'name', 'errors')}">
									<g:textField name="name" value="${locationInstance?.name}" class="text" size="80"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
									<label for="name"><warehouse:message code="location.locationType.label" /></label>
	
                                </td>
                                <td valign="top" class="value">
                                	<g:select name="locationType.id" from="${com.cimbidia.wm.core.LocationType.list()}" 
                                		optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${locationInstance?.locationType?.id}" noSelection="['null':'']" />
                                		
                                	
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
									<label for="name"><warehouse:message code="location.locationGroup.label" /></label>
                                </td>
                                <td valign="top" class="value">
                                	<g:select name="locationGroup.id" from="${com.cimbidia.wm.core.LocationGroup.list()}" optionKey="id" value="${locationInstance?.locationGroup?.id}" noSelection="['null':'']" />
                                </td>
                            </tr>	         
                            <tr class="prop">
                                <td valign="top" class="name">
                                	<label for="manager"><warehouse:message code="warehouse.manager.label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'manager', 'errors')}">
                                %{--	<g:select name="manager.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${locationInstance?.manager?.id}"  noSelection="['null':'']" /> --}%
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
	                                <label for="active"><warehouse:message code="location.properties.label" /></label>
                                </td>
                                <td valign="top" class="value${hasErrors(bean: locationInstance, field: 'active', 'errors')}">
									<div>
										<g:checkBox name="active" value="${locationInstance?.active}" />
										<warehouse:message code="warehouse.active.label" />
									</div>										
									<div>
										<g:checkBox name="local" value="${locationInstance?.local}" />
										<warehouse:message code="warehouse.local.label" />
									</div>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
									<label for="name"><warehouse:message code="location.supportedActivities.label" /></label>
                                </td>
                                <td valign="top" class="value">
                                	<g:set var="activityList" value="${com.cimbidia.wm.core.ActivityCode.list() }"/>
                                	<g:select name="supportedActivities" multiple="true" from="${activityList }" size="${activityList.size()+1 }" style="width: 150px" 
                                		optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${locationInstance?.supportedActivities?:locationInstance?.locationType?.supportedActivities}"
                                		noSelection="['':warehouse.message(code:'location.useDefaultActivities.label')]" />
                                	
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bgColor"><warehouse:message code="location.bgColor.label"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'bgColor', 'errors')}">
									<g:textField name="bgColor" value="${locationInstance?.bgColor}" class="text" size="10"/>
									<%--                                    
                                    <g:select name="bgColor" class="colorpicker" 
                                    	from="${com.cimbidia.wm.core.Constants.COLORS}" 
                                    	value="${locationInstance?.bgColor}" />
                                    
                                   	<span class="fade">#${locationInstance?.bgColor }</span>
                                   	 --%>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fgColor"><warehouse:message code="location.fgColor.label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'fgColor', 'errors')}">
									<g:textField name="fgColor" value="${locationInstance?.fgColor}" class="text" size="10"/>
                                    <%-- 
                                    <g:select name="fgColor" class="colorpicker" 
                                    	from="${com.cimbidia.wm.core.Constants.COLORS}" 
                                    	value="${locationInstance?.fgColor}"/>
                                
                                   	<span class="fade">#${locationInstance?.fgColor }</span>
                                   	--%>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bgColor"><warehouse:message code="location.sortOrder.label" default="Sort order"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'sortOrder', 'errors')}">
                                    <g:textField name="sortOrder" value="${locationInstance?.sortOrder}" class="text" size="10"/>
                                    <%--
                                    <g:select name="bgColor" class="colorpicker"
                                        from="${com.cimbidia.wm.core.Constants.COLORS}"
                                        value="${locationInstance?.bgColor}" />

                                       <span class="fade">#${locationInstance?.bgColor }</span>
                                        --%>
                                </td>
                            </tr>
                                    <tr class="prop">
                                        <td class="name">
                                            <label><warehouse:message code="location.employees.label" default="Tags"></warehouse:message></label>
                                        </td>
                                        <td valign="top" class="value">
                                            <g:textField id="employees" class="employees" name="employeesToBeAdded" value="${locationInstance?.employees}"/>
                                            <script>
                                                $(function() {
                                                    $('#employees').tagsInput({
                                                        'autocomplete':'option: value1, option: value2',
                                                        'width': 'auto',
                                                        'height': '50px',
                                                        'removeWithBackspace' : true
                                                    });
                                                });
                                            </script> 
                                        </td>
                                    </tr>
    	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="relatedLocation"><warehouse:message code="location.relatedLocation.label" default="Related Locations" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'relatedLocations', 'errors')}">
	                                    
										<ul>
										<g:each in="${locationInstance?.relatedLocations?}" var="c">
										    <li><g:link controller="relatedLocation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
										</g:each>
										</ul>
										<g:link controller="relatedLocation" action="create" params="['location.id': locationInstance?.id]">${warehouse.message(code: 'default.add.label', args: [warehouse.message(code: 'relatedLocations.label', default: 'Related Location')])}</g:link>

	                                </td>
	                            </tr>
	                        
						<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minTime"><warehouse:message code="location.minTime.label" default="Sort order"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'minTime', 'errors')}">
                                    <g:textField name="minTime" value="${locationInstance?.minTime}" class="text" size="10"/>
                                   (HH:MM)
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxTime"><warehouse:message code="location.maxTime.label" default="Sort order"/></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'maxTime', 'errors')}">
                                    <g:textField name="maxTime" value="${locationInstance?.maxTime}" class="text" size="10"/>
                                    (HH:MM)
                                 </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons center">
                    <button type="submit" class="button icon approve">
                        <warehouse:message code="default.button.save.label"/>
                    </button>
                    &nbsp;
                    <g:link action="list">
                        ${warehouse.message(code: 'default.button.cancel.label')}
                    </g:link>
                </div>

               
            </g:form>
        </div>
	    <script type="text/javascript">

	        function selectCombo(comboBoxElem, value) {
		        alert(comboBoxElem + " " + value)
				if (comboBoxElem != null) {
					if (comboBoxElem.options) { 
						for (var i = 0; i < comboBoxElem.options.length; i++) {
				        	if (comboBoxElem.options[i].value == value &&
				                comboBoxElem.options[i].value != "") { //empty string is for "noSelection handling as "" == 0 in js
				                comboBoxElem.options[i].selected = true;
				                break
				        	}
						}
					}
				}
			}						
	    	/*
	        $(document).ready(function() {
	            $('#bgColor').colorpicker({
	                size: 20,
	                label: '',
	                hide: true
	            });

	            $('#fgColor').colorpicker({
	                size: 20,
	                label: '',
	                hide: true
	            });
			
	        });
	        */
	    </script>        
    </body>
</html>
