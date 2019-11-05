require 'spec_helper'

RSpec.describe 'Single Object:' do
  it 'Olmypian' do
    path = File.expand_path('../expectations/denis.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/olympians/50'

    expect(response.body).to eq(expected)
  end
end
