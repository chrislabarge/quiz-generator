require 'rails_helper'

RSpec.describe Question, type: :model do
  it {should have_many(:answers).inverse_of(:question)}
  it {should belong_to(:quiz).inverse_of(:questions)}

  it {should accept_nested_attributes_for(:answers)}
end
