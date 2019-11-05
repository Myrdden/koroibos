require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'fileutils'
require 'activerecord-import'
require 'rspec/core/rake_task'
require './app'

RSpec::Core::RakeTask.new(:spec)

task :default do |t|
  sh 'RACK_ENV=test rake import[test,test_seeds.csv]'
  # Rake::Task[:import].invoke('test', 'test_seeds.csv')
  Rake::Task[:spec].invoke
end

task :import, [:env, :file] do |t, args|
  args.with_defaults(env: 'development', file: 'prod_seeds_2016.csv')
  if args.env == 'test'
    sh 'RACK_ENV=test rake db:migrate:reset db:test:prepare'
  else
    sh 'rake db:drop'
    sh 'rake db:create'
    sh 'rake db:migrate'
  end

  olympian_columns = [:name, :sex, :age, :height, :weight, :team_id, :sport_id]
  olympians = []
  last_olympian = 0
  team_columns = [:name]
  teams = []
  next_team = 1
  sport_columns = [:name]
  sports = []
  next_sport = 1
  event_columns = [:name, :sport_id]
  events = []
  next_event = 1
  olympian_event_columns = [:games, :medal, :olympian_id, :event_id]
  olympian_events = []
  last = ""
  contents = CSV.read("csv/#{args.file}")
  contents.shift
  contents.each do |line|
    sport = sports.find_index {|sport| sport[0] == line[7]}
    if last != line[0]
      olympian = line[0..4]
      team = teams.find_index {|team| team[0] == line[5]}
      if team
        olympian << team + 1
      else
        olympian << next_team
        next_team += 1
        teams << [line[5]]
      end
      if sport
        olympian << sport + 1
      else
        olympian << next_sport
        sport = next_sport - 1
        next_sport += 1
        sports << [line[7]]
      end
      olympians << olympian
      last_olympian += 1
    end
    medal = 0
    medal = 1 if line[9] == 'Bronze'
    medal = 2 if line[9] == 'Silver'
    medal = 3 if line[9] == 'Gold'
    olympian_event = [line[6], medal, last_olympian]
    event = events.find_index {|event| event == line[8]}
    if event
      olympian_event << event + 1
    else
      olympian_event << next_event
      next_event += 1
      events << [line[8], (sport + 1)]
    end
    olympian_events << olympian_event
    last = line[0]
  end
  Sport.import sport_columns, sports
  Team.import team_columns, teams
  Olympian.import olympian_columns, olympians
  Event.import event_columns, events
  OlympianEvent.import olympian_event_columns, olympian_events
end
