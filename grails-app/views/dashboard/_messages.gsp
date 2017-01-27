
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
		<h5><warehouse:message code="My Collaboration" args="[session.warehouse.name]"/></h5>
	</div>
	<div class="panel-body">
                    <ul class="chat">
			<g:set var="status" value="${0 }"/>
			<g:each var="activity" in="${messagesList }" status="i">

                        <li class="left clearfix"><span class="chat-img pull-left">
                        <g:if test="${activity?.user?.photo}">
                            <img src="data:image/png;base64,${activity.user.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                        </g:if>
                        <g:else>
                                                    <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </g:else>
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">${activity.user}</strong> <small class="pull-right text-muted">
                                        <i class="fa fa-clock-o">&nbsp;</i><g:prettyDateFormat date="${activity.lastUpdated}"/></small>
                                </div>
                                <p>
		 						<div>${activity.label }</div><span class="small text-muted"></span>
                                </p>
                            </div>
                        </li>
                    </g:each>
                    </ul>
                

                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$(function() { 		
		$('.nailthumb-container img').nailthumb({width : 20, height : 20});
	});
</script>
