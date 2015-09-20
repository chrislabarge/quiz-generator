class CharactersController < ApplicationController
	before_filter :load_quiz

	def index
		@characters = @quiz.characters
	end

	def new
		@character = Character.new
	end

	def create
		@character = @quiz.characters.build(character_params)
		@character.quiz_id = quiz_id

		if @character.save
			redirect_to quiz_characters_path(@quiz), flash: {success: "Created Character"}
		else
			flash.now[:error] = @character.errors.full_messages
		end
	end

	def show
	end

	private
	def character_params
		params.require(:character).permit(:name)
	end

	def quiz_id
		params[:quiz_id]
	end

	def load_quiz
		@quiz = Quiz.find(quiz_id)
	end
end	