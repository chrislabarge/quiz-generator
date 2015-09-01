class Question < ActiveRecord::Base
	has_many :answers, inverse_of: :question 

	accepts_nested_attributes_for :answers

	delegate :text, to: :answer, prefix: true, allow_nil: true 
end
