<%@ page import="com.grailsinaction.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="post.content.label" default="Content"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="content" required="" value="${postInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'tags', 'error')} ">
    <label for="tags">
        <g:message code="post.tags.label" default="Tags"/>

    </label>
    <g:select name="tags" from="${com.grailsinaction.Tag.list()}" multiple="multiple" optionKey="id" size="5"
              value="${postInstance?.tags*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="post.user.label" default="User"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${com.security.SUser.list()}" optionKey="id" required=""
              value="${postInstance?.user?.id}" class="many-to-one"/>
</div>

