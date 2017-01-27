<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="custom"/>
    <title>CimChat</title>
    <g:javascript library="jquery"/>
    <style type="text/css">
    	.collapsible {
	margin-bottom: 10px;
	background: #EBEBEB;
	border: 1px solid #CCCCCC;
	padding: 10px;
	width: 480px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #333333;
	display: block;
	overflow: hidden;
}
.collapsible button {
	height: 245px;
	float: right;
	border: 1px solid #999999;
	background: #999999;
	color: #CECECE;
	margin-left: 5px;
}
.collapsible button:hover {
	background: #990000;
	border: 1px solid #990000;
}
        #chatMessages {
            border: 1px solid #000;
            height: 300px;
            width: 250px;
            overflow-y: auto;
        }
        #messageBox {
            width: 243px;
        }
        .nickname {
            color: #f00;
            font-weight: bold;
        }
        .msg {
            color: #444;
            font-weight: normal;
        }
    </style>
</head>
<body>


<div class="collapsible">
<button>&raquo;</button>
<div id="chatMessages"></div>
<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this,event);"/>
<div id="temp"></div>
</div>
<script>
$(document).ready(function() {
	var hideWidth = '-490px'; //width that will be hidden
	var collapsibleEl = $('.collapsible'); //collapsible element
	var buttonEl =  $(".collapsible button"); //button inside element

	collapsibleEl.css({'margin-left': hideWidth}); //on page load we'll move and hide part of elements
	
	$(buttonEl).click(function()
	{
		var curwidth = $(this).parent().offset(); //get offset value of the element
		if(curwidth.left>0) //compare margin-left value
		{
			//animate margin-left value to -490px
			$(this).parent().animate({marginLeft: hideWidth}, 300 );
			$(this).html('&raquo;'); //change text of button
		}else{
			//animate margin-left value 0px
			$(this).parent().animate({marginLeft: "0"}, 300 );	
			$(this).html('&laquo;'); //change text of button
		}
	});
});
	
    function messageKeyPress(field,event) {
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $('#messageBox').val();

        if (theCode == 13){
            <g:remoteFunction action="submitMessage" params="\'message=\'+message" update="temp"/>
            $('#messageBox').val('');
            return false;
        } else {
            return true;
        }
    }

    function retrieveLatestMessages() {
        <g:remoteFunction action="retrieveLatestMessages" update="chatMessages"/>
    }

    function pollMessages() {
        retrieveLatestMessages();
        setTimeout('pollMessages()', 5000);
    }

    pollMessages();
</script>

</body>
</html>
