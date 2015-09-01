require 'rails_helper'

RSpec.describe Question, type: :model do
  it {should have_many(:answers).inverse_of(:question)}

  it {should accept_nested_attributes_for(:answers)}
end
