package com.grailsinaction

import com.security.SUser

class Tag {


    String name
    SUser user


    static constraints = {
        name(blank: false)
    }
    static hasMany = [ posts : Post ]
    static belongsTo = [ SUser, Post ]


}
