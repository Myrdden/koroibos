require 'spec_helper'

RSpec.describe Sport, type: :model do
  it {should have_many :events}
end

