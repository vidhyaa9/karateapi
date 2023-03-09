Feature: Test  Delete Artile
Background: Define URL
	Given url apiUrl
   #Given url 'https://conduit.productionready.io/api/'
   #* def tokenReapose = call read('classpath:sampleApp/features/createToken.feature')
   #* def token = tokenReapose.authToken
Scenario: delete article
#				Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"tagList": [],"title": "delete Article", "description": "karate article","body": "Hi this is karate framework"}}
 				When method Post
        Then status 200
        * def articleId = response.article.slug

        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'delete Article'

        Given path 'articles',articleId
        #Given header Authorization = 'Token ' + token
        When method Delete
        Then status 204

        Given params { limit: 10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'delete Article'