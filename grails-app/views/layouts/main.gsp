<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <style>
    body {
        background-image: url(${resource(dir: 'images', file: 'background.jpg')});
    }
    </style>
    <script src='<g:createLinkTo dir="js" file="jquery.js"/>'></script>
    <script src='<g:createLinkTo dir="js" file="bootstrap.js"/>'></script>
    <link href=<g:createLinkTo dir="css" file="bootstrap.css"/> rel="stylesheet"/>
    <link href=<g:createLinkTo dir="css" file="bootstrap-theme.css"/> rel="stylesheet"/>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div class="navbar" style="margin-bottom: 0px">
    <div class="navbar-inner">

        <ul class="nav">
            <sec:ifNotLoggedIn><li class="active"><a href="/hubbub/login/auth">Login</a></li>
                <li><a href="/hubbub/user/signup">Register</a></li></sec:ifNotLoggedIn>
            <sec:ifLoggedIn><li><a href="/hubbub/user">Users</a></li>
                <li><a href="/hubbub/post/list" >Tweets</a></li>

                <li><a href="/hubbub/post/timeline" >Tweet</a></li>
                <li><a href="/hubbub/user/followers" >Followers</a></li>
                <li><a href="/hubbub/user/following" >Following</a></li>
                <li><a href="/hubbub/logout">Logout</a></li>

            </sec:ifLoggedIn>
        </ul>
    </div>
</div>


<div id="grailsLogo" role="banner"><a href="${createLink(uri: "/")} "><img
        src="${resource(dir: 'images', file: 'twitter.png')}" alt="Grails"/></a></div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>