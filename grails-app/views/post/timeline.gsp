<html>
<head>
    <title>
        Timeline for ${user.profile?.fullName}
    </title>
    <meta name="layout" content="main"/>
</head>

<body>

<div id="newPost">
    <h3>
        What is ${user.profile?.fullName} hacking on right now?
    </h3>
    <g:if test="${flash.message}">
        <div class="flash">
            ${flash.message}
        </div>
    </g:if>

    <p>
        <g:form action="addPost" id="${user.id}">
            <g:textArea style="width:auto; height: auto" id='postContent' name="content"
                        rows="2" cols="50"/><br/>
            <g:submitButton name="post" value="Post"/>
        </g:form>
    </p>
</div>


<div class="allPosts">
    <g:each in="${allpost}" var="post">
        <div class="postEntry" style="margin-top: 20px">
            <div style="float:left; margin-top:10px ">
                <td><img src=<g:if test="${post.user.profile?.photo}"><g:createLink controller='user' action='renderImage' id='${post.user.profile.id}'/></g:if> <g:else><g:createLinkTo dir="images" file="nophoto.jpg" /> </g:else>   height="50" width="50"/></td>

            </div>

            <div style="float: inherit;margin-left: 80px;padding-top: 15px" class="postText">
                ${post.content}
            </div>

            <div style="float: inherit; margin-left: 80px" class="postDate">
                ${post.dateCreated}
            </div>
        </div>
    </g:each>
</div>

</body>
</html>
