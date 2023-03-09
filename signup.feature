Feature: test create New user

Background: Define URL
#	 Given url apiUrl
   Given url 'https://conduit.productionready.io/api/'
	 * def tokenReapose = call read('classpath:sampleApp/features/createToken.feature')
   * def token = tokenReapose.authToken
@ignore
Scenario: Create a new user
  Given header Authorization = 'Token ' + token
	Given path 'users'
  And request
        """
            {
                "user": {
                    "email": "vid2@k.com",
                    "password": "123Karate123",
                    "username": "vid2"
                }
            }
        """
  When method Post
  Then status 200
  
Scenario Outline: Validate Sign Up error messages
	Given header Authorization = 'Token ' + token
   Given path 'users'
   And request
        """
            {
                "user": {
                    "email": "<email>",
                    "password": "<password>",
                    "username": "<username>"
                }
            }
        """
   When method Post
   Then status 422
   And match response == <errorResponse>

   Examples:
       | email                | password  | username               | errorResponse                                                                      |  
       | vidhyaa@karate.com   | Karate123 | vid                    | {"errors":{"username":["has already been taken"]}}                                 |
       | vid@test.com         | Karate123 | vidhyaa11              | {"errors":{"email":["has already been taken"]}}                                    |
       | test@test.com        |           | vid11                  | {"errors":{"password":["can't be blank"]}}                                         |
     