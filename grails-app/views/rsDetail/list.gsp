
<%@ page import="com.cimbidia.scm.rs.RsDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'rsDetail.label', default: 'RsDetail')}" />
        <title><warehouse:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.list.label" args="[entityName]" /></content>
		<script type="text/javascript">

		function addId(id)
		{
			
			document.getElementById("selectedCheck").value += ","+id;
		}
		function clearId()
		{
			document.getElementById("selectedCheck").value ="";
		}
		
		</script>
    </head>
    <body onload="clearId()">
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
				<div>            	
	            	<span class="linkButton">
	            		<%--<g:link class="new" action="create"><warehouse:message code="default.add.label" args="['Resource Selection']"/></g:link>
	            	--%></span>
            	</div>
            	<form action="" method="post">
            	<input type="hidden" name="selectedCheck" id="selectedCheck" value=""/>
                <table>
                    <thead>
                        <tr>
                      	  	<g:sortableColumn property="checkAction" title="${warehouse.message(code: 'default.actions.label', default: 'Action')}" />	
                        	<g:sortableColumn property="cycleType" title="${warehouse.message(code: 'rsDetail.cycleType.label', default: 'Cycle Type')}" />
                        
                            <g:sortableColumn property="autoTender" title="${warehouse.message(code: 'rsDetail.autoTender.label', default: 'Auto Tender')}" />
                        
                         
                            <g:sortableColumn property="level" title="${warehouse.message(code: 'rsDetail.level.label', default: 'Level')}" />
                         
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${rsDetailInstanceList}" status="i" var="rsDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td style="border:2px solid white !important; width:20px;">
							<input type="checkbox" name="checkid${i }"  class="checkForId" id="checkid${i }" value="${rsDetailInstance.id}"
										 onclick="addId('${rsDetailInstance.id}')"/>
							</td>	
                        
                            <td><g:link action="edit" id="${rsDetailInstance.id}">${fieldValue(bean: rsDetailInstance, field: "cycleType")}</g:link></td>
                        
                            <td><g:formatBoolean boolean="${rsDetailInstance.autoTender}" /></td>
                        
                        
                            <td>${fieldValue(bean: rsDetailInstance, field: "level")}</td>
                        
                          
                        
                        </tr>
                         </g:each>
                        <tr>
                        <td colspan="4" valign="top">
						                <div class="buttons">
						                 	<g:actionSubmit value="Add" action="loadCreate" />
						                 	<g:actionSubmit value="Delete" action="delete" /><%--
						                    <g:submitButton name="delete" class="save" value="${warehouse.message(code: 'default.button.delete.label', default: 'Delete')}" />
						                  
						                   
						                --%></div>                        	
		                        	</td>
                        </tr>
                   
                    </tbody>
                </table>
                </form>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${rsDetailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
