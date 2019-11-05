require 'spec_helper'

RSpec.describe Event, type: :model do
  it {should belong_to :sport}
  it {should have_many(:olympians).through(:olympian_events)}
  it {should have_many :medals}
end
