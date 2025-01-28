Feature: Home Test API using Karate Framework

  Scenario: TC2 - Filter by Id
    Given url baseUrl
    Given path 'inventory/filter'
    And param id = 3
    When method GET
    Then status 200
    * def jsonResponse = response
    And match jsonResponse == {"id": "3","name": "Baked Rolls x 8","image": "roll.png","price": "$10"}


