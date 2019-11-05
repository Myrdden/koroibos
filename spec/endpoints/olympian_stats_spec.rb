require 'spec_helper'

RSpec.describe 'Olympian Stats:' do
  it 'Works' do
    path = File.expand_path('../expectations/olympian_stats.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/olympian_stats'

    expect(response.body).to eq(expected)
  end
end

