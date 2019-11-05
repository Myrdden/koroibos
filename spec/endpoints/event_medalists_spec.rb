require 'spec_helper'

RSpec.describe 'Event Medalists:' do
  it 'Works' do
    path = File.expand_path('../expectations/event_medalists_17.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/events/17/medalists'

    expect(response.body).to eq(expected)
  end
end

