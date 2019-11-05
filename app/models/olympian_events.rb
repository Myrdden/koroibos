class OlympianEvent < ActiveRecord::Base
  belongs_to :olympian
  belongs_to :event
end
