Feature: Post request and validation of response

  Background: Setup the Base path
    Given url 'https://demoqa.com'
    And print '==============***============='

  Scenario: To apply post request and validation
    Given path '/BookStore/v1/Books'
    And request { "userId": "c95bc738-362d-4758-b83b-2e53f9255b6a", "collectionOfIsbns": [{"isbn": "9781449337711"}]}
    And headers {Accept : 'application/json', Authorization : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IlJhanBhbCIsInBhc3N3b3JkIjoiUmFqcGFsQDE5OTQiLCJpYXQiOjE2NjIyOTAzNTR9.bLuknVbJG8hXKnPR6O-cYQL3QvQQKGel1EuD0vPFr_s'}
    When method POST
    Then status 201
    And print response
    And match response ==
      """
      {
      "books": [
        {
            "isbn": "9781449337711"
        }
      ]
      } 
      """

  Scenario: To apply post request and validation using external file
    Given path '/BookStore/v1/Books'
    * def body = read("../resources/StoreBookBody.json")
    And request body
    And headers {Accept : 'application/json', Authorization : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IlJhanBhbCIsInBhc3N3b3JkIjoiUmFqcGFsQDE5OTQiLCJpYXQiOjE2NjIyOTAzNTR9.bLuknVbJG8hXKnPR6O-cYQL3QvQQKGel1EuD0vPFr_s'}
    When method POST
    Then status 201
    And print response

  Scenario: To apply get request and Schema validation
    Given path '/BookStore/v1/Book'
    And param ISBN = '9781449325862'
    # And headers {Accept : 'application/json', Authorization : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IlJhanBhbCIsInBhc3N3b3JkIjoiUmFqcGFsQDE5OTQiLCJpYXQiOjE2NjIyOTAzNTR9.bLuknVbJG8hXKnPR6O-cYQL3QvQQKGel1EuD0vPFr_s'}
    When method GET
    Then status 200
    And print response
    And match response ==
      """
      {
      "isbn": "#string",
      "title": "#string",
      "subTitle": "#string",
      "author": "#string",
      "publish_date": "#string",
      "publisher": "#string",
      "pages": "#number",
      "description": "#string",
      "website": "#string"
      }
      """
      
      
        Scenario: To apply get request and complex Schema validation
    Given path '/BookStore/v1/Books'
    And param ISBN = '9781449325862'
    # And headers {Accept : 'application/json', Authorization : 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6IlJhanBhbCIsInBhc3N3b3JkIjoiUmFqcGFsQDE5OTQiLCJpYXQiOjE2NjIyOTAzNTR9.bLuknVbJG8hXKnPR6O-cYQL3QvQQKGel1EuD0vPFr_s'}
    When method GET
    Then status 200
    And print response
    And match response ==
      """
      {
    "books": '#[] #object' 
      }
      """

      
