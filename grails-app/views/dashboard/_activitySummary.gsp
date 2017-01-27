
<div class="boostrap">
<div class="panel panel-primary">
	
	<div class="panel-heading panel-primary">

		<div class="dropdown pull-right">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<img src="${resource(dir: 'images/icons/silk', file: 'cog.png')}" style="vertical-align: middle"/>
		</a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation" class="action-menu-item">
                        <g:link controller="dashboard" action="index" class="${!params.daysToInclude || params.daysToInclude.equals('3')?'selected':''}" params="[daysToInclude:3]">
                            <img src="${createLinkTo(dir:'images/icons/silk',file:'application_view_list.png')}" alt="View requests" style="vertical-align: middle" />
                            <warehouse:message code="dashboard.lastThreeDays.label" default="Last 3 days"/></g:link>
                    </li>
                    <li role="presentation" class="action-menu-item">
                        <g:link controller="dashboard" action="index" class="${params.daysToInclude.equals('7')?'selected':''}" params="[daysToInclude:7]">
                            <img src="${createLinkTo(dir:'images/icons/silk',file:'application_view_list.png')}" alt="View requests" style="vertical-align: middle" />
                            <warehouse:message code="dashboard.lastWeek.label" default="Last week"/></g:link>
                    </li>
                    <li role="presentation" class="action-menu-item">
                        <g:link controller="dashboard" action="index" class="${params.daysToInclude.equals('30')?'selected':''}" params="[daysToInclude:30]">
                            <img src="${createLinkTo(dir:'images/icons/silk',file:'application_view_list.png')}" alt="View requests" style="vertical-align: middle" />
                            <warehouse:message code="dashboard.lastMonth.label" default="Last month"/>
                        </g:link>

                    </li>
                </ul>
               </div>
		<h5><warehouse:message code="dashboard.activity.label1" default="Activity Watch" args="[session.warehouse.name]"/></h5>
	</div>
	<div class="panel-body">		<%-- 	
		<div style="padding: 10px">
			There are ${activityList.size() } recent activities.		
		</div>
		--%>

			<table class="table table-bordered">
				<tbody>
                    <g:if test="${activityList}">
                        <tr>
                            <td colspan="2">
                                <div>
                                    <warehouse:message code="dashboard.showing.message" args="[startIndex+1,endIndex+1,activityListTotal,daysToInclude]"/>
                                </div>
                            </td>
                        </tr>
                    </g:if>
					<g:set var="status" value="${0 }"/>
		 			<g:each var="activity" in="${activityList }" status="i">
		 				<tr class="${status++%2?'even':'odd' } prop">
		 					<td class="center top">
		 						<%--
			 					<div class="nailthumb-container">
									<img src="${resource(dir: 'images', file: 'default-user2.png')}" />		
								</div>
								--%>
								<img src="${createLinkTo(dir:'images/icons/silk',file: activity.type + '.png')}" class="middle"/> 
							</td>
							<td class="top">
		 						<div>${activity.label }</div>
                                 <span>${format.date(obj:activity.lastUpdated,format:'MMMMM dd hh:mm a')}</span>
                             </td>
		 				</tr>
		 			</g:each>
		 			
		 			<g:unless test="${activityList}">
						<tr class="">
							<td class="center">
								<span class="fade"><warehouse:message code="dashboard.noActivityFound.message"/></span>
							</td>
						</tr>	 			
		 			</g:unless>
		 		</tbody>	 			
			</table>			
		<g:if test="${activityList}">
			<div class="paginateButtons">
				<g:paginate total="${activityListTotal}" />
			</div>
		</g:if>
	</div>
</div>	
<script>
	$(function() { 		
		$('.nailthumb-container img').nailthumb({width : 20, height : 20});
	});
</script>
