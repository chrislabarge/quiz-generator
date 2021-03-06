class QuestionsController < ApplicationController
  before_filter :load_question, except: [:index, :new, :create, :tie_breaker]
  before_filter :load_characters, only: [:new, :edit]
  before_filter :load_quiz

  def index
  	@questions = @quiz.questions
  end

  def new
    @tie_breaker = nil

    if params[:link] == 'tie_breaker'  
      @tie_breaker = true
    end
    
    @question = Question.new 
    
    @answer = @question.answers.build
  end

  def tie_breaker
    @question = Question.new 
    
    @answer = @question.answers.build
  end

  def create
    @question = @quiz.questions.build(question_params)
    @question.quiz_id = quiz_id
    
    if @question.save && @question.tie_breaker
      redirect_to quiz_questions_path(@quiz), flash: {success: 'Created Tie-Breaker Question'}
    elsif @question.save && !@question.tie_breaker
      redirect_to quiz_questions_path(@quiz), flash: {success: 'Created Question'}
    else
      flash.now[:error] = @question.errors.full_messages
    end
  end

  def show
  end

  def edit   
   
  end

  def update
    successful_update = 'Updated Tie-Breaker Question and Answers' if @question.tie_breaker
    successful_update = 'Updated Question and Answers' if !@question.tie_breaker


    if @question.update_attributes(question_params)
      
      redirect_to quiz_questions_url(@quiz), flash: {success: successful_update}
    else
      flash.now[:error] = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash = {flash: {success: 'Deleted Question'}}
    else
      flash = {flash: {error: @question.errors.full_messages}}
    end

    redirect_to quiz_questions_url(@quiz, @question), flash
  end
  
  private
  def load_characters
    load_quiz
    @characters = @quiz.characters
  end

  def load_question
    @question = Question.find(question_id)
  end

  def question_id
    params[:id]
  end

  def question_params
    params.require(:question).permit(:text, :tie_breaker,
                                      answers_attributes: [:id, :text, :character_id])
  end

  def quiz_id
    params[:quiz_id]
  end

  def load_quiz
    @quiz = Quiz.find(quiz_id)
  end
end
