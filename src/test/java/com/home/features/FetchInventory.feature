Feature: Fetch all the items from the inventory

  Background:
    * url baseUrl
    * def inventoryResponse = read('classpath:com/home/utils/InventorySchema.json')

  Scenario: Get all Menu Items from the inventory
    Given path 'inventory'
    When method GET
    Then status 200
    * def jsonResponse = response
    And assert jsonResponse.data.length >= 9
    And match each jsonResponse.data == inventoryResponse