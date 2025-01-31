Feature: Hit the incorrect endpoint and verify

  Background:
    * url baseUrl
    * def filterResponse = read('classpath:com/home/utils/filterResponse.json')
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_filter = endpoint['inventory-filter']
    * def errorMessage = read('classpath:com/home/utils/expected_error_message.json')
    * def errorResponse = errorMessage['bad-response']

  Scenario: Validate incorrect endpoint
    Given path inventory_filter
    And path id = 3
    When method GET
    Then status 400
    And match response == errorResponse