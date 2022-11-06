Feature: JavaScript funtiona concepts in Karate framework

  Scenario: To create a javascript function
    * def getIntValue = function() { return 10; }
    Then print "Int Variable ==>", getIntValue()
    * def getRandomInt = function() { return Math.floor((100) * Math.random());}
    And print "Random int ==>", getRandomInt()
    * def getStringValue = function(arg1) {return "Hello " + arg1;}
    And print "String value ==>", getStringValue("World")

  Scenario: To create a javascript function and variable to use it in request Body
    Given url 'https://dummy.restapiexample.com/api/v1'
    And path '/create'
    * def name = 'Testname235'
    * def age = function() { return Math.floor((100) * Math.random()); }
    And request { "name": '#(name)',  "salary": "123",  "age": '#(age())'}
    And headers {Accept : 'application/json' }
    When method POST
    Then status 200
    And print response

@Jira
  Scenario: Jira post request to create Bug.
    Given url 'https://yrajpal207.atlassian.net'
    And path '/rest/api/3/issue'
    * def body = read("../resources/JiraBug.json")
    And request body
    And headers {Accept : 'application/json' , Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG' }
    When method POST
    Then status 201
    And print response
    
    
    Scenario: Validation of complex schema
    Given url 'https://demoqa.com/BookStore/v1'
    And path '/Books'
    When method GET
    Then status 200
    * def bookDetails = {"isbn": '#string', "title": '#string',"subTitle": '#string',"author": '#string',"publish_date": '#string',"publisher": '#string',"pages": '#number',"description": '#string',"website": '#string'}
    And match response ==
    """
    {
    "books": '#[] ##(bookDetails)'
    }
    """

