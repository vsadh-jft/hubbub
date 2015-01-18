package com.grailsinaction

import com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection
import com.security.Role
import com.security.SUser
import com.security.SUserRole
import grails.plugin.springsecurity.annotation.Secured
import org.codehaus.groovy.grails.core.io.ResourceLocator
import org.springframework.core.io.Resource
import org.springframework.dao.DataIntegrityViolationException

@Secured(['IS_AUTHENTICATED_FULLY'])

class UserController {
    ResourceLocator grailsResourceLocator
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: SUser.list(params), userInstanceTotal: SUser.count()]
    }


    def show() {
        def userInstance = SUser.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit() {
        def userInstance = SUser.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update() {
        def userInstance = SUser.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'user.label', default: 'User')] as Object[],
                        "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete() {
        def userInstance = SUser.get(params.id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def search = {
    }


    def results = {

        def users = SUser.list(params.userId)
        println params
        return [users: users, term: params.userId]

    }

    @Secured(['permitAll'])
    def signup() {

    }

    def signup2() {

    }

    @Secured(['permitAll'])

    def register() {
        println "++++++++" + params
        def user = new SUser(params)

        if (user.validate()) {
            user.save()

            new SUserRole(sUser: user, role: Role.findByAuthority("User")).save(failOnError: true)

            flash.message = "Successfully Created User"
            redirect(uri: '/')
        } else {
            user.getErrors().each { println it.getFieldError() }
            flash.message = "Error Registering User"
            render(view: "signup", model: [user: user])
        }
    }

    @Secured(['permitAll'])
    def makeFollower() {

        def id = SUser.get(params.id)
        def currUser = SUser.get(springSecurityService.principal.id)
        currUser.addToFollowing(id)
    }


    def renderImage = {
//        def user = SUser.get(params.id)
        // println "+++++++++++++++" + params.id + "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" + user.profile+"====="
        def profile = Profile.get(params.id)
        println "+++++++++++++++" + params.id + "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" + profile + "====="
        if (profile?.photo) {
            response.setContentLength(profile.photo.length)
            response.outputStream.write(profile.photo)

        } else {
//            final Resource image = grailsResourceLocator.findResourceForURI('/images/nophoto.png')

//            /        render file: image.inputStream, contentType: 'image/png'
            render img(g.createLinkTo([dir: "images", file: "nophoto.jpg"]))
        }

    }

    def following() {
        println "+++++++++++++++++++++" + SUser.get(springSecurityService.principal.id)
        //   def following_users = SUser.findAllByFollowing(SUser.get(springSecurityService.principal.id))
        def following_users = SUser.get(springSecurityService.principal.id).following

        following_users = following_users.sort { it.dateCreated }
        render(view: 'following', model: [following: following_users])
    }

    def followers() {
//def followers = SUser.executeQuery("Select id from suser_suser where :curruser = suser_id" , [curruser: springSecurityService.principal.id]) ")
        def curruser = springSecurityService.principal.id
        println "oooooooooooooooooooooooooooooooooo" + curruser
        List<SUser> test2 = []
        SUser.list().each {
            println it
            if (it.following.find { test -> test.id == curruser }) {
                println "${it}================added"
                test2.add(it)
            }
        }
        println "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" + test2


        render(view: 'followers', model: [followers: test2])
    }


    def renderImage2 = {
        def user = SUser.findByProfile(params.id)
        println "+++++++++++++++" + params.id
        if (user?.profile?.photo) {
            response.setContentLength(user.profile.photo.length)
            response.outputStream.write(user.profile.photo)

        } else {

            response.sendError(404)
        }
    }
}
