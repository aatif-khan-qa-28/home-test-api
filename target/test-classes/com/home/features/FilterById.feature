Feature: Filter the item using the Id

  Background:
    * url baseUrl
    * def filterResponse = read('classpath:com/home/utils/filterResponse.json')
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_filter = endpoint['inventory-filter']

  Scenario: Filter the item from inventory using the ID
    Given path inventory_filter
    And param id = 3
    When method GET
    Then status 200
    And match response == filterResponse