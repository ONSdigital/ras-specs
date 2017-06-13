require 'rspec/matchers'
require 'uuid'

RSpec::Matchers.define :should_equal do |expected|
  match do |actual|
    if expected == '<uuid>'
      UUID.validate(actual)
    else
      expected == actual
    end
  end
end
