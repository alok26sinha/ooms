<%@ page import="com.cimbidia.wm.core.Blog" %>



<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="blog.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" value="${blogInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="blog.owner.label" default="Owner" />
		
	</label>
	<g:select name="owner.id" from="${com.cimbidia.wm.core.User.list()}" optionKey="id" value="${blogInstance?.owner?.id}" noSelection="['null': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="blog.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${com.cimbidia.wm.core.Comment.list()}" multiple="yes" optionKey="id" size="5" value="${blogInstance?.comments}" />
</div>

<div class="fieldcontain ${hasErrors(bean: blogInstance, field: 'followers', 'error')} ">
	<label for="followers">
		<g:message code="blog.followers.label" default="Followers" />
		
	</label>
	<g:select name="followers" from="${com.cimbidia.wm.core.User.list()}" multiple="yes" optionKey="id" size="5" value="${blogInstance?.followers}" />
</div>

