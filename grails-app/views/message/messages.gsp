<!DOCTYPE html>
<html>
<head>
	
    <meta name="layout" content="index"/>
    
    <title>CimChat</title>
   
</head>
<body>



<div id="chatMessages"></div>


<script>

    function messageKeyPress(field,event, id, receiver) {
       
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
        
            <g:remoteFunction action="submitMessage" params="{message:message, receivers:recvrs, object:controller, context:action, objectId:objectId, parentId:parentId}" update="temp"/>
            $(field).val('');
            return false;
        } else {
            return true;
        }
    }

    function retrieveLatestMessages() {
        <g:remoteFunction action="retrieveLatestMessages" update="chatMessages"/>
    }
    function myMessages() {
        <g:remoteFunction controller="message" action="myMessages" update="chatMessages"/>
    }
	var suspend = 0;
    function pollMessages() {
        //retrieveLatestMessages();
        myMessages();
        if(suspend==0){
        setTimeout('pollMessages()', 7000);
        }
    }
	function suspendTimer() {
		suspend=1;
		
		}
    pollMessages();
    
</script>

</body>
</html>
