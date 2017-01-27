
<%@ page import="com.cimbidia.wm.core.Blog" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="index" />
        <g:set var="entityName" value="${warehouse.message(code: 'blog.label', default: 'Blog')}" />
        <title><warehouse:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><warehouse:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="boostrap">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            
         <g:each var="blogInstance" in="${blogs}">

           <div class="panel panel-primary col-md-12" style="padding: 20px">
           	<div class="panel-heading">
	   		 <h3 class="panel-title">${blogInstance.name}&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://placehold.it/40/FA6F57/fff&text=${blogInstance?.comments?.size()}"></img></h3>   
	   		 
	        </div>
		
	        <div class="panel-body col-md-8" style="height: auto; max-height: 600px; overflow-y: auto">
			    <ul class="chat">
			    <g:if test="${blogInstance?.comments}">
			    <g:each var="commentInstance" in="${blogInstance?.comments?.sort{a,b-> b.dateCreated<=>a.dateCreated}}">
	
				<li class="left clearfix">
				<span class="chat-img pull-left">
					<g:if test="${commentInstance.sender?.photo}">
					    <img src="data:image/png;base64,${commentInstance.sender?.photo?.encodeBase64()}" alt="User Avatar" class="img-circle" />
					</g:if>
					<g:else>
								    <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
					</g:else>
				</span>
				    <div class="chat-body clearfix">
					<div class="header">
					    <strong class="primary-font">${commentInstance?.sender}</strong> <small class="pull-right text-muted">
						<i class="fa fa-clock-o">&nbsp;</i><g:prettyDateFormat date="${commentInstance?.lastUpdated}"/></small>
					</div>
					<div><pre>${commentInstance?.comment?.encodeAsHTML().replaceAll('\n','<br>') }</pre></div>
					<span class="small text-muted"></span>
				    </div>
				</li>
			    </g:each>
			    </g:if>
			    <g:else>
					<span class="fade"><warehouse:message code="default.noComments.label" /></span>
			    </g:else>
			    </ul>
	         </div>
		
	         <div class="panel-footer  col-md-4" style="background-color: #ffffff">
		   <div class="panel panel-primary">
		   <div class="panel-body col-md-12" style="height:auto; background-color: #ffffff; overflow-y: auto;" >
	           <g:form action="saveComment">
			<g:hiddenField name="id" value="${commentInstance?.id}" />
			<g:hiddenField name="blog.id" value="${blogInstance?.id}" />
		
		    <div class="input-group">
			<textarea rows=5 name="comment" id="comment" type="text" class="form-control input-sm" placeholder="Type your message here..." ></textarea>
			<span style="padding:5px" class="input-group-btn">
			    <button type="submit" class="btn btn-warning btn-sm" id="btn-chat">
				Send</button>
			</span>
		    </div>
		 
		   </g:form>
		   </div>
		   <div class="panel-body col-md-12"  style="height:auto; background-color: #ffffff; overflow-y: auto;" >
		   <h4>Followers</h4>

						 <div class="carousel slide" id="myCarousel">
						 <div class="carousel-inner">
						 <div class="item active">
							<ul class="thumbnails">
		    <g:each var="followerInstance" in="${blogInstance?.followers}">
					<li class="col-md-3" style="height: 100px">
						    <div class="caption" style="width: 90px; text-align:center">${followerInstance?.name}</div>
					<g:if test="${followerInstance?.photo}">
					    	 <!--div class=row style="float:left; border: 1px"-->
						    <div style="background: url(data:image/png;base64,${followerInstance?.photo?.encodeBase64()}) no-repeat center center transparent; width: 90px; height: 50px; position: relative; margin-left: auto; margin-right: auto; overflow: hidden;" > </div>
					</g:if>
					<g:else>
						    <div style="background: url('http://placehold.it/50/FA6F57/fff&text=NoPic') no-repeat center center transparent; width: 90px; height: 50px; position: relative; margin-left: auto; margin-right: auto; overflow: hidden;" > </div>
					</g:else>
					</li>
		    </g:each>
							</ul>
						   </div>
						  </div>
						  </div>
		    </div>
		   </div>
		   
	        </div>
	</div>
	 </g:each>
		    
	    </div>
    </body>
</html>
