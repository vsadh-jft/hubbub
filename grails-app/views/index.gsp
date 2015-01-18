<head>
    <meta name="layout" content="main"/>
    <title>Welcome to MessageApp</title>
    <style type="text/css" media="screen">
    .button {
        -moz-box-shadow:inset 0px 1px 0px 0px #f9eca0;
        -webkit-box-shadow:inset 0px 1px 0px 0px #f9eca0;
        box-shadow:inset 0px 1px 0px 0px #f9eca0;
        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f0c911), color-stop(1, #f2ab1e) );
        background:-moz-linear-gradient( center top, #f0c911 5%, #f2ab1e 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f0c911', endColorstr='#f2ab1e');
        background-color:#f0c911;
        -webkit-border-top-left-radius:37px;
        -moz-border-radius-topleft:37px;
        border-top-left-radius:37px;
        -webkit-border-top-right-radius:0px;
        -moz-border-radius-topright:0px;
        border-top-right-radius:0px;
        -webkit-border-bottom-right-radius:37px;
        -moz-border-radius-bottomright:37px;
        border-bottom-right-radius:37px;
        -webkit-border-bottom-left-radius:0px;
        -moz-border-radius-bottomleft:0px;
        border-bottom-left-radius:0px;
        text-indent:0;
        border:1px solid #e65f44;
        display:inline-block;
        color:#c92200;
        font-family:Arial;
        font-size:15px;
        font-weight:bold;
        font-style:normal;
        height:50px;
        line-height:50px;
        width:150px;
        text-decoration:none;
        text-align:center;
        text-shadow:1px 1px 0px #ded17c;
    }
    .button:hover {
        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f2ab1e), color-stop(1, #f0c911) );
        background:-moz-linear-gradient( center top, #f2ab1e 5%, #f0c911 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f2ab1e', endColorstr='#f0c911');
        background-color:#f2ab1e;
    }.button:active {
         position:relative;
         top:1px;
     }
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>
<body>



${flash.message}
<h1>Welcome to Twitter</h1>
<p>Twitter allows you to send and receive messages. You need to create an account to use this App</p>
</div>
</body>
</html>