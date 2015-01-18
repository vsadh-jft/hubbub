package com.security

import com.grailsinaction.Post
import com.grailsinaction.Profile
import com.grailsinaction.Tag

class SUser {

    transient springSecurityService

    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    String homepage
    Date dateCreated
    Profile profile

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        homepage nullable: true
        profile nullable: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        SUserRole.findAllBySUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        println "${password}====================="
        password = springSecurityService.encodePassword(password)
    }

    static hasMany = [posts:Post,tags:Tag,following:SUser]
}
