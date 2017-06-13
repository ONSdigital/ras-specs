require 'httparty'


def parties_root
  host = $env['host']
  port = $env['port']
  "http://#{host}:#{port}/party-api/1.0.4"
end

def get_business(party_id)
  resp = HTTParty.get("#{parties_root}/businesses/id/#{party_id}")
  $log.info(resp)
  resp
end

def get_respondent(party_id)
  resp = HTTParty.get("#{parties_root}/respondents/id/#{party_id}")
  $log.info(resp)
  resp
end

def post_business(body)
  resp = HTTParty.post("#{parties_root}/businesses",
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
  $log.info(resp)
  resp
end

def post_respondent(body)
  resp = HTTParty.post("#{parties_root}/respondents",
                :body => body,
                :headers => { 'Content-Type'.freeze => 'application/json' } )
  $log.info(resp)
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
