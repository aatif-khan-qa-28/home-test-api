Feature: Filter the item using non existent Id

  Background:
    * url baseUrl
    * def filterResponse = read('classpath:com/home/utils/filterResponse.json')
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_filter = endpoint['inventory-filter']
    * def errorMessage = read('classpath:com/home/utils/expected_error_message.json')
    * def errorResponse = errorMessage['error-response']

  Scenario Outline: Filter the non existent item from inventory using the ID
    Given path inventory_filter
    And param id = "<id>"
    When method GET
    Then status 404
    And match response == errorResponse
    Examples:
      | id |
      | 23 |
      | 24 |