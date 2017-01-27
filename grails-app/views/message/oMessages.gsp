	<script type="text/javascript">

	$(document).ready(function() {  
    		
        	$( "#dialog-msgtrail" ).dialog({
        	      autoOpen: false,
        	      height: 300,
        	      width: 350,
        	      modal: true,
        	      position:['right',20],
        	      buttons: {},
        	      close: function() {
        		
        	      }
        	    });


        		$( ".comment_sms" ).click(function() {
            		var id = $(this).attr('id');
            		$("dialog-msgtrail").load("/message/msgTrail?id="+id);
            		
       			<g:remoteFunction options="{asynchronous:false}" controller="message" action="msgTrail" params="{id:id}" update="dialog-msgtrail"/>
        		$( "#dialog-msgtrail" ).dialog( "open" );
        	      });
        	  
        	});
        	</script>
    <section class="collab_content" style="float:left !important">
         
	   		<g:if test="${messages?.size()==0}">
	   		<ul>	
            	<li>
                <span class="message_img" >
                	<g:if test="${session?.user?.photo}">
                      <img src="data:image/png;base64,${session?.user?.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                  	</g:if>
                  	<g:else>
                                              <img src="http://placehold.it/50/DARKBLUE/fff&text=${session?.user.username}" alt="User Avatar" class="img-circle" />
                  	</g:else>
                </span>
                <span class="message_txt" >
                
                <strong>TO: ${TO }</strong>
               
                </span>  
                <span class="message_comment" >
                	<figure class="comment_hangout"><div id='abcd0'>
                    <script>
					  gapi.hangout.render('abcd0', {
					    'render': 'createhangout',
					    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
					    'widget_size': 25
					  });
					  
					</script>
                    </figure>
                    </br>
                                      
                    
                  
                    <figure class="comment_txt">
                    	   		     	
                    <input type="text" autofocus="true" name="message" onfocus="suspendTimer();" onkeypress="oMessageKeyPress(this,event, '${TO}');"/>
                   
                     </figure>
                </span>
                
                 </li>
                
                 </ul>
	   		</g:if>
            <g:else>
            
	    	 <g:each in="${messages}" var="activity" status="i">  
	    	  <ul>	
            	<li>
                <span class="message_img" >
                	<g:if test="${activity?.sender?.photo}">
                      <img src="data:image/png;base64,${activity?.sender?.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                  	</g:if>
                  	<g:else>
                                              <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender?.username}" alt="User Avatar" class="img-circle" />
                  	</g:else>
                </span>
                <span class="message_txt" >
                <strong>${activity?.sender }</strong>
                <p>
                ${activity?.sender?.company?.companyName }
                </p>
                <strong>TO: ${activity?.receivers?.join(',') }</strong>
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
                    <figure class="comment_txt">${activity.message }
                    <figure class="comment_sms" style="float:right" id='${activity.id }'><a href="javascript:void(0);" > ${activity.count } </a> </figure>
                    
                    </br>
                    <g:if test="${activity?.hasChild==null || activity?.hasChild==0}">
                    <input type="text" name="message" onfocus="suspendTimer();" onkeypress="messageKeyPress(this,event,'${activity.id }' , '${activity.sender }', '${activity.count }');" autofocus="true"/>
                    </g:if>
                     </figure>
                </span>
                
                 </li>
                
                 </ul>
                   </g:each>
            </g:else>
            
</section>
   