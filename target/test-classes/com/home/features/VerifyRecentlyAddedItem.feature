Feature: Recently Added item in the inventory

  Background:
    Given url baseUrl
    * def res = read('classpath:com/home/utils/newItem.json')
    * def itemId = res.id
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_filter = endpoint['inventory-filter']

  Scenario: Validate recent added item is present in the inventory
    Given path inventory_filter
    * print karate.get('itemId')
    And param id = itemId
    When method GET
    And status 200
    And match response == res