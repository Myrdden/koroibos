require 'spec_helper'

RSpec.describe 'Olympian Age:' do
  it 'Youngest' do
    path = File.expand_path('../expectations/youngest_olympian.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/olympians?age=youngest'

    expect(response.body).to eq(expected)
  end

  it 'Oldest' do
    path = File.expand_path('../expectations/oldest_olympian.json', File.dirname(__FILE__))
    expected = File.read(path).chomp
    response = get '/api/v1/olympians?age=oldest'

    expect(response.body).to eq(expected)
  end

  it 'Bad Param' do
    response = get '/api/v1/olympians?age=yeet'

    expect(JSON.parse(response.body)).to eq('Bad Param: yeet')
  end
end
