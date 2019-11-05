class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attributes :events do |obj|
    obj.events.map {|event| event.name}
  end
end
