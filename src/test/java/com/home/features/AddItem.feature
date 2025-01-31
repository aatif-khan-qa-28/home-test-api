Feature: Add a new item in inventory

  Background:
    Given url baseUrl
    * def addItemPayload = read('classpath:com/home/utils/AddItemSchema.json')

  Scenario Outline: Add item for non existent id
    * def itemPayload = addItemPayload
    * itemPayload.id = "<id>"
    * itemPayload.name = "<name>"
    * itemPayload.image = "<image>"
    * itemPayload.price = "<price>"

    Given path 'inventory/add'
    And request itemPayload
    When method POST
    Then status 200
    * karate.set('itemId', itemPayload.id)
    * karate.set('item', itemPayload)
    * print karate.get('itemId')

    Examples:
      | id | name     | image        | price |
      | 19 | Hawaiian | hawaiian.png | $14   |