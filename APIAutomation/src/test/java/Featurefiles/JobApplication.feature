@Token
Feature: To get all job Description using token base authentication

  Background: Setup the Base path
    # * def testdata = read("../resources/testdata.csv")
    Given url 'https://jobapplicationjwt.herokuapp.com/'
    And print '==============***============='

  Scenario: Get all the job
    
     * def tokenRequest = call read('JobApplicationToken.feature') {password:'Rajpal', username:'Rajpal12'}
    Given path '/auth/webapi/all'
    And headers {Accept : 'application/json', Authorization : '#("Bearer " + tokenRequest.authToken)'}
    When method GET
    Then status 200
    And print response

    