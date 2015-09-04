class Taker < ActiveRecord::Base
  belongs_to :quiz, inverse_of: :takers
  has_many :questions, :through => :quiz
  has_many :answers, :through => :questions
end
