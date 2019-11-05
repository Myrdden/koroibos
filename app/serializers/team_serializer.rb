class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :olympians
end

