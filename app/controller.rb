class Controller < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/api/v1/olympians' do
    if params[:age]
      if params[:age] == 'youngest'
        json OlympianSerializer.new(Olympian.order('age ASC').first)
      elsif params[:age] == 'oldest'
        json OlympianSerializer.new(Olympian.order('age DESC').first)
      else
        json "Bad Param: #{params[:age]}"
      end
    else
      json OlympianSerializer.new(Olympian.includes(:team, :sport, :olympian_events))
    end
  end

  get '/api/v1/events' do
    json SportSerializer.new(Sport.includes(:events))
  end

  get '/api/v1/olympian_stats' do
    json StatsSerializer.new(OlympianStats.new)
  end
end
