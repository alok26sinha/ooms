<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cimbidia</title>
<link rel="stylesheet" type="text/css" media="all"
	href="${createLinkTo(dir:'css',file:'style.css')}"/>

	<meta name="layout" content="index" />
<style type="text/css">


</style>	
	
</head>
<body>

	<section class="content">
		 <section class="content_inner">
		<section class="header_inner"> 
		<span class="dashboard">	My Notification </span> 
		<span class="work"> My Work </span> 
		<span class="message"> Cim Collab </span> 
		</section> </section> <section class="header_inner">
		<section class=""> 
		<g:render template="/message/firstMessage" />
		</section> <section class="inventory" style="postion:relative ; float: right; ">

	<g:render template="/message/memberSearch" />
	<div class="right" style="position: relative; top: 33px;">
					<a href="javascript:void(0)" onclick="openDialog()">
					<span class="plus">
			            +
			            
			        </span></a>&nbsp;
		</div>
	<table>
		<th>Name</th>
		<th>Group</th>
		
		<g:each in="${userGroup}" status="i" var="usr">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


				<td><g:link action="edit" id="${usr.id}">
						${fieldValue(bean: usr, field: "user.name")}
					</g:link></td>
				<td>
					${fieldValue(bean: usr, field: "groups.name")}
				</td>
				<td>
					<figure style="float:right; background: none repeat scroll 0 0 #1AB7EA;    border-radius: 25% 90% 90% 100%;    height: 20px;    text-align: center;    width: 20px;">
    					<img src="../images/comment-messsage.jpg" alt="No Images"></img>
					</figure>
				</td>
			</tr>
		</g:each>
	</table>
	</section> </section>
</body>
</html>
