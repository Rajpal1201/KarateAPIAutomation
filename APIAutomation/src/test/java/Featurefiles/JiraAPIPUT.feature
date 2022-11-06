Feature: Post request and validation of response

  Background: Setup the Base path
    # * def testdata = read("../resources/testdata.csv")
    Given url 'https://yrajpal207.atlassian.net/rest/api/3'
    And print '==============***============='

  Scenario: To apply put request to update a jira issue
    Given path '/issue/AP-3'
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG', X-Atlassian-Token : 'no-check'}
    And request
      """
      {
      "fields": {
         "summary":"Updating the summary karate put"
      }
      }
      """
    When method PUT
    Then status 204
    And print response
