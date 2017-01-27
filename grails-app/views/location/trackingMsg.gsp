<%@ page import="com.cimbidia.wm.core.RoleType" %>
<%@ page import="com.cimbidia.wm.core.Location" %>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
	</head>
    <body>
    </br></br>
    <div class="">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
	<div id="" class="" style="padding: 0px;width: 100%">
	        

	
    <g:form role="form" action="createTrackingMsg" controller="location" method="post">
    		
<span class="content_inner">
		<div class="pagetitle">
		<label style="color:white">Tracking Message</label>
		</div></span>
					<div class="right">

					<span class="plus">
			            +
			        </span>&nbsp;
			        	<%--<span class="comment note" >
				            <img class="top" src="${resource(dir: 'images', file: 'comment.png')}">
				            --%><script src="https://apis.google.com/js/platform.js"></script>
							<div id="placeholder-rr"></div>


				<script>
							  gapi.hangout.render('placeholder-rr', {
							    'render': 'createhangout',
							    'initial_apps': [{'app_id' : '184219133185', 'start_data' : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }],
							    'widget_size': 25
							  });
							</script>
							<%--</img>
			        	</span>


			        --%></div>
		<div id="trackingDialog-form" title="Arrival/Departure">
        <form id="trackingMsgForm">
        <table>
        <g:if test="${session.companyTypeId == 8}">
        <tr><td style="width:30%"></td><td style="width:10%"><label for="carrier">Carrier</label></td><td><g:autoSuggest id="carrier" name="carrier"
										jsonUrl="${request.contextPath }/json/carrierLookup"
										valueId="${trackingMsg?.carrier?.id }"
										valueName="${trackingMsg?.carrier?.companyName }"
										styleClass="text" width="175"/></td></tr>
		</g:if>
		<tr><td></td><td><label for="shipment">Shipment Number</label></td><td><g:autoSuggest id="shipment" name="shipment"
										jsonUrl="${request.contextPath }/json/shipmentLookup"
										valueId="${trackingMsg?.shipment?.id }"
										valueName="${trackingMsg?.shipment?.shipmentNumber }"
										styleClass="text" width="175"/></td></tr>	
		<g:if test="${trackingMsg?.id == null}">							
        <tr><td></td><td><label for="stopNumber">Stop Number</label></td><td><input type="text" name='stopNumber' value="" size="5" /></td></tr>
        <tr><td></td><td><label for="msgDate">Message Date</label></td><td>
        <jqueryPicker:time styleClass="text ui-widget-content ui-corner-all" name="msgDate" value="${date}" />
        </td></tr>
        <tr><td></td><td><label for="comments">Comments</label></td><td><input type="text" name='comments' value="" size="30" /></td></tr>
        </br>
        <tr><td></td><td><input class="action-menu"  type="Submit" value="Save">
        </td><td>
        <g:link controller="location" style="color:white" class="action-menu"  action="viewByDay" id="${locationId}">Cancel</g:link>
        <A HREF="previous.html" style="color:white" onClick="history.back();return false;">Go back</A> 
        </td>
        <td>
        <input type="hidden" name="locationId" id="locationId" value="${locationId}"></td></tr>
        </g:if>
        <g:else>
        <tr><td></td><td  ><label for="stopNumber">Stop Number</label></td><td><input type="text" name='stopNumber' value="${trackingMsg?.stopNumber}" size="5" /></td></tr>
        <tr><td></td><td ><label for="msgDate">Message Date</label></td><td>
        <jqueryPicker:time styleClass="text ui-widget-content ui-corner-all" name="msgDate" value="${trackingMsg?.msgDate}" />
        </td></tr>
        <tr><td></td><td ><label for="comments">Comments</label></td><td><input type="text" name='comments' value="${trackingMsg?.comments}" size="30" /></td></tr>
       <tr><td></td></tr>
         <tr  style="height:5%" ><td></td><td>
			
			<g:actionSubmit action="updateTrackingMsg" class="action-menu"  value="${message(code: 'trackingMsg.button.update.label', default: 'Update Tracking Message')}" />
			
			</td>
			
			<td>
			<g:actionSubmit action="cancelTrackingMsg" class="action-menu"  value="${message(code: 'trackingMsg.button.cancel.label', default: 'Cancel')}" />
			<A HREF="previous.html" class="action-menu"  onClick="history.back();return false;">Go back</A> 
			<input type="hidden" name="locationId" id="locationId" value="${trackingMsg?.location?.id}">
			<input type="hidden" name="trackingMsgId" id="trackingMsgId" value="${trackingMsg?.id}">
			</td></tr>
         </g:else>
        </table>
         	
		</form>
	</div>
		<script type="text/javascript">
		
		$(document).ready(function() {  
			$( ".ui-datepicker-calendar" ).hide();
			$( ".ui-datepicker-headerr" ).hide();
			$( "#trackingDialog-form" ).dialog({
			      autoOpen: false,
			      height: 300,
			      width: 400,
			      modal: true,
			      buttons: {
				"Save": function() {
				  var bValid = true;

				  if ( bValid ) {
					var shipmentId = $(this).data('shipmentId');
				  	$("input[id=shipmentId]").val(shipmentId)
					$.ajax({
						url: "/cimbidiaSCM/shipment/createTrackingMsg",
						type: "POST",
						
						data: $('#trackingMsgForm').serialize(),
						success: function(data) {
							alert ( 'Tracking message saved!' );
							location.reload();
						    $(this).dialog("close");
						},
						error: function(xhr, textStatus, error){
						  
						   console.log(xhr.statusText);
						   console.log(textStatus);
						   console.log(error);
						}
		        		});		    
		        		$( "#trackingDialog-form" ).dialog( "close" );
				  }
				},
				Cancel: function() {
				  $( "#trackingDialog-form" ).dialog( "close" );
				}
			      },
			      close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
			      }
			    });


			$( ".open-trackingDialog" ).click(function() {
				var currentId = $(this).attr('id');
				$( "#trackingDialog-form" ).data('shipmentId', currentId );
				$( "#trackingDialog-form" ).dialog( "open" );
			      });
			$( ".open-trackingDialog" ).click(function() {
				var currentId = $(this).attr('id');
				$( "#trackingDialog-form" ).data('shipmentId', currentId );
				$( "#trackingDialog-form" ).dialog( "open" );
			      });

			

		</script>
		</g:form></div></div>
		</body>
</html>
