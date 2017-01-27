	
	<script>
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
            		
            		//alert(id);
       			<g:remoteFunction options="{asynchronous:false}" controller="message" action="msgTrail" params="{id:id}" update="dialog-msgtrail"/>
        		$( "#dialog-msgtrail" ).dialog( "open" );
        	      });
        	  
        	});
    	function openDialog(){
    		$('#dialog-new').dialog('open');
        	}

    	$(document).ready(function() {  
    		$( "#dialog-new" ).dialog({
    		      autoOpen: false,
    		      height: 300,
    		      width: 350,
    		      modal: true,
    		      position:['right',20],
    		      buttons: {},
    		      close: function() {
    			//allFields.val( "" ).removeClass( "ui-state-error" );
    		      }
    		    });


    			$( ".plus" ).click(function() {
    			
    			$( "#dialog-new" ).dialog( "open" );
    		      });
    		  
    		});

    	 	</script>
    
    <section class="message_content">
          <div class="right">
					<a href="javascript:void(0)" onclick="openDialog()">
					<span class="plus">
			            +
			            
			        </span></a>&nbsp;
		</div>
	   
	    	 <g:each in="${messages}" var="activity" status="i">  
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
                    <figure class="comment_txt"><g:link controller="${activity?.object}" action="${activity?.context}" id="${activity?.objectId}" > ${activity.message }</g:link>
                    <figure class="comment_sms" style="float:right" id='${activity.id }'><a href="javascript:void(0);" > ${activity.count } </a> </figure>
                    
                    
                    <g:if test="${activity?.hasChild==null || activity?.hasChild==0}">
                    <input type="text" name="message" onfocus="suspendTimer();" onkeypress="messageKeyPress(this,event,'${activity.id }' , '${activity.sender }', '${activity.count }');"/>
                    </g:if>
                     </figure>
                </span>
                
                 </li>
                
                 </ul>
                   </g:each>
            
            
</section>
		<script>
	   		<g:remoteFunction controller="message" action="setReceipient" params="{companyId:${(session?.company.type.code==1)?orderInstance?.seller?.id:orderInstance?.company?.id}}"/>
	    </script>
	    <div id="dialog-new" title="New Message" style="display:none">
	   		<g:render template="/message/newmessages" />
	    </div>

	    