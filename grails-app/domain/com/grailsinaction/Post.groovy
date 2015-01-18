package com.grailsinaction

import com.security.SUser

class Post {

    String content
    Date dateCreated

    static constraints = {
        content(blank: false)
    }
    static belongsTo = [user:SUser]
    static hasMany = [tags:Tag]
    static mapping = {

    }
}
