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

When(/^I post a business with party_id '(.+)'$/) do |party_id|
  # TODO: parameterise reference
  reference = '49900001000'
  json = make_business(party_id, reference)
  @response = post_business json
end

When(/^I post a respondent with party_id '(.+)'$/) do |party_id|
  json = make_respondent(party_id)
  @response = post_respondent json
end
