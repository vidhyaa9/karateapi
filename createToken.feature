Feature: Create Token

Scenario: Create Token
#	 Given url apiUrl
	 Given url 'https://conduit.productionready.io/api/'
	 Given path 'users/login'
   #And request {"user": {"email": "#(email)", "password": "#(password)"}}
    And request {"user": {"email": "vid@karate.com", "password": "karate123"}}
   When method Post
   And status 200
   * def authToken = response.user.token