@Token
Feature: To apply token base authentication

  Background: Setup the Base path
    # * def testdata = read("../resources/testdata.csv")
    Given url 'https://jobapplicationjwt.herokuapp.com/'
    And print '==============***============='

  Scenario: Signup user for JobApplication
    Given path '/users/sign-up'
    # * def auth = call read('../resources/auth.js') {username:'yrajpal207@gmail.com', password:'9lfrlT7u8YrzGhcjLhTGC6DF'}
    And headers {Content-Type : 'application/json'}
    And request
      """
      {
      "password": '#(password)',
      "username": '#(username)'
      }
      """
    When method POST
    Then status 200
    And print response

    
     Scenario: To generate token for JobApplication
    Given path '/users/authenticate'
    And headers {Content-Type : 'application/json'}
    And request
      """
      {
      "password": '#(password)',
      "username": '#(username)'
      }
      """
    When method POST
    Then status 200
    * def authToken = response.token
    