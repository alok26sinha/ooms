		
    <section id="msgtrail_section" class="collab_content" style="width:100% !important; left:0px !important">
            
	    	 <g:each in="${msgs}" var="activity" status="i">  
	    	  <ul>	
            	<li>
                <span class="message_img" >
                	<g:if test="${activity?.sender?.photo}">
                      <img src="data:image/png;base64,${activity.sender.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                  	</g:if>
                  	<g:else>
                                              <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender.username}" alt="User Avatar" class="img-circle" />
                  	</g:else>
                </span>
                <span class="message_txt" >
                <strong>${activity.sender }</strong>
                <p>
                <%--${activity?.sender?.company?.companyName }
                --%></p>
                <strong>TO: <%--${activity?.receivers?.join(',') }--%></strong>
                <em><g:prettyDateFormat date="${activity.date}"/></em>
                </span>  
                <span class="message_comment" >
                	<figure class="comment_hangout"><%--
                    <img src="${resource(dir: 'images', file: 'comment-messsage.jpg')}" alt="" />
                    --%><div id='${activity.id }'>
                    <script>
					  gapi.hangout.render('${activity.id }', {
					    'render': 'createhangout',
					    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
					    'widget_size': 26
					  });
					</script>
                    </figure>
                    <figure class="comment_txt"><g:link controller="${activity?.object}" action="${activity?.context}" id="${activity?.objectId}" > ${activity.message }</g:link>
                    
                     </figure>
                </span>
                
                 </li>
                
                 </ul>
                   </g:each>
            
            
</section>
   