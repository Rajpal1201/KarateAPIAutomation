@Jira
Feature: Post request and validation of response

  Background: Setup the Base path
    # * def testdata = read("../resources/testdata.csv")
    * def Var_url = 'https://yrajpal207.atlassian.net/rest/api/3'

  @Smoke
  Scenario: To access another Feature file
    #Given call read("../resources/CreateJiraIssueReusable.feature")
    * def CreateIssueRequest = call read("../resources/CreateJiraIssueReusable.feature")
    And print CreateIssueRequest.summary
    And print CreateIssueRequest.key

@Regression @UAT
  Scenario: To access another Feature file with variables
    #Given call read("../resources/CreateJiraIssueReusable.feature")
    * def CreateIssueRequest = call read("../resources/CreateJiraIssueReusable2.feature") { _url: '#(Var_url)', _path: '/issue', summary:'Defect Rest API using this feature file in another with variables 1'}
    And print CreateIssueRequest.key
    #Put
    Given url Var_url
    And path "/issue/"+ CreateIssueRequest.key + "/"
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG'}
    And request
      """
      {
      "fields": {
         "summary":"Updating the summary karate put in resuable feature file"
      }
      }
      """
    When method PUT
    Then status 204
    And print response
    #Delete
    * def DeleteIssueRequest = call read("../resources/JiraAPIDelete.feature") { IssueKey: '#(CreateIssueRequest.key)' }
    
    
