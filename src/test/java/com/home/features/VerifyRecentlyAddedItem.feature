Feature: Recently Added item in the inventory

  Background:
    Given url baseUrl
    * def result = call read('classpath:com/home/features/AddItem.feature')
    * def itemId = result.itemId
    * def item = result.item

  Scenario: Validate recent added item is present in the inventory
    Given path 'inventory/filter'
    * print karate.get('itemId')
    And param id = itemId
    When method GET
    And status 200
    And match response == item