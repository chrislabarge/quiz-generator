require 'rails_helper'

RSpec.describe Answer, type: :model do
  it {should belong_to(:question).inverse_of(:answers)}
  it {should belong_to(:character).inverse_of(:answers)}
end
