import com.grailsinaction.Post
import com.grailsinaction.Profile
import com.security.Role
import com.security.SUser
import com.security.SUserRole

class BootStrap {

    def init = { servletContext ->
        createAdminUserIfRequired()



    }
    def destroy = {
    }

    void createAdminUserIfRequired() {
        if(!(SUser.list().size()>0))
        {
//        SUser s1 = new SUser(username: "admin2", password: "p", enabled: true).save(failOnError: true)
        Role r1 = new Role(authority: "User").save(failOnError: true)
//
//       new SUserRole(sUser: s1, role: r1).save(failOnError: true)
/*
        if (!SUser.findByUsername("admin")) {
            println "Fresh Database. Creating ADMIN SUser."
            def profile1 = new Profile(fullName: "profile1", country: "India", email: "admin@yourhost.com")
            def profile2 = new Profile(fullName: "profile2", country: "USA", email: "gadwin@yourhost.com")
            def profile3 = new Profile(fullName: "profile3", country: "AUSTRALIA", email: "padwin@yourhost.com")
            def post1 = new Post(content: "First Post")
            def post2 = new Post(content: "Second Post")
            def post3 = new Post(content: "Third Post")
            def user1 = new SUser(username: "admin",
                    password: "123456", profile: profile1).save(failOnError: true)
            println user1.password
            def user2 = new SUser(username: "vivek",
                    password: "123456", profile: profile2).save()
            println user2.password
            def user3 = new SUser(username: "aman",
                    password: "123456", profile: profile3).save()
            println user3.password
            user1.addToFollowing(user2)
            user1.addToFollowing(user3)
            user1.addToPosts(post1)
            user2.addToPosts(post2)
            user3.addToPosts(post3)
        } else {
            println "Existing admin SUser, skipping creation"
        }*/
        }
    }
}
