Feature: Delete request and validation of response

  Background: Setup the Base path
    Given url 'https://yrajpal207.atlassian.net/rest/api/3'
    And print '==============***============='

  Scenario: To apply delete request to delete a jira issue
    Given path '/issue/' + IssueKey
    And headers {Content-Type : 'application/json', Authorization : 'Basic eXJhanBhbDIwN0BnbWFpbC5jb206OWxmcmxUN3U4WXJ6R2hjakxoVEdDNkRG'}
    When method DELETE
    Then status 204
    And print response
