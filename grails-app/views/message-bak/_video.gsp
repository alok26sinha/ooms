<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>video chat</title>
<script src="http://static.opentok.com/webrtc/v2.0/js/TB.min.js" ></script>
</head>
<body>
<script type="text/javascript">
  var apiKey    = "44700322";
  var sessionId = "1_MX40NDcwMDMyMn5-VGh1IE1hciAyMCAwNToxMjo1NyBQRFQgMjAxNH4wLjY0OTY1MTl-";
  var token     = "T1==cGFydG5lcl9pZD00NDcwMDMyMiZzZGtfdmVyc2lvbj10YnJ1YnktdGJyYi12MC45MS4yMDExLTAyLTE3JnNpZz02ZDk2ODQyMjE0M2JiMDE2M2QzMjA3NzQ0YzEyN2ZmZTczMGViZTk5OnJvbGU9c3Vic2NyaWJlciZzZXNzaW9uX2lkPTFfTVg0ME5EY3dNRE15TW41LVZHaDFJRTFoY2lBeU1DQXdOVG94TWpvMU55QlFSRlFnTWpBeE5INHdMalkwT1RZMU1UbC0mY3JlYXRlX3RpbWU9MTM5NTMxNzYyMSZub25jZT0wLjQyNzQxMjEwNjgzNzE0OTI1JmV4cGlyZV90aW1lPTEzOTc5MDk1NzAmY29ubmVjdGlvbl9kYXRhPQ==";
 
  function sessionConnectedHandler (event) {
     session.publish( publisher );
     subscribeToStreams(event.streams);
  }
  function subscribeToStreams(streams) {
    for (var i = 0; i < streams.length; i++) {
        var stream = streams[i];
        if (stream.connection.connectionId
               != session.connection.connectionId) {
            session.subscribe(stream);
        }
    }
  }
  function streamCreatedHandler(event) {
    subscribeToStreams(event.streams);
  }
 
  var publisher = TB.initPublisher(apiKey);
  var session   = TB.initSession(sessionId);
 
  session.connect(apiKey, token);
  session.addEventListener("sessionConnected",
                           sessionConnectedHandler);
 
  session.addEventListener("streamCreated",
                           streamCreatedHandler);
</script>
</body>
</html>