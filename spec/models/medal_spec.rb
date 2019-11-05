require 'spec_helper'

RSpec.describe Medal, type: :model do
  it {should belong_to :olympian}
  it {should belong_to :event}
end
