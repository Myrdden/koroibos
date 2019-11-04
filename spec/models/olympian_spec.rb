require 'spec_helper'

RSpec.describe Olympian, type: :model do
  it {should belong_to :team}
end
