class Controller < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/api/v1/olympians' do
    json "yeet"
  end
end
