require 'spec_helper'

RSpec.describe 'All Objects:' do
  it 'Olmypians' do
    path = File.expand_path('../expectations/all_olympians.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/olympians'

    expect(response.body).to eq(expected)
  end

  it 'Events' do
    path = File.expand_path('../expectations/all_events.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/events'

    expect(response.body).to eq(expected)
  end
end
