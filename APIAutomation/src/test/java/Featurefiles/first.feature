Feature: To test the service with different scenarios.

 #Background: Setup the url and base path
   # * URL 'https://petstore.swagger.io/v2'
    #And print '==============***============='

   Scenario: To test basic get request 
   Given url 'https://petstore.swagger.io/v2/user/Rajpal'
   When method GET 
   Then status 200 
   
    Scenario: To test basic get request with path
   Given url 'https://petstore.swagger.io/v2'
   And path '/user/Rajpal'
   When method GET 
   Then status 200 
   
   