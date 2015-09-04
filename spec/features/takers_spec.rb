require "rails_helper"

feature "Takers" do  
  scenario "visits new page for quiz taker" do
    5.times {create(:answer)} 
    taker = build(:taker)
    quiz = taker.quiz
    Question.all.each {|question| question.update_attribute(:quiz, quiz)}

    visit new_quiz_taker_path(quiz)
    
    expect(page).to have_content("Fill out the most appropriate answer for each question")
    
    
    quiz.questions.each do |question|
      expect(page).to have_content(question.text) 
    end
    # fill_in "Name of the Quiz",  with: quiz.name 
    
    # click_button "Create Quiz"
    
    # expect(page).to have_content("Created Quiz")
  end
end  