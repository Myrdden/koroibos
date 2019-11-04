class Event < ActiveRecord::Base
  belongs_to :sport
  has_many :olympians
  has_many :medals
end
