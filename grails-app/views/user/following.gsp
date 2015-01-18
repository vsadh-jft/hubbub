<%--
  Created by IntelliJ IDEA.
  User: vivekmaster146
  Date: 18/2/14
  Time: 6:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">
</head>

<body>

<g:each in="${following}" var="user">
${user.username}

</g:each>
</body>
</html>