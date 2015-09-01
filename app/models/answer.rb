class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers
  belongs_to :character, inverse_of: :answers
end
