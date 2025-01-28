Feature: Home Test API using Karate Framework


  Scenario: TC1 - Get all Menu Items
    Given url baseUrl
    Given path 'inventory'
    When method GET
    Then status 200
    * def jsonResponse = response
    And assert jsonResponse.data.length >= 9
    * print jsonResponse.data.length
    And match each jsonResponse.data == { "id": '#notnull', "name": '#notnull', "price": '#notnull', "image": '#notnull' }
