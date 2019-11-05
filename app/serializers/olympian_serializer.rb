class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age

  attribute :team do |obj|
    obj.team.name
  end

  attribute :sport do |obj|
    obj.sport.name
  end

  attribute :total_medals do |obj|
    obj.olympian_events.inject(0) {|sum,x| sum + (x.medal == 0 ? 0 : 1)}
  end
end
