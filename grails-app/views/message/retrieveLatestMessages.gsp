
    <div><%--
    <ul class="chat">
			--%><g:set var="status" value="${0 }"/>
			<%--<g:each var="activity" in="${messagesList }" status="i">
			--%><g:each in="${messages}" var="activity" status="i">
						
								<div style="width:100%; text-align:center">
                                    
                                        <i class="fa fa-clock-o">&nbsp;</i><g:prettyDateFormat date="${activity.date}"/>
                                </div>
                                
                                <table><tr style="background-color:#B9D8ED"><td>
                              	<g:if test="${(i % 2) == 0}">
                                <div class="avatar" style="float:left">
					                        <g:if test="${activity?.sender?.photo}">
					                            <img src="data:image/png;base64,${activity.sender.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
					                        </g:if>
					                        <g:else>
					                                                    <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender.username}" alt="User Avatar" class="img-circle" />
					                        </g:else>
					                        ${activity.sender }
			                        </div>
			                        </td>
			                        <td>
			                        <div class="triangle-border left">
			                        	<b>${activity.message }</b>
			                        </div>
			                        </g:if>
			                         <g:else>
			                          <div class="oddtriangle-border right">
			                        	<b>${activity.message }</b>
			                        </div>
			                        </td>
			                        <td>
			                        <div class="avatar" style="float:right">
					                        <g:if test="${activity?.sender?.photo}">
					                            <img src="data:image/png;base64,${activity.sender.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
					                        </g:if>
					                        <g:else>
					                                                    <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender.username}" alt="User Avatar" class="img-circle" />
					                        </g:else>
					                        ${activity.sender }
			                        </div>
			                        
			                         
			                         </g:else>
			                         </td></tr></table>
                        </g:each>
                        <%--        
                        <li class="left clearfix">
                        <span class="chat-img ">
                        <g:if test="${activity?.sender?.photo}">
                            <img src="data:image/png;base64,${activity.sender.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                        </g:if>
                        <g:else>
                                                    <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender.username}" alt="User Avatar" class="img-circle" />
                        </g:else>
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">${activity.sender}</strong> <small class="pull-right text-muted">
                                        <i class="fa fa-clock-o">&nbsp;</i><g:prettyDateFormat date="${activity.date}"/></small>
                                </div>
                                <p>
		 						<div class="${ (i % 2) == 0 ? 'triangle-border left' : 'oddtriangle-border right'}"><b>${activity.message }</b></div><span class="small text-muted"></span>
                                </p>
                            </div>
                        </li>
                    </g:each>
                    </ul>
        
    --%></div>
