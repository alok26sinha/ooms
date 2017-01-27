<!DOCTYPE html>
<html>
<head>
	
    <meta name="layout" content="index"/>
    
    <title>CimChat</title>
   <style type="text/css">
   
   attach input[type=button]{ border-radius:15px;
		height:20px; color:#fff; border:0px; float:right;
		box-shadow:0 0 4px #5f7887; margin:0 5px 0 0; cursor:pointer;
		background: #088fdc;
   
   </style>
</head>
<body>
	 	 

<div id="showMessages" >
</div>
 <%--<section class="message_content" style="float: left; left: 10px; top: 100px;">
         		
    --%><section id="msgtrail_section" class="collab_content" style="float: left; left: 30px; top: 100px;">
     <div><h4 style="background:  linear-gradient(to bottom, #0B75AF 0%, #0C8ED0 100%) repeat scroll 0% 0% transparent; color:#FFF ">Message Viewer</h4></div>
     		<div style="position: relative;  left: 10px;">	
     		<figure class="search_div" style="width: 300px;">
						
						<input type="text" value="Search..." size="40">
						<input type="button" value="Go" style="position: relative; float: right;">
					</figure>
		</div>
            <div style="position: relative; top: 35px;">
	    	 <g:each in="${msgs}" var="activity" status="i">  
	    	  <ul style="left:25px; hight:165px">	
            	<li >
                <span class="message_img" style="left: 25px; position: relative;">
                	<g:if test="${activity?.sender?.photo}">
                      <img src="data:image/png;base64,${activity.sender.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
                  	</g:if>
                  	<g:else>
                                              <img src="http://placehold.it/50/DARKBLUE/fff&text=${activity?.sender.username}" alt="User Avatar" class="img-circle" />
                  	</g:else>
                </span>
                <span class="message_txt" style="position: relative; left: 65px;" >
                <strong>${activity.sender }</strong>
                <p>
                ${activity?.sender?.company?.companyName }
                </p>
                <strong>TO: ${activity?.receivers?.join(',') }</strong>
                <em><g:prettyDateFormat date="${activity.date}"/></em>
                </span>  
                <span class="message_comment" style="position: relative; left: 85px; float: left; width: 250px;">
                	<figure style="float:left; background: none repeat scroll 0 0 #1AB7EA;    border-radius: 25% 90% 90% 100%;    height: 20px;    text-align: center;    width: 20px;">
    					<img src="../images/comment-messsage.jpg" alt="No Images"></img>
					</figure>
                	<figure class="comment_txt" style="width: 100px;" > ${activity.message }</figure>
                </span>
               <span class="attach" style="position:relative; left:15px; width:70%">

    				<input type="file"></input>
    				<input type="button" value="Send"></input>

				</span>
               
                 </li>
                
                 </ul>
                   </g:each>
            
            </div>
</section>
   

 	
</body>
</html>
