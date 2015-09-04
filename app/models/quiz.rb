class Quiz < ActiveRecord::Base
	has_many :questions, inverse_of: :quiz 
	has_many :takers, inverse_of: :quiz
end
