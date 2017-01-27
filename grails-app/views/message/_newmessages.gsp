<!DOCTYPE html>
<html>
<head>
	
   
    
    <title>CimChat</title>
   
</head>
<body>


    <section class="collab_content" style="float:left !important">
         
	   		
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
                
                <strong>TO: ${session?.TO }</strong>
               
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
                    	   		     	
                    <input type="text" autofocus="true" name="message" onfocus="suspendTimer();" onkeypress="oMessageKeyPress(this,event, '${session?.TO }');"/>
                   
                     </figure>
                </span>
                
                 </li>
                
                 </ul>
	   		
            
</section>
   

<div id="chatMessages" ></div>


<script>
	var suspend = 0;
    function messageKeyPress(field,event, id, receiver, count) {
    	
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $(field).val();
      
        var recvrs = receiver;//document.getElementById("receivers").value;
       
        var url = window.location.pathname;
    
        var urlParts = url.split('/');
        
        var controller = urlParts[2];
       
        var action = urlParts[3];
       
        var objectId = "";
        
        if(urlParts.length ==5){
            
        	objectId=urlParts[4];
        	
            }
        if (theCode == 13){
        	 var parentId=id;
        	 suspend = 0;
             setTimeout('pollMessages()', 5000);
            <g:remoteFunction controller="message" action="submitMessage" params="{message:message, receivers:recvrs, object:controller, context:action, objectId:objectId, parentId:parentId, count:count}" update="temp"/>
            $(field).val('');
            return false;
        } else {
            return true;
        }
    }
    function oMessageKeyPress(field,event, receiver) {
       
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $(field).val();
      
        var recvrs = receiver;//document.getElementById("receivers").value;
       
        var url = window.location.pathname;
    
        var urlParts = url.split('/');
        
        var controller = urlParts[2];
       
        var action = urlParts[3];
       
        var objectId = "";
        
        if(urlParts.length ==5){
            
        	objectId=urlParts[4];
        	
            }
        if (theCode == 13){
        	
        	 
        	 suspend = 0;
             setTimeout('pollMessages()', 5000);
            <g:remoteFunction controller="message" action="submitOMessage" params="{message:message, receivers:recvrs, object:controller, context:action, objectId:objectId, parentId:null, count:0}" update="temp"/>
            $(field).val('');
            return false;
        } else {
            return true;
        }
    }
    function retrieveLatestMessages() {
        <g:remoteFunction controller="message" action="retrieveLatestMessages" update="chatMessages"/>
    }
    function myMessages() {
        <g:remoteFunction controller="message" action="myMessages" update="chatMessages"/>
    }
    function oMessages() {
       
    	var url = window.location.pathname;
        
        var urlParts = url.split('/');
        
        var controller = urlParts[2];
       
        var action = urlParts[3];
       
        var objectId = "";
        
        if(urlParts.length ==5){
            
        	objectId=urlParts[4];
        	
            }
        <g:remoteFunction controller="message" action="oMessages" params="{object:controller, objectId:objectId}" update="chatMessages"/>
    }

   
    function pollMessages() {
        //retrieveLatestMessages();
        oMessages();
        if(suspend==0){
        setTimeout('pollMessages()', 5000);
        }
    }
	function suspendTimer() {
		suspend=1;
		clearTimeout('pollMessages()');
		//alert("suspend called")
		}

    pollMessages();
    
</script>

</body>
</html>
