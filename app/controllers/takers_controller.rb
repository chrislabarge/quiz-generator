class TakersController < ApplicationController
  before_filter :load_quiz
  before_filter :load_questions
  before_filter :load_characters  

  def new
  	@taker = Taker.new    
  end
  
  def create
    # hey = params[:answer_1]
    
     character_answers_tally = []
     character_array = []
     index = 0
     @characters.each do |character|
       character_array.push(character.id)   
       #character_key[character_"index".to_sym] = character.id
       character_answers_tally.push(0)
     end 


    # #make function that takes hash name
    # params.each do |answer, value|
    #   answer = Answer.find(value)
    #   character = answer.character
    #   character_index = character.id - 1
      
    #   character_answers_tally[character_index] += 1
    # end
    answer_number = 0
    @questions.size.times do
      answer_number += 1
      answer_id = params["answer_#{answer_number}".to_sym]
      answer = Answer.find(answer_id)
      character = answer.character
      character_index = character_array.index(character.id)
      character_answers_tally[character_index] += 1
    end

    max_answers = character_answers_tally.max 
    index_of_max = character_answers_tally.index(max_answers)

    if character_answers_tally.count(max_answers) == 1 
      
      redirect_to '#' #this should be going to the static page for showing your character
    else
      redirect_to '#' #the tie breaker question
    end
    
    redirect_to quiz_questions_path(@quiz), flash: {success: character_answers_tally}
  end

  
  private
  def load_characters
    load_quiz
    @characters = @quiz.characters
  end

  def load_questions
    load_quiz
    @questions = @quiz.questions 
  end

  def load_quiz
		@quiz = Quiz.find(quiz_id)
	end

	def quiz_id
		params[:quiz_id]
	end	
end
