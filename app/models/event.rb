class Event < ActiveRecord::Base
  belongs_to :sport
  has_many :olympian_events
  has_many :olympians, through: :olympian_events
  has_many :medals
end