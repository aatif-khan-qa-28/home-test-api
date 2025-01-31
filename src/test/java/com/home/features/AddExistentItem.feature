Feature: Add item with the existing ID in inventory

  Background:
    * url baseUrl
    * def addItemPayload = read('classpath:com/home/utils/AddItemSchema.json')

  Scenario Outline: Add item for existent id
    * def itemPayload = addItemPayload
    * itemPayload.id = "<id>"
    * itemPayload.name = "<name>"
    * itemPayload.image = "<image>"
    * itemPayload.price = "<price>"

    Given path 'inventory/add'
    And request itemPayload
    When method POST
    Then status 400
    And match response == "Bad Request"

    Examples:
      | id | name     | image        | price |
      | 1 | Hawaiian | hawaiian.png | $14   |