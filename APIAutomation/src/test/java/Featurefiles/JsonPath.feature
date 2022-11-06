Feature: JsonPath expression to validate response


#https://github.com/karatelabs/karate/blob/master/karate-junit4/src/test/java/com/intuit/karate/junit4/demos/examples.feature


  Scenario: To create JsonPath expression to validate response
    Given url 'https://demoqa.com/BookStore/v1'
    And path '/Books'
    When method GET
    Then status 200
    And print response
    * def title = "Git Pocket Guide"
    * def Isbn1 = karate.jsonPath(response, "$.books.[0].isbn")
    * def IsbnAll = karate.jsonPath(response, "$.books.[*].isbn")
    * def IsbnAbs = karate.jsonPath(response, "$..isbn")
    * def FilterExpression = karate.jsonPath(response, "$..books[?(@.title=='Git Pocket Guide')]")
    * def FilterExpression_withVariable = karate.jsonPath(response, "$..books[?(@.title=='"+ title +"')]")
    And print Isbn1
    And print IsbnAll
    And print IsbnAbs
    And print FilterExpression
    And print FilterExpression_withVariable
    

