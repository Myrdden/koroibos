require 'spec_helper'

RSpec.describe Team, type: :model do
  it {should have_many :olympians}
end

