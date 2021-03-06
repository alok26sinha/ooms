
<%@ page import="com.cimbidia.wm.core.LocationType"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="index" />
<g:set var="entityName"
	value="${warehouse.message(code: 'locationType.label')}" />
<title><warehouse:message code="default.list.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle">
<warehouse:message code="default.list.label" args="[entityName]" /></content>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">

			<div>
				<span class="linkButton"> <g:link class="new" action="create" controller="locationType">
						<warehouse:message code="default.add.label"
							args="[warehouse.message(code: 'locationType.label')]" />
					</g:link>
				</span>
			</div>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="id"
							title="${warehouse.message(code: 'default.id.label')}" />

						<g:sortableColumn property="name"
							title="${warehouse.message(code: 'default.name.label')}" />

						<g:sortableColumn property="description"
							title="${warehouse.message(code: 'default.description1.label',default:'Description')}" />

						<g:sortableColumn property="sortOrder"
							title="${warehouse.message(code: 'default.sortOrder.label')}" />

						<g:sortableColumn property="dateCreated"
							title="${warehouse.message(code: 'default.dateCreated.label')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${locationTypeInstanceList}" status="i"
						var="locationTypeInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

							<td>
								<g:link action="edit" id="${locationTypeInstance.id}">
									${fieldValue(bean: locationTypeInstance, field: "id")}
								</g:link>
							</td>
							<td>
								<g:link action="edit" id="${locationTypeInstance.id}">
									${fieldValue(bean: locationTypeInstance, field: "name")}
								</g:link>
							</td>
							<td>
								${fieldValue(bean: locationTypeInstance, field: "description")}
							</td>
							<td>
								${fieldValue(bean: locationTypeInstance, field: "sortOrder")}
							</td>
							<td><format:date obj="${locationTypeInstance.dateCreated}" /></td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${locationTypeInstanceTotal}" />
		</div>
	</div>
</body>
</html>
