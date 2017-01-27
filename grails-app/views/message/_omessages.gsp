<!DOCTYPE html>
<html>
<head>
	
   
    
    <title>CimChat</title>
   
</head>
<body>



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

        var companyId = ${session?.companyId}
    	var url = window.location.pathname;
        
        var urlParts = url.split('/');
        
        var controller = urlParts[2];
       
        var action = urlParts[3];
       
        var objectId = "";
        
        if(urlParts.length ==5){
            
        	objectId=urlParts[4];
        	
            }
       
        <g:remoteFunction controller="message" action="oMessages" params="{companyId:companyId, object:controller, objectId:objectId}" update="chatMessages"/>
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
