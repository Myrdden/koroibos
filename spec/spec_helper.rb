require 'rack/test'
require 'rspec'
require 'shoulda/matchers'

ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'

module RSpecMixin
  include Rack::Test::Methods
  def app() BaseController end
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
