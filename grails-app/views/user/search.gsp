<%--
  Created by IntelliJ IDEA.
  User: vivekmaster146
  Date: 12/2/14
  Time: 6:30 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>HUBBUB </title>
    <meta name="layout" content="main"/>
</head>

<body>
<formset>
<legend>Search for Friends</legend>
<g:form action="results">
    <label for="userId">User Id</label>
    <g:textField name="userId" />

    <g:submitButton name="search" value="Search"/>
</g:form>
</formset>

</body>
</html>