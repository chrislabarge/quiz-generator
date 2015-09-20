class TakersController < ApplicationController
  before_filter :load_quiz

  def new
  	 @taker = @quiz.takers.build
  end
  

  
  private
  def load_quiz
		@quiz = Quiz.find(quiz_id)
	end

	def quiz_id
		params[:quiz_id]
	end	
end
