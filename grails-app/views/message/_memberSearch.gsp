<html>
<head>
</head>
<body>
<div>
<div><h4 style="background:  linear-gradient(to bottom, #0B75AF 0%, #0C8ED0 100%) repeat scroll 0% 0% transparent; color:#FFF ">Contacts & Groups</h4></div>
</div>
<form action="">
 <div><figure class="search_div" style="width: 300px;">
 						
						<input type="text" value="Search...">
						<input type="button" value="Go" style="position: relative; float: right;">
					</figure></div>
</form>


<div id="chatMessages"></div>


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
            $('#dialog-new').dialog('close');
            return false;
        } else {
            return true;
        }
    }

    function retrieveLatestMessages() {
        <g:remoteFunction controller="message" action="retrieveLatestMessages" update="chatMessages"/>
    }
    function getMessages() {
        <g:remoteFunction controller="message" action="getMessages" update="chatMessages"/>
    }

   
    function pollMessages() {
        //retrieveLatestMessages();
        getMessages();
        if(suspend==0){
        setTimeout('pollMessages()', 5000);
        }
    }
	function suspendTimer() {
		suspend=1;
		clearTimeout('pollMessages()');
		//alert("suspend called")
		}

    //pollMessages();
	 getMessages();
    
       	
    
</script>
</body>
</html>