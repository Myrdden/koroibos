class Controller < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/api/v1/olympians' do
    json OlympianSerializer.new(Olympian.includes(:team, :sport))
  end
end
