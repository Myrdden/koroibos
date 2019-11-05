class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :olympians

  attribute :total_medals do |obj|
    obj.olympians.map {|o| o.olympian_events.inject(0) {|sum,x| sum + (x.medal == 0 ? 0 : 1)}}.reduce(:+)
  end
end

