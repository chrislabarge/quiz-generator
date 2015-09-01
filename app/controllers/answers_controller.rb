class AnswersController < ApplicationController
	before_filter :load_question

	def index
		@answers = @question.answers
	end

	private
	def load_question
		@question = Question.find(question_id)
	end

	def question_id
		params[:question_id]
	end	
end