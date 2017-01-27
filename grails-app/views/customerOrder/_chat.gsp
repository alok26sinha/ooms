<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="custom"/>
    <title>CimChat</title>
    <%--<g:javascript library="jquery"/>
    --%><style type="text/css">
		 .collapsible {
			margin-bottom: 10px;
			background: white;
			border: 1px solid #CCCCCC;
			padding: 0px;
			width: 236px;
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
            border: 1px solid #000;
            height: 300px;
            width: 200px;
            overflow-y: auto;
        }
        #messageBox {
            width: 193px;
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
<div class="poheader"><label style="color:white !important">Collaboration</label></div>
<button>&raquo;</button>
<br/>
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
	
<div id="chatMessages"></div>
<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this,event);"/>
<div id="temp"></div>
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
	var hideWidth = '-225px'; //width that will be hidden
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

</body>
</html>
