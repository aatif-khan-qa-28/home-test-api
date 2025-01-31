Feature: Filter the item using the Id

  Background:
    * url baseUrl
    * def filterResponse = read('classpath:com/home/utils/filterResponse.json')

  Scenario: Filter the item from inventory using the ID
    Given path 'inventory/filter'
    And param id = 3
    When method GET
    Then status 200
    And match response == filterResponse