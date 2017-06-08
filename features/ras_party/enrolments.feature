@enrolments
Feature: Enrol a respondent on a survey
  As a client of RAS Party
  I want to be able to record a respondent is enrolled on a survey
  So that they may progress with the survey

  @pending
  Scenario: Create a new respondent with an enrolment code
    Given there is an enrolment code '123' associated with business id '31317c23-763d-46a9-b4e5-c37ff5b4fbe7'
    When I create a respondent with party_id 'df64f155-af96-42e0-aab9-30118b7dd1f5' and enrolment_code '123'
    And I get the business with id '31317c23-763d-46a9-b4e5-c37ff5b4fbe7'
    Then the response status code is 200
    And the business response contains an association to 'df64f155-af96-42e0-aab9-30118b7dd1f5'
    And the business response contains an enrolment to '???'

  @pending
  Scenario: Enrol a respondent on a survey
