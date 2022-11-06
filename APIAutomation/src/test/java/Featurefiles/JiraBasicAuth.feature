@Jira
Feature: Post request and validation of response

  Background: Setup the Base path
  # * def testdata = read("../resources/testdata.csv")
    Given url 'https://yrajpal207.atlassian.net/rest/api/3'
    And print '==============***============='
   
 
  Scenario: To apply post request and validation
    Given path '/issue/AP-3/attachments'
    * def auth = call read('../resources/auth.js') {username:'yrajpal207@gmail.com', password:'9lfrlT7u8YrzGhcjLhTGC6DF'}
    And headers {Content-Type : 'multipart/form-data', Authorization : '#(auth)', X-Atlassian-Token : 'no-check'}
    #location of the file, name of the file, content-type header value
    And multipart file file = {read: "SWTM-2088_Atlassian-Git-Cheatsheet.pdf", filename: "SWTM-2088_Atlassian-Git-Cheatsheet.pdf" , Content-type: 'multipart/form-data'}
    When method POST
    Then status 200
    And print response
