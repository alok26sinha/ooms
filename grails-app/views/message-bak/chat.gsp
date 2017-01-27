<!DOCTYPE html>
<html>
<head>
	<script src="http://static.opentok.com/webrtc/v2.0/js/TB.min.js" ></script>
    <meta name="layout" content="index"/>
    
    <title>CimChat</title>
    <%--<g:javascript library="jquery"/>
    --%><style type="text/css">
    .avatar{ /* selector for avatar class*/
    float: left; /* we press to the left edge, flow around on the right */
    background: #fff; /* background */
    width: 50px;
    height: 50px;
    padding: 5px; /* internal padding ( top, right, bottom, left) */
    border: 1px solid #999; /* border(width, type, color) */
    border-radius: 50%; /* border-radius is equal to 50 percent of a general width, actually 25 pixels, here and a circle was got(there is also with prefix - moz and - o) */
    box-shadow: 0px 1px 1px 1px #bbb /* across displacement, vertical displacement, smearing, increase and color */
}
.avatar img{ /* selector for a picture which is "inside" the avatar class */
    display: block; /* a picture is being displayed as a block, by a width it will be equal to the parent(in the div) */
    width: 100%; /* width 100% */
    border: 0; /* zero border */
    margin: 0; /* external margin is lacking */
    border-radius: 50%; /* read above */
}
    /* ============================================================================================================================
== BUBBLE WITH A BORDER AND TRIANGLE
** ============================================================================================================================ */

/* THE SPEECH BUBBLE
------------------------------------------------------------------------------------------------------------------------------- */

.triangle-border {
  position:relative;
  padding:15px;
  margin:1em 0 3em;
  border:2px solid #298;
  color:#333;
  background:#fff;
  /* css3 */
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

/* Variant : for left positioned triangle
------------------------------------------ */

.triangle-border.left {
  margin-left:30px;
}

/* Variant : for right positioned triangle
------------------------------------------ */

.triangle-border.right {
  margin-right:30px;
}

/* THE TRIANGLE
------------------------------------------------------------------------------------------------------------------------------- */

.triangle-border:before {
  content:"";
  position:absolute;
  bottom:-20px; /* value = - border-top-width - border-bottom-width */
  left:40px; /* controls horizontal position */
  border-width:20px 20px 0;
  border-style:solid;
  border-color:#298 transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}

/* creates the smaller  triangle */
.triangle-border:after {
  content:"";
  position:absolute;
  bottom:-13px; /* value = - border-top-width - border-bottom-width */
  left:47px; /* value = (:before left) + (:before border-left) - (:after border-left) */
  border-width:13px 13px 0;
  border-style:solid;
  border-color:#fff transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}

/* Variant : top
------------------------------------------ */

/* creates the larger triangle */
.triangle-border.top:before {
  top:-20px; /* value = - border-top-width - border-bottom-width */
  bottom:auto;
  left:auto;
  right:40px; /* controls horizontal position */
  border-width:0 20px 20px;
}

/* creates the smaller  triangle */
.triangle-border.top:after {
  top:-13px; /* value = - border-top-width - border-bottom-width */
  bottom:auto;
  left:auto;
  right:47px; /* value = (:before right) + (:before border-right) - (:after border-right) */
  border-width:0 13px 13px;
}

/* Variant : left
------------------------------------------ */

/* creates the larger triangle */
.triangle-border.left:before {
  top:10px; /* controls vertical position */
  bottom:auto;
  left:-30px; /* value = - border-left-width - border-right-width */
  border-width:13px 30px 15px 0;
  border-color:transparent #298;
}

/* creates the smaller  triangle */
.triangle-border.left:after {
  top:14px; /* value = (:before top) + (:before border-top) - (:after border-top) */
  bottom:auto;
  left:-25px; /* value = - border-left-width - border-right-width */
  border-width:9px 26px 13px 0;
  border-color:transparent #fff;
}

/* Variant : right
------------------------------------------ */

/* creates the larger triangle */
.triangle-border.right:before {
  top:10px; /* controls vertical position */
  bottom:auto;
  left:auto;
  right:-30px; /* value = - border-left-width - border-right-width */
  border-width:15px 0 15px 30px;
  border-color:transparent #298;
}

/* creates the smaller  triangle */
.triangle-border.right:after {
  top:16px; /* value = (:before top) + (:before border-top) - (:after border-top) */
  bottom:auto;
  left:auto;
  right:-21px; /* value = - border-left-width - border-right-width */
  border-width:12px 0 12px 21px;
  border-color:transparent #fff;
}
 
.oddtriangle-border {
  position:relative;
  padding:15px;
  margin:1em 0 3em;
  border:2px solid #2F72A1;
  color:#333;
  background:#fff;
  /* css3 */
  -webkit-border-radius:10px;
  -moz-border-radius:10px;
  border-radius:10px;
}

/* Variant : for left positioned triangle
------------------------------------------ */

.oddtriangle-border.left {
  margin-left:30px;
}

/* Variant : for right positioned triangle
------------------------------------------ */

.oddtriangle-border.right {
  margin-right:30px;
}

/* THE TRIANGLE
------------------------------------------------------------------------------------------------------------------------------- */

.oddtriangle-border:before {
  content:"";
  position:absolute;
  bottom:-20px; /* value = - border-top-width - border-bottom-width */
  left:40px; /* controls horizontal position */
  border-width:20px 20px 0;
  border-style:solid;
  border-color:#2F72A1 transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}

/* creates the smaller  triangle */
.oddtriangle-border:after {
  content:"";
  position:absolute;
  bottom:-13px; /* value = - border-top-width - border-bottom-width */
  left:47px; /* value = (:before left) + (:before border-left) - (:after border-left) */
  border-width:13px 13px 0;
  border-style:solid;
  border-color:#fff transparent;
  /* reduce the damage in FF3.0 */
  display:block;
  width:0;
}

/* Variant : top
------------------------------------------ */

/* creates the larger triangle */
.oddtriangle-border.top:before {
  top:-20px; /* value = - border-top-width - border-bottom-width */
  bottom:auto;
  left:auto;
  right:40px; /* controls horizontal position */
  border-width:0 20px 20px;
}

/* creates the smaller  triangle */
.oddtriangle-border.top:after {
  top:-13px; /* value = - border-top-width - border-bottom-width */
  bottom:auto;
  left:auto;
  right:47px; /* value = (:before right) + (:before border-right) - (:after border-right) */
  border-width:0 13px 13px;
}

/* Variant : left
------------------------------------------ */

/* creates the larger triangle */
.oddtriangle-border.left:before {
  top:10.5px; /* controls vertical position */
  bottom:auto;
  left:-30px; /* value = - border-left-width - border-right-width */
  border-width:15px 30px 15px 0;
  border-color:transparent #2F72A1;
}

/* creates the smaller  triangle */
.oddtriangle-border.left:after {
  top:16px; /* value = (:before top) + (:before border-top) - (:after border-top) */
  bottom:auto;
  left:-21px; /* value = - border-left-width - border-right-width */
  border-width:9px 21px 9px 0;
  border-color:transparent #fff;
}

/* Variant : right
------------------------------------------ */

/* creates the larger triangle */
.oddtriangle-border.right:before {
  top:10px; /* controls vertical position */
  bottom:auto;
  left:auto;
  right:-30px; /* value = - border-left-width - border-right-width */
  border-width:14px 0 15px 30px;
  border-color:transparent #2F72A1;
}

/* creates the smaller  triangle */
.oddtriangle-border.right:after {
  top:14px; /* value = (:before top) + (:before border-top) - (:after border-top) */
  bottom:auto;
  left:auto;
  right:-25px; /* value = - border-left-width - border-right-width */
  border-width:10px 0 13px 27.5px;
  border-color:transparent #fff;
}    
    	.header-footer{
		    background-color: rgb(96, 166, 232);
			height: 10%;
			text-align: center;
			font-size: x-large;
			position: relative;
			top: 0px;
			font-family: cambri(body);
    	}
		 .collapsible {
		    margin-top:110px;
			margin-bottom: 10px;
			background: white;
			border: 1px solid #CCCCCC;
			padding: 0px;
			width: 300px;
			font: 12px Arial, Helvetica, sans-serif;
			color: #333333;
			display: block;
			overflow: hidden;
		}
		.collapsible button {
			height: 20px;
			float: right;
			border: 1px solid #999999;
			background: #999999;
			color: lightblue;
			margin-left: 0px;
		}
		.collapsible button:hover {
			background: blue;
			border: 1px solid blue;
		}
        #chatMessages {
            //border: 1px solid #000;
            height: 400px;
            //width: 250px;
            width:100%;
            overflow-y: auto;
        }
        #messageBox {
            //width: 193px;
            width:100%;
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
<%--<div class="header-footer"><label style="color:white !important">Collaboration</label></div>
--%><%--<button>&raquo;</button>
--%>
<div id="dialog-video">

</div>
<div id="dialog-form">
<div><label>Advanced Search</label><input type="checkbox" name="Advanced Search" id="advsearchckbox" onchange="changeSearch()"></div>
<div id="search" style="border: solid 1px">
<label for='type'>Search User</label>
		<span id="user-span-adv" class="span" style="text-align: left; display: none;"></span>
		<input id="user-value-adv" class="value" type="hidden" value="1" name="user.id">
		<span class="ui-helper-hidden-accessible" role="status" aria-live="polite">1</span>
		<input id="user-suggest-adv" class="autocomplete text ui-autocomplete-input ui-autocomplete-loading" type="text" style="width: 175px; display: inline;" value="" placeholder="" name="user.name" autocomplete="off">
		
		<script language="javascript">
		$(document).ready(function() {
		$("#user-suggest-adv").click(function() {
		$(this).trigger("focus");
		});
		$("#user-suggest-adv").blur(function() {
		return false;
		});
		$("#user-span-adv").click(function() {
		return false;
		});
		//$("#user-suggest").css('width', '300px');
		$("#user-suggest-adv").autocomplete({
		delay: 100,
		minLength: 1,
		dataType: 'json',
		//define callback to format results
		source: function(req, add){
		//var currentCompanyId = $("#currentCompanyId").val();
		//alert(currentCompanyId);
		$.getJSON('/cimbidiaSCM/json/usersLookup', { term: req.term }, function(data) {
		var items = [];
		$.each(data, function(i, item) {
		items.push(item);
		});
		add(items);
		});
		},
		focus: function(event, ui) {
		return false;
		},
		change: function(event, ui) {
		// If the user does not select a value, we remove the value
		if (!ui.item) {
		$(this).prev().val("null").trigger("change");
		$(this).val(""); // set the value in the textbox to empty string
		$("#user-suggest-adv").trigger("selected");
		}
		return false;
		},
		select: function(event, ui) {
		if (ui.item) {
		$(this).prev().val(ui.item.value).trigger("change");;
		$(this).val(ui.item.valueText);
		$("#user-value-adv").val(ui.item.value)
		}
		$("#user-suggest-adv").trigger("selected");
		return false;
		}
		});
		});
		</script>
	<input type="button" value="Add to chat" id="addtc" onclick="receive(document.getElementById('user-suggest-adv').value)">
</div>
<div id="advsearch"  style="border: solid 1px; display:none"><label>Advanced User Search</label>
</br>
<div><label for='type'>Select Collaboration Partner Type</label>
	<select id="type" name="type" onchange="displayPartner(document.getElementById('type').value)">
	<option value="0">BU</option>
	<option value="9">Seller</option>
	<option value="10">Carrier</option>
	</select>
</div>
<br/>
<div id="bu" ><label for='type'>Select Collaboration Partner</label>
	<g:selectBU name="bu" optionKey="type"	value="" onchange="setComp(document.getElementsByName('bu')[0].value)" />
</div>
<div id="vendor" style="display:none"><label for='type'>Select Collaboration Partner</label>
	<g:selectVendor name="vendor" optionKey="type"	value="" onchange="setComp(document.getElementsByName('vendor')[0].value)"/>
</div>
<div id="carrier" style="display:none"><label for='type'>Select Collaboration Partner</label>
	<g:selectCarrier name="carrier" optionKey="type"	value="" onchange="setComp(document.getElementsByName('carrier')[0].value)" />
</div>
<input id="currentCompanyId" class="value" type="hidden" value="${session.companyId}" name="currentCompanyId">
<br/>
<div>
	<label for='type'>Select User</label>
		<span id="user-span" class="span" style="text-align: left; display: none;"></span>
		<input id="user-value" class="value" type="hidden" value="1" name="user.id">
		<span class="ui-helper-hidden-accessible" role="status" aria-live="polite">1</span>
		<input id="user-suggest" class="autocomplete text ui-autocomplete-input ui-autocomplete-loading" type="text" style="width: 175px; display: inline;" value="" placeholder="" name="user.name" autocomplete="off">
		<script language="javascript">
		$(document).ready(function() {  
			$( "#dialog-form" ).dialog({
			      autoOpen: false,
			      height: 300,
			      width: 350,
			      modal: true,
			      buttons: {
				"Ok": function() {
				  var bValid = true;

				  if ( bValid ) {
				  	
				  	$('[id$=rcs]').text(document.getElementById('receivers').value);	    
		        	$( "#dialog-form" ).dialog( "close" );
				  }
				},
				Cancel: function() {
				  $( "#dialog-form" ).dialog( "close" );
				}
			      },
			      close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			      }
			    });


			$( ".open-dialog" ).click(function() {
				var currentId = $(this).attr('id');
				
				$( "#dialog-form" ).data('itemid', currentId );
				$( "#dialog-form" ).dialog( "open" );
			      });
			  
			  $( ".open-video" ).click(function() {
			  alert("clicked");
				//var currentId = $(this).attr('id');
				
				//$( "#dialog-video" ).data('itemid', currentId );
				$( "#dialog-video" ).dialog( "open" );
			      });
			  
		});
		
		$(document).ready(function() {
		$("#user-suggest").click(function() {
		$(this).trigger("focus");
		});
		$("#user-suggest").blur(function() {
		return false;
		});
		$("#user-span").click(function() {
		return false;
		});
		//$("#user-suggest").css('width', '300px');
		$("#user-suggest").autocomplete({
		delay: 100,
		minLength: 1,
		dataType: 'json',
		//define callback to format results
		source: function(req, add){
		var currentCompanyId = $("#currentCompanyId").val();
		//alert(currentCompanyId);
		$.getJSON('/cimbidiaSCM/json/usersLookup', { term: req.term, companyId: currentCompanyId }, function(data) {
		var items = [];
		$.each(data, function(i, item) {
		items.push(item);
		});
		add(items);
		});
		},
		focus: function(event, ui) {
		return false;
		},
		change: function(event, ui) {
		// If the user does not select a value, we remove the value
		if (!ui.item) {
		$(this).prev().val("null").trigger("change");
		$(this).val(""); // set the value in the textbox to empty string
		$("#user-suggest").trigger("selected");
		}
		return false;
		},
		select: function(event, ui) {
		if (ui.item) {
		$(this).prev().val(ui.item.value).trigger("change");;
		$(this).val(ui.item.valueText);
		$("#user-value").val(ui.item.value)
		}
		$("#user-suggest").trigger("selected");
		return false;
		}
		});
		});
		</script>
		<input type="button" value="Add to chat" id="addtc1" onclick="receive(document.getElementById('user-suggest').value)">
	</div>
	</div>
	<br/>
	<div style="border: solid 1px black">
	<input size="28" type="text" readonly="readonly" id="receivers">
	<input type="button" value="Clear" onclick="document.getElementById('receivers').value=''">
	</div>
</div>
<div class="header-footer" style="witdh=100%;border-bottom:1px solid grey;"><label id="rcs" style="height:25px"></label><a href="javascript:void(0);" class="open-dialog" style="float:right;"><img style="height:16px; background-color:white" src="${createLinkTo(dir:'images/icons/silk',file:'border_all.png')}" alt="Add User" /></a></div>
<div id="chatMessages"></div>
<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this,event);"/>
<div id="temp">
<div class="header-footer" style="witdh=100%;border-bottom:1px solid grey;"><label id="rcs" style="height:25px"></label>
<%--<a href="javascript:void(0);" class="open-video" style="">
--%>
<a title="" target="" href="#" onclick="window.open('/cimbidiaSCM/message/video','','width=280,height=220,scrollbars=no,resizable=no,location=no,menubar=no,toolbar=no')">
<img style="height:16px; background-color:white" src="${createLinkTo(dir:'images',file:'video.png')}" alt="Video Chat" />
</a>
</div>
<div id="replaceme" style="width:100%"></div>
</div>
</div>
<script>
function receive(val){
	if(document.getElementById("receivers").value==""){
	document.getElementById("receivers").value=val;
	}
	else {
		var temp = document.getElementById("receivers").value;
		document.getElementById("receivers").value= temp +", "+ val
		}
}
 function changeSearch(){
	 if(document.getElementById("advsearchckbox").checked){
		 document.getElementById('advsearch').style.display='';
		 document.getElementById('search').style.display='none';
		 }else{
			 document.getElementById('advsearch').style.display='none';
			 document.getElementById('search').style.display='';
			
			 }
	 } 
 function setComp(compId){
	 //alert(compId);
	 document.getElementById("currentCompanyId").value=compId;
	
	 }
 function displayPartner(id){
	 if(id==0){
		
		 document.getElementById('bu').style.display='';
		 document.getElementById('vendor').style.display='none';
		 document.getElementById('carrier').style.display='none';
		 }
	 if(id==9){
		 
		 document.getElementById('bu').style.display='none';
		 document.getElementById('vendor').style.display='';
		 document.getElementById('carrier').style.display='none';
		 }
	 if(id==10){
		
		 document.getElementById('bu').style.display='none';
		 document.getElementById('vendor').style.display='none';
		 document.getElementById('carrier').style.display='';
		 }
	 }



$(document).ready(function() {
	var hideWidth = '900px'; //width that will be hidden
	var collapsibleEl = $('.collapsible'); //collapsible element
	var buttonEl =  $(".collapsible button"); //button inside element

	collapsibleEl.css({'margin-left': hideWidth}); //on page load we'll move and hide part of elements
	//collapsibleEl.css({'float': right !important}); 
	$(buttonEl).click(function()
	{
		var curwidth = $(this).parent().offset(); //get offset value of the element
		if(curwidth.left>0) //compare margin-left value
		{
			//animate margin-left value to -490px
			
			$(this).parent().animate({marginLeft: hideWidth}, 300 );
			$(this).html('&raquo;'); //change text of button
			$("#PO").css("width", "+=240");
		
			
		}else{
			//animate margin-left value 0px
			$(this).parent().animate({marginLeft: "0"}, 300 );	
			$(this).html('&laquo;'); //change text of button
			$("#PO").css("width", "-=240");
			
		}
	});
});
	
    function messageKeyPress(field,event) {
       
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $('#messageBox').val();
        var recvrs = document.getElementById("receivers").value;
       
        var url = window.location.pathname;
    
        var urlParts = url.split('/');
        
        var controller = urlParts[2];
       
        var action = urlParts[3];
       
        var objectId = "";
       
        if(urlParts.length ==5){
            
        	objectId=urlParts[4];
        	
            }
        if (theCode == 13){
            <g:remoteFunction action="submitMessage" params="{message:message, receivers:recvrs, object:controller, context:action, objectId:objectId}" update="temp"/>
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
<script type="text/javascript">
	
  var apiKey    = "44700322";
  //var sessionId = "1_MX40NDcwMDMyMn5-VGh1IE1hciAyMCAwNToxMjo1NyBQRFQgMjAxNH4wLjY0OTY1MTl-";
  var sessionId ="1_MX40NDcwMDMyMn5-U3VuIE1hciAyMyAwMTozNDo0NSBQRFQgMjAxNH4wLjY2ODMyNX4";
  var pubtoken = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz1mM2Y0OGIwY2Y4OTY0OGM2ODAwZmVkZjA5ZmEzYWYwNDA4ZWM2YjNiOnJvbGU9cHVibGlzaGVyJnNlc3Npb25faWQ9MV9NWDQwTkRjd01ETXlNbjUtVTNWdUlFMWhjaUF5TXlBd01Ub3pORG8wTlNCUVJGUWdNakF4Tkg0d0xqWTJPRE15Tlg0JmNyZWF0ZV90aW1lPTEzOTU1NjM3Mjcmbm9uY2U9MC4zMTcwNDIwMzUyMjYwNTEzNCZleHBpcmVfdGltZT0xMzk4MTU1NjYxJmNvbm5lY3Rpb25fZGF0YT0=";
  var token     = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz02ZDk2ODQyMjE0M2JiMDE2M2QzMjA3NzQ0YzEyN2ZmZTczMGViZTk5OnJvbGU9c3Vic2NyaWJlciZzZXNzaW9uX2lkPTFfTVg0ME5EY3dNRE15TW41LVZHaDFJRTFoY2lBeU1DQXdOVG94TWpvMU55QlFSRlFnTWpBeE5INHdMalkwT1RZMU1UbC0mY3JlYXRlX3RpbWU9MTM5NTMxNzYyMSZub25jZT0wLjQyNzQxMjEwNjgzNzE0OTI1JmV4cGlyZV90aW1lPTEzOTc5MDk1NzAmY29ubmVjdGlvbl9kYXRhPQ==";
 //var modtoken = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnBocC12MC45MS4yMDExLTA3LTA1JnNpZz00NWVkM2Y3MmI0MzE3Nzk4Njk4YzgxY2FjMzQyNDVkYzljYjM0NDc2OnNlc3Npb25faWQ9MV9NWDQwTkRjd01ETXlNbjUtVkdoMUlFMWhjaUF5TUNBd05Ub3hNam8xTnlCUVJGUWdNakF4Tkg0d0xqWTBPVFkxTVRsLSZjcmVhdGVfdGltZT0xMzk1NTU2NDMzJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzOTU1NTY0MzMuNjUzNzc5OTcyOTM=";
  var subtoken ="T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz1mZjQwNTlkMDA2MDYwM2VkYTE5MWEyMTE5OWRkMDM1M2YxMTNjNzMxOnJvbGU9c3Vic2NyaWJlciZzZXNzaW9uX2lkPTFfTVg0ME5EY3dNRE15TW41LVUzVnVJRTFoY2lBeU15QXdNVG96TkRvME5TQlFSRlFnTWpBeE5INHdMalkyT0RNeU5YNCZjcmVhdGVfdGltZT0xMzk1NTcyOTM0Jm5vbmNlPTAuMDIzMzU4MjkxMTQ4MTE4NDkzJmV4cGlyZV90aW1lPTEzOTgxNjQ5MDEmY29ubmVjdGlvbl9kYXRhPQ==";

  
   function sessionConnectedHandler (event) {
	      subscribeToStreams(event.streams);
     
  }
  function subscribeToStreams(streams) {
	 
    for (var i = 0; i < streams.length; i++) {
  
        var stream = streams[i];
       if (stream.connection.connectionId != session.connection.connectionId) {
       
        	subscribeToStream(stream);
       }
    }
  }


		 var subscriber ;
		function subscribeToStream(stream) {
		    if (stream.connection != session.connection) {
		    	//alert(stream.connection.connectionId);
		    	//alert(session.connection.connectionId);
		        // Replace replacementElementId with the DOM ID for the subscriber
		        var div = document.createElement('div');
		        div.setAttribute('id', 'stream' + stream.streamId);
          		div.setAttribute('style', 'height:220px; width:100%');
		        var lastDiv = document.getElementById("replaceme");
		        lastDiv.appendChild(div);
		        subscriber= session.subscribe(stream, "replaceme");
		       
		    }
		}






  
  function streamCreatedHandler(event) {
	   subscribeToStreams(event.streams);
  }
  //subscriber.addEventListener("videoDisabled", function(event) {
	  // You may want to hide the subscriber video element:
	 // domElement = window.opener.document.getElementById(subscriber.id);
	//  domElement.style["visibility"] = "hidden";
	  
	  // You may want to add or adjust other UI.
	//});
 	
  var session   = TB.initSession(sessionId);
 
  session.connect(apiKey, subtoken);
  session.addEventListener("sessionConnected",
                           sessionConnectedHandler);
 
  //session.addEventListener("streamCreated",
                          //` streamCreatedHandler);
</script>
</body>
</html>
