<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>video chat</title>
<script src="http://static.opentok.com/webrtc/v2.0/js/TB.min.js" ></script>
</head>
<body >
<script type="text/javascript">
	
  var apiKey    = "44700322";
  //var sessionId = "1_MX40NDcwMDMyMn5-VGh1IE1hciAyMCAwNToxMjo1NyBQRFQgMjAxNH4wLjY0OTY1MTl-";
  var sessionId ="1_MX40NDcwMDMyMn5-U3VuIE1hciAyMyAwMTozNDo0NSBQRFQgMjAxNH4wLjY2ODMyNX4";
  var pubtoken = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz1mM2Y0OGIwY2Y4OTY0OGM2ODAwZmVkZjA5ZmEzYWYwNDA4ZWM2YjNiOnJvbGU9cHVibGlzaGVyJnNlc3Npb25faWQ9MV9NWDQwTkRjd01ETXlNbjUtVTNWdUlFMWhjaUF5TXlBd01Ub3pORG8wTlNCUVJGUWdNakF4Tkg0d0xqWTJPRE15Tlg0JmNyZWF0ZV90aW1lPTEzOTU1NjM3Mjcmbm9uY2U9MC4zMTcwNDIwMzUyMjYwNTEzNCZleHBpcmVfdGltZT0xMzk4MTU1NjYxJmNvbm5lY3Rpb25fZGF0YT0=";
  var token     = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz02ZDk2ODQyMjE0M2JiMDE2M2QzMjA3NzQ0YzEyN2ZmZTczMGViZTk5OnJvbGU9c3Vic2NyaWJlciZzZXNzaW9uX2lkPTFfTVg0ME5EY3dNRE15TW41LVZHaDFJRTFoY2lBeU1DQXdOVG94TWpvMU55QlFSRlFnTWpBeE5INHdMalkwT1RZMU1UbC0mY3JlYXRlX3RpbWU9MTM5NTMxNzYyMSZub25jZT0wLjQyNzQxMjEwNjgzNzE0OTI1JmV4cGlyZV90aW1lPTEzOTc5MDk1NzAmY29ubmVjdGlvbl9kYXRhPQ==";
 //var modtoken = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnBocC12MC45MS4yMDExLTA3LTA1JnNpZz00NWVkM2Y3MmI0MzE3Nzk4Njk4YzgxY2FjMzQyNDVkYzljYjM0NDc2OnNlc3Npb25faWQ9MV9NWDQwTkRjd01ETXlNbjUtVkdoMUlFMWhjaUF5TUNBd05Ub3hNam8xTnlCUVJGUWdNakF4Tkg0d0xqWTBPVFkxTVRsLSZjcmVhdGVfdGltZT0xMzk1NTU2NDMzJnJvbGU9bW9kZXJhdG9yJm5vbmNlPTEzOTU1NTY0MzMuNjUzNzc5OTcyOTM=";
  var subtoken ="T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnBocC12MC45MS4yMDExLTA3LTA1JnNpZz05NGNjYTlkNjU3Y2RhNTg2NGU2ZWZmOGEzOTgxYTBhZjNhODJkNDkwOnNlc3Npb25faWQ9MV9NWDQwTkRjd01ETXlNbjUtVkdoMUlFMWhjaUF5TUNBd05Ub3hNam8xTnlCUVJGUWdNakF4Tkg0d0xqWTBPVFkxTVRsLSZjcmVhdGVfdGltZT0xMzk1NTU3MjcwJnJvbGU9c3Vic2NyaWJlciZub25jZT0xMzk1NTU3MjcwLjY4ODcwNjkyODQ4";

  var publisher ;//= TB.initPublisher(apiKey);
   function sessionConnectedHandler (event) {
	  if (session.capabilities.publish == 1) {
		    // Replace apiKey and replacementElementId with your own values:
		    publisher = TB.initPublisher(apiKey);
		    session.publish( publisher );
		} else {
		    // The client cannot publish.
		    // You may want to notify the user.
		    alert("can not stream");
		}
    
     
     
  }
 
	
  var session   = TB.initSession(sessionId);
 
  session.connect(apiKey, pubtoken);
  session.addEventListener("sessionConnected",
                           sessionConnectedHandler);
 
  session.addEventListener("streamCreated",
                           streamCreatedHandler);
</script>
</body>
</html>