Feature: Fetch all the items from the inventory

  Background:
    * url baseUrl
    * def inventoryResponse = read('classpath:com/home/utils/InventorySchema.json')
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory = endpoint['inventory']

  Scenario: Get all Menu Items from the inventory
    Given path inventory
    When method GET
    Then status 200
    * def jsonResponse = response
    And assert jsonResponse.data.length >= 9
    And match each jsonResponse.data == inventoryResponse