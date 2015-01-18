<%--
  Created by IntelliJ IDEA.
  User: vivekmaster146
  Date: 14/2/14
  Time: 3:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UPLOAD FORM</title>
    <meta name="layout" content="main">
</head>

<body>
<dl>

<g:uploadForm>
    <dt>User Id: </dt>
    <dd><g:textField name="username" /></dd>

    <dt>Password:</dt>
    <dd><g:passwordField name="password" /></dd>
    <dt>(repeat)</dt>
    <dd><g:passwordField name="passwordRepeat" /></dd>
    <dt>Country:</dt>
    <dd><g:countrySelect name="country"
                         noSelection="['':'Choose your country...']"/>

    <dt>Photo:</dt>
    <dd><input type="file" name="photo"/></dd>

    <dt>Timezone:</dt>
    <dd><g:timeZoneSelect name="timezone"/></dd>
    <dt>Who introduced you to Hubbub?</dt>
    <dd>
        <g:select name="referrer"
                  from="${com.grailsinaction.Profile.list()}"
                  optionKey="id"
                  optionValue="fullName"
                  noSelection="${['null':'Please Choose...']}" />
    </dd>
    <dt>Spam me forever:</dt>
    <dd>
        <g:checkBox name="spamMe" checked="true"/>
    </dd>
    <dt>Email Format:</dt>
    <dd>
        <g:radioGroup name="emailFormat"
                      labels="['Plain','HTML']"
                      values="['P', 'H']"
                      value="H">
            ${it.label} ${it.radio}
        </g:radioGroup>
    </dd>
    <dt>

        <g:actionSubmit value="Register" />
    </dt>
    <dd>
        <g:actionSubmit value="Cancel" action="cancelRegister" />
    </dd>
</g:uploadForm>
</dl>
<p>
    <g:link controller="post">Back to Hubbub</g:link>
</p>

    </body>
    </html>