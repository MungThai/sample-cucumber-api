Feature: Google Books Rest API

  @google @books
  Scenario: google books get data
    Given a rest api "GoogleBooks"
    And query parameters
      | q | isbn:9781451648539 |
    When the system requests GET "/volumes"
    Then the response code is 200
    And the response time is less than 10000 milliseconds
    And trace out request response
    And the response body contains
      | element                                                                             | matcher          | value              | type |
      | totalItems                                                                          | is               | 1                  | int  |
      | kind                                                                                | equals           | books#volumes      | str  |
      | items.volumeInfo.title                                                              | contains         | Steve Jobs         | str  |
      | items.volumeInfo.findAll { it.pageCount <= 650 }.publisher                          | hasItem          | Simon and Schuster | str  |
      | items.volumeInfo.pageCount                                                          | hasItem          | 630                | int  |
      | items.volumeInfo.averageRating                                                      | hasItem          | 4                  | int  |
      | items.id                                                                            | contains         | 6e4cDvhrKhgC       | str  |
      | items.volumeInfo.authors.flatten()                                                  | hasItem          | Walter Isaacson    | str  |
      | items.volumeInfo.industryIdentifiers.type.flatten()                                 | hasItem          | ISBN_13            | str  |
      | items.volumeInfo.industryIdentifiers.flatten().findAll { !it.type.equals('') }.type | hasItems         | [ISBN_10,ISBN_13]  | str  |
      | items.volumeInfo.industryIdentifiers.flatten().findAll { !it.type.equals('') }.type | containsAnyOrder | [ISBN_10,ISBN_13]  | str  |
      | items.volumeInfo.industryIdentifiers.type.flatten()                                 | hasSize          | 2                  | int  |
      | doesnotexist                                                                        | isNull           |                    |      |
      | items.volumeInfo.doesnotexist                                                       | isNull           |                    |      |
      | kind                                                                                | startsWith       | book               | str  |
      | items.volumeInfo.title.find()                                                       | endsWith         | Jobs               | str  |