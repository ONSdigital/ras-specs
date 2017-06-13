@parties
Feature: Parties
  As a client of RAS Party
  I want to POST and GET party resources
  So that I can persist party data

  Scenario: Get a non-existing business party
    Given the party service is available
    When I get a business with party_id '31317c23-763d-46a9-b4e5-c37ff5b4fbe7'
    Then I should get response status code 404

  Scenario: Create a new business party
    When I create a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    Then I should get response status code 200

  Scenario: Create a new respondent party
    When I create a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 200

  Scenario: Get an existing business party
    When I get a business with party_id '3b136c4b-7a14-4904-9e01-13364dd7b972'
    Then I should get response status code 200
    And the response body contains the following properties:
      | name                      | value                                |
      | address.locality          | Green Industrial Park                |
      | address.paon              | Unit 5                               |
      | address.postcode          | NT23 7TN                             |
      | address.saon              | Office 2a                            |
      | address.street            | Milton Street                        |
      | address.town              | New Town                             |
      | attributes.businessRef    | 0123456789                           |
      | attributes.contactName    | John Doe                             |
      | attributes.employeeCount  | 50                                   |
      | attributes.enterpriseName | ABC Limited                          |
      | attributes.facsimile      | +44 1234 567890                      |
      | attributes.fulltimeCount  | 35                                   |
      | attributes.legalStatus    | Private Limited Company              |
      | attributes.name           | Bolts and Ratchets Ltd               |
      | attributes.sic2003        | 2520                                 |
      | attributes.sic2007        | 2520                                 |
      | attributes.telephone      | +44 1234 567890                      |
      | attributes.tradingName    | ABC Trading Ltd                      |
      | attributes.turnover       | 350                                  |
      | id                        | 3b136c4b-7a14-4904-9e01-13364dd7b972 |
      | reference                 | 49900001000                          |
      | sampleUnitType            | B                                    |


  Scenario: Get an existing respondent party
    When I get a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 200
    And the response body contains the following properties:
      | name           | value                                |
      | id             | df64f155-af96-42e0-aab9-30118b7dd1f5 |
      | emailAddress   | john.doe@abc-ltd.com                 |
      | firstName      | Jacky                                |
      | lastName       | Turner                               |
      | sampleUnitType | BI                                   |
      | telephone      | +44 1234 567890                      |


  # TODO: try and get a respondent with a business party id and vice-versa
  # TODO: test creation with a generated UUID (will need to remember the UUID)