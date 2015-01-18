<%@ page import="com.grailsinaction.Profile" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

            </ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">

			<h1><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="fullName" title="${message(code: 'profile.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="bio" title="${message(code: 'profile.bio.label', default: 'Bio')}" />
					
						<g:sortableColumn property="homepage" title="${message(code: 'profile.homepage.label', default: 'Homepage')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'profile.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="photo" title="${message(code: 'profile.photo.label', default: 'Photo')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'profile.country.label', default: 'Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profileInstanceList}" status="i" var="profileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "fullName")}</g:link></td>
					
						<td>${fieldValue(bean: profileInstance, field: "bio")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "homepage")}</td>
					
						<td>${fieldValue(bean: profileInstance, field: "email")}</td>

                        <td><img src=<g:if test="${profileInstance.photo}"><g:createLink controller='user' action='renderImage' id='${profileInstance.id}'/></g:if> <g:else><g:createLinkTo dir="images" file="nophoto.jpg" /> </g:else>   height="100" width="100"/></td>
					
						<td>${fieldValue(bean: profileInstance, field: "country")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
