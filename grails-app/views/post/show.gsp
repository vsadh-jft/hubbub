<%@ page import="com.grailsinaction.Post" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>



<div id="show-post" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list post">

        <g:if test="${postInstance?.content}">
            <li class="fieldcontain">
                <span id="content-label" class="property-label"><g:message code="post.content.label"
                                                                           default="Content"/></span>

                <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${postInstance}"
                                                                                           field="content"/></span>

            </li>
        </g:if>

        <g:if test="${postInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="post.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${postInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${postInstance?.tags}">
            <li class="fieldcontain">
                <span id="tags-label" class="property-label"><g:message code="post.tags.label" default="Tags"/></span>

                <g:each in="${postInstance.tags}" var="t">
                    <span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show"
                                                                                      id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${postInstance?.user}">
            <li class="fieldcontain">
                <span id="user-label" class="property-label"><g:message code="post.user.label" default="User"/></span>

                <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
                                                                                  id="${postInstance?.user?.id}">${postInstance?.user?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>

</div>
</body>
</html>
