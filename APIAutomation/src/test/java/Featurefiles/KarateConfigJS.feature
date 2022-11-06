Feature: To get all values of karate-config.js

  Background: to get value karate-config.js
    * def localmyVarName = myVarName
    Given print "Background variable value ==> ", localmyVarName

  Scenario: To get the username and password from karate-config
    * def localusername = username
    Given print "Scenario variable value ", localusername
    And print "Scenario variable value ", password

  Scenario: Get all the job using url from karate-config
    * def tokenRequest = call read('JobApplicationToken.feature') {password:'Rajpal', username:'Rajpal12'}
    #using _url from karate-config.js file
    Given url _url
    And path '/auth/webapi/all'
    And headers {Accept : 'application/json', Authorization : '#("Bearer " + tokenRequest.authToken)'}
    When method GET
    Then status 200
    And print response
