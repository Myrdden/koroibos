require 'spec_helper'

RSpec.describe Olympian, type: :model do
  it {should belong_to :team}
  it {should belong_to :sport}
  it {should have_many(:events).through(:olympian_events)}

  it 'seed data is present' do
    expect(Olympian.count).to eq(2850)
  end
end
