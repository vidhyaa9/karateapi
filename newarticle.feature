Feature: test create New Articles

Background: Define URL
#	 Given url apiUrl
   Given url 'https://conduit.productionready.io/api/'
Scenario: Create a new article
   Given path 'articles'
   And request {"article": {"tagList": [],"title": "New article 5", "description": "karate article","body": "Hi this is karate framework"}}
   When method post
   Then status 200
   And match response.article.title == "New article 5"
   