class EventSerializer
  include FastJsonapi::ObjectSerializer
  attribute :name

  attribute :olympians
end

