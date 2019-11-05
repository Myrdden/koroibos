require 'rack/test'
require 'rspec'
require 'simplecov'
require 'shoulda/matchers'

ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'

SimpleCov.start

module RSpecMixin
  include Rack::Test::Methods
  def app() Controller end
end

RSpec.configure do |config|
  config.include RSpecMixin
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
  end
end
