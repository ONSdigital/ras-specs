require 'httparty'

def parties_root
  host = $env['host']
  port = $env['port']
  "http://#{host}:#{port}/party-api/1.0.4"
end

def get_business(party_id)
  HTTParty.get("#{parties_root}/businesses/id/#{party_id}")
end

def get_respondent(party_id)
  HTTParty.get("#{parties_root}/respondents/id/#{party_id}")
end

def post_business(body)
  HTTParty.post("#{parties_root}/businesses",
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
end

def post_respondent(body)
  HTTParty.post("#{parties_root}/respondents",
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
end

def make_business(party_id, reference)
  template = File.read('./templates/business.json.erb')
  ERB.new(template).result(binding)
end

def make_respondent(party_id)
  template = File.read('./templates/respondent.json.erb')
  ERB.new(template).result(binding)
end
