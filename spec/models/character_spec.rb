require 'rails_helper'

RSpec.describe Character, type: :model do
 it {should have_many(:answers).inverse_of(:character)}
end
