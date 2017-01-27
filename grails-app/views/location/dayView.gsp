
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'fullcalendar/fullcalendar.css', file: css)}"/>
	<link rel="stylesheet" type="text/css" href="${resource(dir: 'fullcalendar/fullcalendar.print.css', file: css)}"/>
	
    <script src="${resource(dir: 'fullcalendar/fullcalendar.min.js', file: js)}"></script>
    <script src="${resource(dir: 'fullcalendar/fullcalendar.js', file: js)}"></script>
    
 <script>

	$(document).ready(function() {
		
	
		//initializeCalendar(10);
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var events = ${trackingMsgs };
		
		var calendar = $('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			//slotMinutes: 30,
			 editable: false,
			selectable: true,
			selectHelper: true,
			<g:if test="${session.companyTypeId == 10 }">
			eventRender: function(event, element) {
					var eventClass=event.className
					if( eventClass == '${session.companyInstance.companyName.replace(" ",",")}'){
						
						var find = '<span class="fc-event-title">'+event.title+'</span>';
						var find1 = '<div class="fc-event-title">'+event.title+'</div>';
						if(event.shipNum == 'null'){
							var replace = '<span class="fc-event-title-shipNum"></span>';
							 var replace1 = '<div class="fc-event-title-shipNum"></div>';
							}else{
								var replace = '<span class="fc-event-title-shipNum">'+event.shipNum+'</span>';
								 var replace1 = '<div class="fc-event-title-shipNum">'+event.shipNum+'</div>';
								}
					    
					    var newHTML = $(element).html().replace(find, replace);
					    $(element).html(newHTML);
					    var newHTML1 = $(element).html().replace(find1, replace1);
					    $(element).html(newHTML1);
					    
						
					}else{
						
						
					        element.css('color', 'blue');
					        element.css('background-color', 'yellow');
					  
								
							var find = '<span class="fc-event-title">'+event.title+'</span>';
						    var replace = '<span class="fc-event-title-busy">Busy</span>';
						    var find1 = '<div class="fc-event-title">'+event.title+'</div>';
						    var replace1 = '<div class="fc-event-title-busy">Busy</div>';
						    var newHTML = $(element).html().replace(find, replace);
						    $(element).html(newHTML);
						    var newHTML1 = $(element).html().replace(find1, replace1);
						    $(element).html(newHTML1);
						    
						}
					
					$( ".fc-event-title-shipNum" ).parent(".fc-event-inner").css( "background-color", "#4F81BD" ).css( "color", "yellow" ).css("text-shadow","0 -1px 0 rgba(0, 0, 0, 0.25)");
					$( ".fc-event-title-busy" ).parent(".fc-event-inner").css( "background-color", "red" ).css( "color", "red" );
					$( "div" ).remove( ".fc-event-time" );
			},
				  viewRender: function(view, element) { 
					 // alert('new view: ' + view.name); 
					  
				  },
			eventAfterRender: function (event, element, view) {
				
				//alert(view.name)
				
				
		    },
			 eventClick: function(calEvent, jsEvent, view) {
				 if( calEvent.className == '${session.companyInstance.companyName.replace(" ",",")}'){
					 window.location =  "/cimbidiaSCM/location/updateTrackingMsgForm?id="+calEvent.id;
					}else{
						alert("another carrier")
						}
			        

			    },
			</g:if>
			    <g:if test="${session.companyTypeId == 8 }">
				eventRender: function(event, element) {
						var eventClass=event.className
						
							element.qtip({
					            content:  event.shipNum
					        });
							var find = '<span class="fc-event-title">'+event.title+'</span>';
							var find1 = '<div class="fc-event-title">'+event.title+'</div>';
							if(event.title == 'null'){
								 var replace = '<span class="fc-event-title-carrier">'+event.shipNum+'</span>';
								 var replace1 = '<div class="fc-event-title-carrier">'+event.shipNum+'</div>';
							}else{
								var replace = '<span class="fc-event-title-carrier">'+event.title+'</span>';
								var replace1 = '<div class="fc-event-title-carrier">'+event.title+'</div>';
							}
						    
						    var newHTML = $(element).html().replace(find, replace);
						    $(element).html(newHTML);
						    var newHTML1 = $(element).html().replace(find1, replace1);
						    $(element).html(newHTML1);
						  
						$( ".fc-event-title-carrier" ).parent(".fc-event-inner").css( "background-color", "#4F81BD" ).css( "color", "white" ).css( "border-color", "white" ).css("text-shadow","0 -1px 0 rgba(0, 0, 0, 0.25)");
						$( "div" ).remove( ".fc-event-time" );
						},
					  
				</g:if>
			events: events,
			minTime : '${location?.minTime}',
			maxTime : '${location?.maxTime}',
			weekends : false,
			slotEventOverlap : false,
			allDaySlot : false,
			
			 dayClick: function(date, allDay, jsEvent, view) {
					
			        if (allDay) {
			        	window.location.href = "/cimbidiaSCM/location/openTrackingMsgForm?msgDate="+$.fullCalendar.formatDate( date, 'MM/dd/yyyy HH:m:s')+"&id="+'${location.id}';
			        }else{
			        	window.location.href = "/cimbidiaSCM/location/openTrackingMsgForm?msgDate="+$.fullCalendar.formatDate( date, 'MM/dd/yyyy HH:m:s')+"&id="+'${location.id}';		
			        	}

							
			        // change the day's background color just for fun
			        //$(this).css('background-color', 'red');

			    },
			    <g:if test="${session.companyTypeId != 10 }">
			    eventClick: function(calEvent, jsEvent, view) {
			        window.location =  "/cimbidiaSCM/location/updateTrackingMsgForm?id="+calEvent.id;

			    }
				</g:if>
				});
		
		
	});

</script>
<%--<g:if test="${session.companyTypeId == 10}">
			
			eventRender: function(event, element) {
			if(event.className.equal(${session.companyInstance.companyName})){
			    var find = '<span class="fc-event-title">';
			    var replace = find + 'busy';
			    var newHTML = $(element).html().replace(find, replace);
			    $(element).html(newHTML);
			}
			},
			
			</g:if>
--%>

<style>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
	
	</head>
    <body>
    <g:form id="byDay">
    <input type="hidden" name="location.id" id="location" value="${location}">
					<fieldset>
						<div id='calendar'></div>
					</fieldset>
	</g:form>
		
	</body>
</html>
