class QuestionsController < ApplicationController
  before_filter :load_question, except: [:index, :new, :create]
  before_filter :load_characters, only: [:new, :edit]

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

  def update
    if @question.update_attributes(question_params)
      redirect_to questions_url(@question), flash: {success: "Updated Question"}
    else
      flash.now[:error] = @question.errors.full_messages
      render :edit
    end
  end

  def delete
  end

  private
  def load_question
    @question = Question.find(question_id)
  end

  def load_characters
    @characters = Character.all
  end

  def question_id
    params[:id]
  end

  def question_params
    params.require(:question).permit(:text,
                                      answers_attributes: [:id, :text, :character_id])
  end
end
