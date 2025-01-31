Feature: Add a new item in inventory

  Background:
    * url baseUrl
    * def addItemPayload = read('classpath:com/home/utils/AddItemSchema.json')
    * def res = read('classpath:com/home/utils/newItem.json')
    * def itemId = res.id
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_add = endpoint['inventory-add']

  Scenario Outline: Add item for non existent id
    * def itemPayload = addItemPayload
    * itemPayload.id = itemId
    * itemPayload.name = "<name>"
    * itemPayload.image = "<image>"
    * itemPayload.price = "<price>"

    Given path inventory_add
    And request itemPayload
    When method POST
    Then status 200

    Examples:
      | name     | image        | price |
      | Hawaiian | hawaiian.png | $14   |