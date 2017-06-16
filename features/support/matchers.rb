require 'rspec/matchers'
require 'uuid'

RSpec::Matchers.define :should_equal do |expected|
  match do |actual|
    case expected
      when '<uuid>'
        UUID.validate(actual)
      when '<int>'
        Integer(actual) rescue false
      else
        expected == actual
    end
  end
end
