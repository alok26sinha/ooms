<%@ page import="com.cimbidia.wm.core.Location" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <title><warehouse:message code="locations.label" /></title>
        <style>
        	.vertical-text { 
				color:#333;
				border:0px solid red;
				writing-mode:tb-rl;
				-webkit-transform:rotate(-60deg);
				-moz-transform:rotate(-60deg);
				-o-transform: rotate(-60deg);
				white-space:nowrap;
				display:block;
				bottom:0;
				width:20px;
				height:20px;
				font-family: ‘Trebuchet MS’, Helvetica, sans-serif;
				font-weight:normal;
				
        	}
        	tr th { border-top: 0;}
        	
        </style>
        
    </head>
    <body>        
        <div class="body">
        
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
           	
           	<div>
				<div class="buttonBar">            	
                    <g:link class="button icon log" action="list"><warehouse:message code="default.list.label" args="[warehouse.message(code:'locations.label').toLowerCase()]"/></g:link>
                    <g:isUserAdmin>
                        <g:link class="button icon add" action="edit"><warehouse:message code="default.add.label"
                             args="[warehouse.message(code: 'location.label').toLowerCase()]"/></g:link>
                    </g:isUserAdmin>
                    

                    
                </div>

                <div class="yui-gf">
                    <div class="yui-u first">

                        <div class="dialog box">
                            <h2>Filters</h2>
                            <g:form action="list" method="get">
                                <table>
                                    <tr>
                                        <td>
                                            <label><warehouse:message code="location.name.label"/></label>
                                        </td>
                                        <td>
                                            <g:textField name="q" size="30" value="${params.q }" class="text" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><warehouse:message code="location.locationType.label"/></label>
                                        </td>
                                        <td>
                                            <g:select name="locationType.id" from="${com.cimbidia.wm.core.LocationType.list()}"
                                                      optionKey="id" optionValue="${{format.metadata(obj:it)}}" class="chzn-select-deselect"
                                                      value="${params?.locationType?.id}" noSelection="['null':'']" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><warehouse:message code="location.locationGroup.label"/></label>
                                        </td>
                                        <td>
                                            <g:select name="locationGroup.id" from="${com.cimbidia.wm.core.LocationGroup.list()}"
                                                      optionKey="id" optionValue="${{format.metadata(obj:it)}}" class="chzn-select-deselect"
                                                      value="${params?.locationGroup?.id}" noSelection="['null':'']" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="right">
                                            <button type="submit" class="button icon search">
                                                ${warehouse.message(code: 'default.button.find.label')}
                                            </button>
                                        </td>
                                    </tr>
                                </table>
                            </g:form>
                        </div>

                    </div>
                    <div class="yui-u">

                        <div class="box">
                            <h2>
                                ${warehouse.message(code: 'default.showing.message', args: [locationInstanceList?.size()?:0]) }
                            </h2>
                            <table>
                                <thead>
                                    <tr style="height: 100px;">
                                        <th></th>
                                        <g:sortableColumn property="name" title="${warehouse.message(code: 'default.name.label')}" class="bottom"/>
                                        <g:sortableColumn property="locationType" title="${warehouse.message(code: 'location.locationType.label')}" class="bottom"/>
                                        <g:sortableColumn property="locationGroup" title="${warehouse.message(code: 'location.locationGroup.label')}" class="bottom"/>
                                        <th class="left bottom"><warehouse:message code="default.color.label" /></th>
                                        <th class="bottom"><span class="vertical-text"><warehouse:message code="warehouse.active.label" /></span></th>
                                        <g:each var="activity" in="${com.cimbidia.wm.core.ActivityCode.list()}">
                                            <th class="bottom">
                                                <span class="vertical-text"><warehouse:message code="enum.ActivityCode.${activity}"/></span>
                                            </th>
                                        </g:each>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${locationInstanceList}" status="i" var="locationInstance">
                                        <tr class="prop ${(i % 2) == 0 ? 'odd' : 'even'}">
                                            <td>
                                                <g:render template="actions" model="[locationInstance:locationInstance]"/>
                                            </td>
                                            <td>
                                                <g:link action="edit" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "name")}</g:link>
                                            </td>
                                            <td class="left"><format:metadata obj="${locationInstance?.locationType}"/></td>
                                            <td class="left">${locationInstance?.locationGroup?:warehouse.message(code:'default.none.label')}</td>
                                            <td class="center">
                                                <div style="border: 1px solid lightgrey; color:${locationInstance?.fgColor?:'black' }; background-color: ${locationInstance?.bgColor?:'white' }; padding: 5px;">
                                                    ${locationInstance?.name }<br/>
                                                    [FG: ${locationInstance?.fgColor }, BG: ${locationInstance?.bgColor }]
                                                </div>
                                            </td>
                                            <td class="left middle">
                                                <g:if test="${locationInstance.active }">
                                                    <img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'tick.png')}" alt="${warehouse.message(code: 'default.yes.label') }" title="${warehouse.message(code: 'default.yes.label') }"/>
                                                </g:if>
                                                <g:else>
                                                    <img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'cross.png')}" alt="${warehouse.message(code: 'default.no.label') }" title="${warehouse.message(code: 'default.no.label') }"/>
                                                </g:else>

                                            </td>
                                            <g:each var="activity" in="${com.cimbidia.wm.core.ActivityCode.list()}">
                                                <td class="left middle">
                                                    <g:if test="${locationInstance?.supports(activity) }">
                                                        <img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'tick.png')}" alt="${warehouse.message(code: 'default.yes.label') }" title="${warehouse.message(code: 'default.yes.label') }"/>
                                                    </g:if>
                                                    <g:else>
                                                        <img class="middle" src="${createLinkTo(dir:'images/icons/silk',file:'cross.png')}" alt="${warehouse.message(code: 'default.no.label') }" title="${warehouse.message(code: 'default.no.label') }"/>
                                                    </g:else>

                                                </td>
                                            </g:each>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                            <g:if test="${locationInstanceTotal >= params.max }">
                                <div class="paginateButtons">
                                    <g:paginate total="${locationInstanceTotal}" />
                                </div>
                            </g:if>
                        </div>


                    </div>
                </div>




	           		             

            </div>
        </div>

    </body>
</html>