<%@ page import="com.grailsinaction.Post" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>



<div id="list-post" class="content scaffold-list" role="main">

    <h1><g:message code="default.list.label" args="[entityName]"/></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="content" title="${message(code: 'post.content.label', default: 'Content')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'post.dateCreated.label', default: 'Date Created')}"/>

            <th><g:message code="post.user.label" default="User"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${postInstanceList}" status="i" var="postInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${postInstance.id}">${fieldValue(bean: postInstance, field: "content")}</g:link></td>

                <td><g:formatDate date="${postInstance.dateCreated}"/></td>

                <td>${fieldValue(bean: postInstance.user, field: "username")}</td>


            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${postInstanceTotal}"/>
    </div>
</div>
</body>
</html>