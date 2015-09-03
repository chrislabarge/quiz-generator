class Quiz < ActiveRecord::Base
	has_many :questions, inverse_of: :quiz 
end
