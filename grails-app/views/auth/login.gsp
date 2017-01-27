<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cimbidia - Admin Login</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
 
<!-- StyleSheet -->
    <!-- Le styles -->
 <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'style.css')}" type="text/css" media="all" />
<link rel="stylesheet" href="${createLinkTo(dir:'js/bootstrap/css',file:'bootstrap.css')}" type="text/css" media="all" />
<link rel="stylesheet" href="${createLinkTo(dir:'js/bootstrap/css',file:'bootstrap-responsive.css')}" type="text/css" media="all" />
<style type="text/css">
body{background-color: #F7F7F6;}
.login{padding-top: 65px;}
.center{float: none; margin-left: auto; margin-right: auto;}
</style>

</head>



<body>
<header class="header">
        <section class="header_container">
        	<section class="header_inner">
            	<a href="/cimbidiaSCM/dashboard/dashboard" class="logo">
            	
            	<img src="${resource(dir: 'images', file: 'logo.png')}" alt="" /></a>
                <section class="header_rgt">
                
               
<!-- Navigation Bar -->
<div class="">
  <div class="">
    <div class="">
    
        <a class="" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
 
            </a>
 
   
 
    <div class="nav-collapse collapse pull-right">
        <ul class="login">
            <li ><a href="#forgot" data-toggle="modal"><i class="icon-user icon-white"></i> Forgot Password</a></li>
            <li class="divider-vertical"></li>
            <li><a href="#contact" data-toggle="modal"><i class="icon-envelope icon-white"></i> Contact Us</a></li>
            <li class="divider-vertical"></li>
 
        </ul>
    </div>
 
    </div>
  </div>
</div>
 </section>
            </section>
            
            </section>
        </header>
<!-- Navigation Ends -->
 
<!-- Main Container -->
<section>
<br><br><br><br><br><br>
<div class="container login">
    <div class="row ">
    
    	 <div id="loginContainer" class="dialog">
				<div id="loginForm">
					<g:if test="${flash.message}" >
					    <div class="center message" >${flash.message}</div>
					</g:if>	
				
					<g:hasErrors bean="${userInstance}">
					   <div class="center errors">
					       <g:renderErrors bean="${userInstance}" as="list" />
					   </div>
					</g:hasErrors>
				</div>
			</div>
        <div class="center span4" style="background:url(../images/login.png) no-repeat; height:200px; padding-left:75px; ">
            <legend-new >LOGIN TO YOUR CIMBIDIA ACCOUNT</legend-new>
 		<g:form controller="auth" action="handleLogin" method="post">	
		
			<g:hiddenField name="targetUri" value="${params?.targetUri}" />
			<g:hiddenField id="browserTimezone" name="browserTimezone" />
			  
		   
			
            <input type="text" id="username" class="" style="height:14px" name="username" placeholder="enter username" />
            <input type="password" id="password" style="height:14px" class="" name="password" placeholder="enter password" />
            <label class="checkbox" style="color:white; font-size: 12px;font-family:Century Gothic, Arial, Helvetica, sans-serif;">
                <input type="checkbox" name="remember" value="1" /> Remember Me
            </label>
            <input type="image" name="submit" src="../images/login-button.png" style="margin-left:145px; margin-top:-40px"></input>
            </g:form>
        </div>
    </div>
</div>
<br><br><br><br><br><br>
<p class="text-center muted " style="float:right; margin-right:10px">&copy; Copyright 2014 - Cimbidia</p>
</section>
<!-- Main Container Ends -->
 
<!-- Forgot Password Model Box -->
<div id="forgot" class="modal hide fade in" style="display: none; ">
<div class="modal-header">
<a class="close" data-dismiss="modal">×</a>
<h3>Forgot Password</h3>
</div>
<div class="modal-body">
<p>Enter your username to reset the password</p>
<form>
      <div class="controls controls-row">
          <input id="name" name="name" type="text" class="span3" placeholder="Name" />
      </div>
 
</form>
</div>
<div class="modal-footer">
<a href="#" class="btn btn-primary">Submit</a>
<a href="#" class="btn" data-dismiss="modal">Close</a>
</div>
</div>
 
<!-- Contact Us Model Box -->
<div id="contact" class="modal hide fade in" style="display: none; ">
<div class="modal-header">
<a class="close" data-dismiss="modal">×</a>
<h3>Contact Us</h3>
</div>
<div class="modal-body">
<form>
      <div class="controls controls-row">
          <input id="name" name="name" type="text" class="span3" placeholder="Name" />
      </div>
 
       <div class="controls controls-row">
       <input id="email" name="email" type="email" class="span3" placeholder="Email address" />
       </div>
 
      <div class="controls">
          <textarea id="message" name="message" class="span5" placeholder="Your Message" rows="5"></textarea>
      </div>
 
  </form>
</div>
 
<div class="modal-footer">
<a href="#" class="btn btn-primary">Submit</a>
<a href="#" class="btn" data-dismiss="modal">Close</a>
</div>
</div>
 
<!-- JavaScript -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${createLinkTo(dir:'bootstrap3.0.2/js/', file:'bootstrap.js')}" type="text/javascript" ></script>

</body>
</html>



