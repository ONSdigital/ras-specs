require 'httparty'


def parties_root
  host = $env['host']
  port = $env['port']
  "http://#{host}:#{port}/party-api/1.0.0"
end

def get_business(party_id)
  url = "#{parties_root}/businesses/id/#{party_id}"
  $log.info("GET #{url}")
  resp = HTTParty.get(url)
  $log.info(resp.parsed_response)
  resp
end

def get_respondent(party_id)
  url = "#{parties_root}/respondents/id/#{party_id}"
  $log.info("GET #{url}")
  resp = HTTParty.get(url)
  $log.info(resp.parsed_response)
  resp
end

def post_business(body)
  url = "#{parties_root}/businesses"
  $log.info("POST #{url}")
  $log.debug(body)
  resp = HTTParty.post(url,
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
  $log.info(resp.parsed_response)
  resp
end

def post_respondent(body)
  url = "#{parties_root}/respondents"
  $log.info("POST #{url}")
  $log.debug(body)
  resp = HTTParty.post(url,
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
  $log.info(resp.parsed_response)
  resp
end

def make_business_with_uuid(party_id, reference)
  template = File.read('./templates/business-with-uuid.json.erb')
  ERB.new(template).result(binding)
end

def make_business(reference)
  template = File.read('./templates/business.json.erb')
  ERB.new(template).result(binding)
end

def make_respondent_with_uuid(party_id)
  template = File.read('./templates/respondent-with-uuid.json.erb')
  ERB.new(template).result(binding)
end

def make_respondent()
  template = File.read('./templates/respondent.json.erb')
  ERB.new(template).result(binding)
end

def lookup(h, k)
  key = k.split('.')
  key_part = key.shift
  val = h
  while key_part
    val = val[key_part]
    key_part = key.shift
  end
  val
end

def cast(v, t)
  t == 'int' ? v.to_i : v
end