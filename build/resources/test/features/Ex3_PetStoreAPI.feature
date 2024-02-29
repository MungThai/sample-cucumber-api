Feature: Pet Store Rest API

  @petstore
  Scenario Outline: Delete Pet Information
    Given a rest api "PetStore"
    Given a header
      | Content-Type | application/json |
    And path parameters
      | petID | <petID> |
    When the system requests DELETE "/v2/pet/{petID}"

    Examples:
      | petID |
      | 167   |
      | 267   |
      | 367   |

  @petstore
  Scenario Outline: Create Pet Information
    Given a rest api "PetStore"
    Given a header
      | Content-Type | application/json |
    And base input data "<<PetStoreTestData.default>>"
    And a request body "{"id":<petID>,"name":"<petName>"}"
    When the system requests POST "/v2/pet/"
    Then the response code is 200

    Examples:
      | petID | petName  |
      | 167   | Spot     |
      | 267   | Whiskers |
      | 367   | Rover    |

  @petstore
  Scenario Outline: Get Pet Information 1
    Given a rest api "PetStore"
    Given a header
      | Content-Type | application/json |
    And path parameters
      | petID | <petID> |
    When the system requests GET "/v2/pet/{petID}"
    Then the response code is 200
    And the response body contains
      | element | matcher | value     | type |
      | name    | equals  | <petName> | str  |


    Examples:
      | petID | petName  |
      | 167   | Spot     |
      | 267   | Whiskers |
      | 367   | Rover    |

  @petstore
  Scenario Outline: Get Pet Information 2
    Given a rest api "PetStore"
    Given a header
      | Content-Type | application/json |
    And path parameters
      | petID | <petID> |
    When the system requests GET "/v2/pet/{petID}"
    Then the response code is 200
    And the response body contains
      | id   | <petID>   |
      | name | <petName> |

    Examples:
      | petID | petName  |
      | 167   | Spot     |
      | 267   | Whiskers |
      | 367   | Rover    |