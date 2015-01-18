package com.grailsinaction

import grails.test.GrailsUnitTestCase

import static org.junit.Assert.*
import org.junit.*


    class UserIntegrationTests {
    @Test
        void testFirstSaveEver() {
            def user = new User(userId: 'joe', password: 'secret',
                    homepage: 'http://www.grailsinaction.com')
            assertNotNull user.save()
            assertNotNull user.id
            def foundUser = User.get(user.id)
            assertEquals 'joe', foundUser.userId
        }
@Test
        void testSaveAndUpdate() {
            def user = new User(userId: 'joe', password: 'secret',
                    homepage: 'http://www.grailsinaction.com')
            assertNotNull user.save()
            def foundUser = User.get(user.id)
            foundUser.password = 'sesame'
            foundUser.save()

            def editedUser = User.get(user.id)

            assertEquals 'sesame', editedUser.password

        }


    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }


}
