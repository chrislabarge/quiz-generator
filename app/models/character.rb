class Character < ActiveRecord::Base
	has_many :answers, inverse_of: :character 
end
