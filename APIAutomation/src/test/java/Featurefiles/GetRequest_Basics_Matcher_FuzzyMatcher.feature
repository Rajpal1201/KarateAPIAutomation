Feature: To apply Background and path keyword in request.

  Background: Setup the Base path
    Given url 'https://petstore.swagger.io/v2'
    And print '==============***============='

  Scenario: To apply Background details in get request
    #Given url
    And path '/user/Rajpal12'
    And header Accept = 'application/json'
    When method GET
    Then status 404
    And print response
    And match response ==
      """
      {
      "code": 1,
      "type": "error",
      "message": "User not found"
      } 
      """

  Scenario: To apply background and path in get request
    Given path '/user/Rajpal12/'
    And header Accept = 'application/xml'
    When method GET
    Then status 404
    And print response
    And match response ==
      """
      <apiResponse>
      <message>User not found</message>
      <type>error</type> 
      </apiResponse>
      """

  Scenario: To apply Match response in get request
    #Given url
    And path '/user/Rajpal12'
    And header Accept = 'application/json'
    When method GET
    Then status 404
    And print response
    And match response contains deep {"message": "User not found"}

  Scenario: To apply Match response in Countries get request
    Given url 'https://restcountries.com/v3.1'
    And path '/name/peru'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    #Validation using Match keyword
    And match response.[0].name.common == 'Peru'
    And match response.[0].name.nativeName.aym == {"official": "Piruw Suyu","common": "Piruw"}
    And match response.[0].tld[0] == '.pe'
    And match response.[0].idd.suffixes[0] == '1'
    And match response.[0].altSpellings[2] == 'República del Perú'
    #Validation using wild card char
    And match response.[0].altSpellings[*] == ["PE", "Republic of Peru","República del Perú"]
    #Validation using contains keyword
    And match response.[0].altSpellings[*] contains "PE"
    And match response.[*].name.common contains 'Peru'
    And match response.[*].altSpellings[*] contains ["Republic of Peru","República del Perú"]

  Scenario: To apply match keyword for validation of xml with Query param
    Given path '/pet/findByStatus'
    And param status = 'available'
    And header Accept = 'application/xml'
    When method GET
    Then print response
    And status 200
    And match response/pets/Pet[1]/status == 'available'
    And match response.pets.Pet[1].status == 'available'
    And match /pets/Pet[1]/status == 'available'

  Scenario: To apply Fuzzy Matcher to validate response in Countries get request in json
    Given url 'https://restcountries.com/v3.1'
    And path '/name/peru'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    #Validation using Fuzzy Matcher
    And match response.[0].name.common == 'Peru'
    And match response.[0].name.nativeName.aym == {"official": "#ignore","common": "Piruw"}
    And match response.[0].tld[0] == '#notnull'
    And match response.[0].idd.suffixes[0] == '#present'
    And match response.[0].altSpellings == '#array'
    And match response.[0].name.nativeName.aym == '#object'
    And match response.[0].name.common == '#? _.length == 4'
    And match response.[0].altSpellings == '#[] #string? _.length >=0'

  Scenario: To apply Fuzzy matcher for validation of xml with Query param
    Given path '/pet/findByStatus'
    And param status = 'available'
    And header Accept = 'application/xml'
    When method GET
    Then print response
    And status 200
    And match response/pets/Pet[1]/status == '#notnull'
    And match response.pets.Pet[1].status == '#string'
    And match /pets/Pet[1]/status == 'available'
    And match response/pets/Pet[1]/status == '#? _.length == 9'
    And match response/pets/Pet[1]/id == '#? _ == 9223372000001084225'
    And match response/pets/Pet == '#[] #ignore? _.length >=2'

  Scenario: To apply external file json validation in Countries get request in json
    Given url 'https://restcountries.com/v3.1'
    And path '/name/peru'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * def actualResponse = read("../resources/RestCountriesPero.json")
    And print "file==>", actualResponse
    And match response == actualResponse
    And match actualResponse.[0].name.common == 'Peru'
