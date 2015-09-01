class QuestionsController < ApplicationController
  #before_filter :load_personal_assistant

  def index
  	@questions = Question.all
  end

  def new
    @question = Question.new 
    @characters = Character.all
    @answer = @question.answers.build
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to questions_path, flash: {success: 'Created Question'}
    else
      flash.now[:error] = @question.errors.full_messages
    end
  end

  def show
  end

  def edit
  end

  def delete
  end

  private
  def question_params
    params.require(:question).permit(:text,
                                      answers_attributes: [:id, :text, :character_id])
  end
end
