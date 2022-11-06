@Jira
Feature: Post request and validation of response

  Background: Setup the Base path
  # * def testdata = read("../resources/testdata.csv")
    Given url 'https://yrajpal207.atlassian.net/rest/api/3'
    And print '==============***============='
   
 
  Scenario: To apply post request and validation
    Given path '/issue/AP-3/attachments'
    And headers {Content-Type : 'multipart/form-data', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG', X-Atlassian-Token : 'no-check'}
    #location of the file, name of the file, content-type header value
    And multipart file file = {read: "SWTM-2088_Atlassian-Git-Cheatsheet.pdf", filename: "SWTM-2088_Atlassian-Git-Cheatsheet.pdf" , Content-type: 'multipart/form-data'}
    When method POST
    Then status 200
    And print response

  Scenario Outline: To apply Data Driven concept in karate <method>
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print <status>

    Examples: 
      | url                                         | path        | method | status |
      | https://yrajpal207.atlassian.net/rest/api/3 | /issue      | get    |    200 |
      | https://yrajpal207.atlassian.net/rest/api/3 | /issue/AP-3 | post   |    201 |

  Scenario Outline: To create bug using data driven - <Summary>
    Given path '/issue'
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG'}
    And request { "fields": { "project": { "key": '#(ProjectKey)'}, "summary": '#(Summary)', "issuetype": { "name": '#(issuetype)'}, "reporter": {"id": "60184c7ba7fb4000692cdbca"}}}
    When method POST
    Then status <status>
    And print response

    Examples: 
      | ProjectKey | Summary                           | issuetype | status |
      | AP         | Create defect using data driven 1 | Bug       |    201 |
      | AP         | Create defect using data driven 2 | Bug       |    201 |
      | AA         | Create defect using data driven 3 | Bug       |    400 |
 
 
  Scenario Outline: To create bug using data driven using CSV file - <Summary>
    Given path '/issue'
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG'}
    And request { "fields": { "project": { "key": '#(ProjectKey)'}, "summary": '#(Summary)', "issuetype": { "name": '#(issuetype)'}, "reporter": {"id": "60184c7ba7fb4000692cdbca"}}}
    When method POST
    Then status <status>
    And print response

    Examples:     
      | read("../resources/testdata.csv") |
     # | testdata |
