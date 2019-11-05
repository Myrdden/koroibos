class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age

  attribute :team do |obj|
    obj.team.name
  end

  attribute :sport do |obj|
    obj.sport.name
  end
end
