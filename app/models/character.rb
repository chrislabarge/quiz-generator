class Character < ActiveRecord::Base
	has_many :answers, inverse_of: :character 
	belongs_to :quiz, inverse_of: :characters
end
