<%@ page import="com.grailsinaction.UserController; com.security.SUser" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>--}%

%{--</ul>--}%
%{--</div>--}%
<div id="list-user" class="content scaffold-list" role="main">

    <h1><g:message code="default.list.label" args="[entityName]"/></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="userId" title="${message(code: 'user.userId.label', default: 'User Id')}"/>



            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'user.dateCreated.label', default: 'Date Created')}"/>

            <th><g:message code="user.profile.label" default="Photo"/></th>
            <th>Follow</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userInstanceList}" status="i" var="userInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
                <td><g:formatDate date="${userInstance.dateCreated}"/></td>
                <td><img src=<g:if test="${userInstance.profile?.photo}"><g:createLink controller='user'
                                                                                       action='renderImage'
                                                                                       id='${userInstance.profile.id}'/></g:if> <g:else><g:createLinkTo
                        dir="images" file="nophoto.jpg"/></g:else>   height="100" width="100"/></td>
                <td><a href="<g:createLink controller="user" id="${userInstance.id}" action="makeFollower"/>">Follow</a>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${userInstanceTotal}"/>
    </div>
</div>
</body>
</html>