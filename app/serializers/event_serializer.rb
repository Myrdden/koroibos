class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :olympians
end

