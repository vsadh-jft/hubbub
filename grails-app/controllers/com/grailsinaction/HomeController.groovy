package com.grailsinaction

import com.security.SUser
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {
    def springSecurityService

    def index() {
        println "=========neeraj"

        springSecurityService.reauthenticate("admin2")
        redirect(controller: 'user', action: 'list')

    }
}
