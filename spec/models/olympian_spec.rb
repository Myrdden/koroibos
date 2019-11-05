require 'spec_helper'

RSpec.describe Olympian, type: :model do
  it {should belong_to :team}
  it {should belong_to :sport}
  it {should have_many(:events).through(:olympian_events)}
  it {should have_many :medals}
end
