Feature: Add item with missing attributes

  Background:
    * url baseUrl
    * def addItemPayload = read('classpath:com/home/utils/AddItemSchema.json')
    * def expectedMessage = read('classpath:com/home/utils/expected_error_message.json')
    * def errorResponse = expectedMessage['error-message']
    * def endpoint = read('classpath:com/home/utils/apiEndpoints.json')
    * def inventory_add = endpoint['inventory-add']

  Scenario Outline: Try to add item with missing information
    * def itemPayload = addItemPayload
    * remove itemPayload.id
    * itemPayload.name = "<name>"
    * itemPayload.image = "<image>"
    * itemPayload.price = "<price>"

    Given path inventory_add
    And request itemPayload
    When method POST
    Then status 400
    And match response == errorResponse

    Examples:
      | name     | image        | price |
      | Hawaiian | hawaiian.png | $14   |