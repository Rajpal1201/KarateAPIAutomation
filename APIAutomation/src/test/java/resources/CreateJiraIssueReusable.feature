Feature: Create Jira issue using Post request

  Background: Setup the Base path
    # * def testdata = read("../resources/testdata.csv")
    Given url 'https://yrajpal207.atlassian.net/rest/api/3'
    And print '==============***============='

  Scenario: To create jira issue-Bug
    Given path '/issue'
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG', X-Atlassian-Token : 'no-check'}
    * def summary = "Defect Rest API using this feature file in another 1"
    And request
      """
       {
       "fields": {
      "project": {
        "key": "AP"
      },
      "summary": '#(summary)',
      "issuetype": {
        "name": "Bug"
      },
      "reporter": {
        "id": "60184c7ba7fb4000692cdbca"
      }
      }
      }
      """
    When method POST
    Then status 201
    And print response
    * def key = response.key
    And print key
