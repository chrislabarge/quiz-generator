require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it {should have_many(:questions).inverse_of(:quiz)}
end
