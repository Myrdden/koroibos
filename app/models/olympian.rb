class Olympian < ActiveRecord::Base
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events

  def total_medals
    OlympianEvent.where(olympian_id: self.id).where.not(medal: 0).count
  end
end
