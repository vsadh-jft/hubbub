<%--
  Created by IntelliJ IDEA.
  User: vivekmaster146
  Date: 14/2/14
  Time: 12:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register New User</title>
    <meta name="layout" content="main"/>

</head>

<body>
<h1> Register a User</h1>
<g:hasErrors>
    <div class="errors">
        <g:renderErrors bean="${user}" as="list" />
    </div>
</g:hasErrors>
<div style="margin-left: 40px">
    <g:uploadForm action="register">
        <dl>
            <dt>User Id</dt>
            <dd><g:textField name="username"
                             value="${user?.username}"/></dd>
            <dt>Password</dt>
            <dd><g:passwordField name="password"
                                 value="${user?.password}"/></dd>
            <dt>Full Name</dt>
            <dd><g:textField name="profile.fullName"
                             value="${user?.profile?.fullName}"/></dd>
            <dt>Bio</dt>
            <dd><g:textArea name="profile.bio"
                            value="${user?.profile?.bio}"/></dd>
            <dt>Photo:</dt>
            <dd><input type="file" name="profile.photo"/></dd>
            <dt>Email</dt>
            <dd><g:textField name="profile.email"
                             value="${user?.profile?.email}"/></dd>
            <dt><g:submitButton name="register" value="Register"/></dt>
        </dl>
    </g:uploadForm>
</div>

</body>
</html>