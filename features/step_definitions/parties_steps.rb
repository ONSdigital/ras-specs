require 'json'
require 'securerandom'


def business_ref
  ref = rand(99999999999)
  ref.to_s
end


Given(/^the party service is available$/) do
  # TODO: decide how to implement this (which endpoint to hit?)
  true
end

When(/^I get a business with party_id '(.+)'$/) do |party_id|
  @response = get_business party_id
end

When(/^I get a respondent with party_id '(.+)'$/) do |party_id|
  @response = get_respondent party_id
end

Then(/^I should get response status code (\d+)$/) do |expected_status|
  expect(@response.code).to eq expected_status.to_i
end

When(/^I create a business with party_id '(.+)'$/) do |party_id|
  json = make_business_with_uuid(party_id, business_ref)
  @response = post_business json
end

When(/^I create a business party$/) do
  json = make_business(business_ref)
  @response = post_business json
  @business_id = @response.parsed_response['id']
end

When(/^I create a business party with attributes:$/) do |table|
  business = {
      'businessRef'.freeze => business_ref,
      'attributes'.freeze => {

      }
  }

  attribute_data = table.hashes
  attribute_data.each do |item|
    business['attributes'][item['name']] = cast(item['value'], item['type'])
  end

  @response = post_business business.to_json
  @business_id = @response.parsed_response['id']
end

Given(/^there is a business with party_id '(.+)'$/) do |party_id|
  # TODO: parameterise reference
  json = make_business_with_uuid(party_id, business_ref)
  @response = post_business json
  @business_id = @response.parsed_response['id']
end

When(/^I create a respondent with party_id '(.+)'$/) do |party_id|
  json = make_respondent_with_uuid(party_id)
  @response = post_respondent json
end

When(/^I create a respondent party$/) do
  json = make_respondent
  @response = post_respondent json
end


Given(/^there is a respondent with party_id '(.+)'$/) do |party_id|
  party_id = SecureRandom.uuid
  json = make_respondent_with_uuid(party_id)
  @response = post_respondent json
end

Then(/^the response body should contain the following properties:$/) do |table|

  response_body = JSON.parse(@response.body)
  expected_data = table.hashes
  expected_data.each do |item|
    expected_key = item['name']
    actual_value = lookup(response_body, expected_key)
    expect(actual_value).not_to be_nil, "'#{expected_key}' doesn't exist in response"

    expected_value = cast(item['value'], item['type'])
    expect(actual_value).to should_equal expected_value

  end
end


When(/^I get the business party$/) do
  party_id = @business_id
  print "**** Getting business with id #{party_id}"
  @response = get_business party_id
end
