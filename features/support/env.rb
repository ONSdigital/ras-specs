require 'rspec/core'
require 'rspec/expectations'
require 'logger'
require 'inifile'


RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end


$log = Logger.new(STDOUT)
$log.level = Logger::DEBUG

config = IniFile.load('./config/config.ini')

env = ENV['ONS_ENV']
$env = config[env]
