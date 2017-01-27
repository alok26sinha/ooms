	<style>
 		ul :hover
		{
			background-color:#345643;
		}
</style>
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


        		  $("#msgli0").click();
    		});
    	function liClick(obj,evnt, id,sender,count)
    	{
			//.alert(obj+""+evnt+""+ id+" "+sender+""+count);
			  <g:remoteFunction options="{asynchronous:false}" controller="message" action="getmessage" params="{id:id, count:count}" update="work_content"/>
			 
	            $(field).val('');
        }

    	 	</script>
   
    
    <section class="message_content" style="float: left; left: 10px;">
    <br/>
         	<div><h4 style="background:  linear-gradient(to bottom, #0B75AF 0%, #0C8ED0 100%) repeat scroll 0% 0% transparent; color:#FFF ;top: -15px;position: relative;">Message Thread </h4></div>
         	<br/>
         	<div style="position: relative;  left: 10px;">
         	Short By <select style="width: 245px;">
         			<option id="1">1</option>
         			<option id="1">2</option>
         			<option id="1">3</option>
         			<option id="1">4</option>
         	</select><br/>
         	<figure class="search_div" style="width: 300px;">
						
						<input type="text" value="Search...">
						<input type="button" value="Go" style="position: relative; float: right;">
					</figure></div>
         	<div style="position: relative; top: 20px;">
	    	 <g:each in="${messages}" var="activity" status="i">  
	    	 	
	    	  <ul>	
	    	  <li><input type="radio" name="msg" value="msg" onclick="liClick(this,event,'${activity.id }' , '${activity.sender }', '${activity.count }');"></li>
            	<li id="msgli${i }" onclick="liClick(this,event,'${activity.id }' , '${activity.sender }', '${activity.count }');">
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
                <span class="message_comment"  >
                	<figure class="comment_txt" > ${activity.message }
                    <figure class="comment_sms" style="float:right" id='${activity.id }'><a href="javascript:void(0);" > ${activity.count } </a> </figure>
                    
                    
                    <g:if test="${activity?.hasChild==null || activity?.hasChild==0}">
                    <input type="text" name="message" onfocus="suspendTimer();" onkeypress="messageKeyPress(this,event,'${activity.id }' , '${activity.sender }', '${activity.count }');"/>
                    </g:if>
                     </figure>
                </span>
                </li>
                
                 </ul>
                   </g:each>
            </div>
            
</section>
 <section class="">
	
    <div id="work_content" style="postion:relative; float: left; left: 260px; top: 100px;width:36%">
    <br/>
  
    <br/>
    </div>
   
    
    </section>

		

	    