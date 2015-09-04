require 'rails_helper'

RSpec.describe Taker, type: :model do
  it {should have_many(:answers).through(:questions)}
  it {should have_many(:questions).through(:quiz)}
  it {should belong_to(:quiz).inverse_of(:takers)}
end
