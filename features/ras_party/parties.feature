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
    # TODO: inspect the returned json

  Scenario: Get an existing respondent party
    When I get a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    Then I should get response status code 200
