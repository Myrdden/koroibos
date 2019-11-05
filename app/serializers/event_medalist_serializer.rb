class EventMedalistSerializer
  include FastJsonapi::ObjectSerializer
  attribute :name
  attribute :medalists do |obj|
    medals = ['None', 'Bronze', 'Silver', 'Gold']
    obj.olympians.includes(:team).where.not(olympian_events: {medal: 0}).map do |olympian|
      {
        name: olympian.name,
        team: olympian.team,
        age: olympian.age,
        medal: medals[obj.olympian_events.find {|oe| oe.olympian_id == olympian.id}.medal]
      }
    end
  end
end
