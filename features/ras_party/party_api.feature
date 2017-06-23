@party @api
Feature: Create new parties
  As a client of RAS Party
  I want to create a new party resource
  So that it is persisted for later use

  # Note: the hard-coded uuids here are used for testing. Possibly remove if/when random UUIDs can be used
  Scenario: Get a non-existing business party
    Given the party service is available
    When I get a business with party_id '31317c23-763d-46a9-b4e5-c37ff5b4fbe7'
    Then I should get response status code 404

  @nonidempotent
  Scenario: Create a new business party
    When I create a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                                | type   |
      | businessRef    | <int>                                | string |
      | contactName    | John Doe                             | string |
      | employeeCount  | 50                                   | int    |
      | enterpriseName | ABC Limited                          | string |
      | facsimile      | +44 1234 567890                      | string |
      | fulltimeCount  | 35                                   | int    |
      | legalStatus    | Private Limited Company              | string |
      | name           | Bolts and Ratchets Ltd               | string |
      | sic2003        | 2520                                 | string |
      | sic2007        | 2520                                 | string |
      | telephone      | +44 1234 567890                      | string |
      | tradingName    | ABC Trading Ltd                      | string |
      | turnover       | 350                                  | int    |
      | id             | 3b136c4b-7a14-4904-9e01-13364dd7b972 | string |
      | sampleUnitType | B                                    | string |

  @nonidempotent
  Scenario: Create a new respondent party
    When I create a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                                | type   |
      | id             | df64f155-af96-42e0-aab9-30118b7dd1f5 | string |
      | emailAddress   | john.doe@abc-ltd.com                 | string |
      | firstName      | Jacky                                | string |
      | lastName       | Turner                               | string |
      | sampleUnitType | BI                                   | string |
      | telephone      | +44 1234 567890                      | string |

  Scenario: Get an existing business party
    Given there is a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    When I get a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                                | type   |
      | businessRef    | <int>                                | string |
      | contactName    | John Doe                             | string |
      | employeeCount  | 50                                   | int    |
      | enterpriseName | ABC Limited                          | string |
      | facsimile      | +44 1234 567890                      | string |
      | fulltimeCount  | 35                                   | int    |
      | legalStatus    | Private Limited Company              | string |
      | name           | Bolts and Ratchets Ltd               | string |
      | sic2003        | 2520                                 | string |
      | sic2007        | 2520                                 | string |
      | telephone      | +44 1234 567890                      | string |
      | tradingName    | ABC Trading Ltd                      | string |
      | turnover       | 350                                  | int    |
      | id             | 3b136c4b-7a14-4904-9e01-13364dd7b972 | string |
      | sampleUnitType | B                                    | string |

  @jon
  Scenario: Get an existing respondent party
    Given there is a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    When I get a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                                | type   |
      | id             | df64f155-af96-42e0-aab9-30118b7dd1f5 | string |
      | emailAddress   | john.doe@abc-ltd.com                 | string |
      | firstName      | Jacky                                | string |
      | lastName       | Turner                               | string |
      | sampleUnitType | BI                                   | string |
      | telephone      | +44 1234 567890                      | string |

  Scenario: Try to get a business party with the id of a respondent party
    Given there is a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    When I get a business with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 404

  Scenario: Try to get a respondent party with the id of a business party
    Given there is a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    When I get a respondent with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    Then I should get response status code 404

  Scenario: Create a new business party with a generated id
    When I create a business party
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                   | type   |
      | businessRef    | <int>                   | string |
      | contactName    | John Doe                | string |
      | employeeCount  | 50                      | int    |
      | enterpriseName | ABC Limited             | string |
      | facsimile      | +44 1234 567890         | string |
      | fulltimeCount  | 35                      | int    |
      | legalStatus    | Private Limited Company | string |
      | name           | Bolts and Ratchets Ltd  | string |
      | sic2003        | 2520                    | string |
      | sic2007        | 2520                    | string |
      | telephone      | +44 1234 567890         | string |
      | tradingName    | ABC Trading Ltd         | string |
      | turnover       | 350                     | int    |
      | id             | <uuid>                  | string |
      | sampleUnitType | B                       | string |

  Scenario: Create a new respondent party with a generated id
    When I create a respondent party
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name           | value                | type   |
      | id             | <uuid>               | string |
      | emailAddress   | john.doe@abc-ltd.com | string |
      | firstName      | Jacky                | string |
      | lastName       | Turner               | string |
      | sampleUnitType | BI                   | string |
      | telephone      | +44 1234 567890      | string |
@pending
  Scenario: Attribute validation
    When I create a business party with attributes:
      | name           | value                  | type   |
      | employeeCount  | 50                     | int    |
      | enterpriseName | ABC Limited            | string |
      | facsimile      | +44 1234 567890        | string |
      | fulltimeCount  | 35                     | int    |
      | name           | Bolts and Ratchets Ltd | string |
      | sic2003        | 2520                   | string |
      | sic2007        | 2520                   | string |
      | telephone      | +44 1234 567890        | string |
      | tradingName    | ABC Trading Ltd        | string |
      | turnover       | 350                    | int    |
    Then I should get response status code 400
    # TODO: check the response message

  Scenario: Store and retrieve BRES attributes
    When I create a business party with attributes:
      | name           | value                   | type   |
      | checkletter    | abcd                    | string |
      | frosic92       | abc                     | string |
      | rusic92        | abc                     | string |
      | frosic2007     | abc                     | string |
      | rusic2007      | abc                     | string |
      | froempment     | 123                     | int    |
      | frotover       | 456                     | int    |
      | entref         | abc                     | string |
      | legalstatus    | abc                     | string |
      | entrepmkr      | abc                     | string |
      | region         | abc                     | string |
      | birthdate      | abc                     | string |
      | entname1       | abc                     | string |
      | entname2       | abc                     | string |
      | entname3       | abc                     | string |
      | runame1        | abc                     | string |
      | runame2        | abc                     | string |
      | runame3        | abc                     | string |
      | tradstyle1     | abc                     | string |
      | tradstyle2     | abc                     | string |
      | tradstyle3     | abc                     | string |
      | seltype        | abc                     | string |
      | inclexcl       | abc                     | string |
      | cell_no        | 123                     | int    |
      | formtype       | abc                     | string |
      | currency       | abc                     | string |
      # TODO: check the response status
    And I get the business party
    Then I should get response status code 200
    And the response body should contain the following properties:
      | name                   | value  | type   |
      | id                     | <uuid> | string |
      | attributes.checkletter | abcd   | string |
      | attributes.frosic92    | abc    | string |
      | attributes.rusic92     | abc    | string |
      | attributes.frosic2007  | abc    | string |
      | attributes.rusic2007   | abc    | string |
      | attributes.froempment  | 123    | int    |
      | attributes.frotover    | 456    | int    |
      | attributes.entref      | abc    | string |
      | attributes.legalstatus | abc    | string |
      | attributes.entrepmkr   | abc    | string |
      | attributes.region      | abc    | string |
      | attributes.birthdate   | abc    | string |
      | attributes.entname1    | abc    | string |
      | attributes.entname2    | abc    | string |
      | attributes.entname3    | abc    | string |
      | attributes.runame1     | abc    | string |
      | attributes.runame2     | abc    | string |
      | attributes.runame3     | abc    | string |
      | attributes.tradstyle1  | abc    | string |
      | attributes.tradstyle2  | abc    | string |
      | attributes.tradstyle3  | abc    | string |
      | attributes.seltype     | abc    | string |
      | attributes.inclexcl    | abc    | string |
      | attributes.cell_no     | 123    | int    |
      | attributes.formtype    | abc    | string |
      | attributes.currency    | abc    | string |
