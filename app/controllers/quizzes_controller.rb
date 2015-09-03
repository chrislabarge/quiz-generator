class QuizzesController < ApplicationController
	before_filter :load_quiz, except: [:index, :new, :create]

	def index
		@quizzes = Quiz.all
	end

	def new
		@quiz = Quiz.new
	end

	def create
		@quiz = Quiz.new(quiz_params)
		
		if @quiz.save
			redirect_to quizzes_path, flash: {success: "Created Quiz"}
		else
			flash.now[:error] = @quiz.errors.full_messages
		end
	end

	def edit
	end 

	def update
    if @quiz.update_attributes(quiz_params)
      redirect_to quizzes_url(@quiz), flash: {success: "Updated Quiz"}
    else
      flash.now[:error] = @quiz.errors.full_messages
      render :edit
    end
  end

	def show
	end

	private
	def load_quiz
    @quiz = Quiz.find(quiz_id)
  end

  def quiz_id
    params[:id]
  end

	def quiz_params
		params.require(:quiz).permit(:name)
	end
end	