class Olympian < ActiveRecord::Base
  belongs_to :team
  belongs_to :sport
  has_many :events
  has_many :medals
end
