require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'ostruct'
require 'jargon/client'
require 'jargon/exceptions'

RSpec.configure do |config|
  config.mock_framework = :mocha
end
