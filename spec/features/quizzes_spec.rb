require "rails_helper"

feature "Quizes" do  
  scenario "visits index page for quiz" do
    quiz = create(:quiz)

    visit quizzes_path

    expect(page).to have_content(quiz.name)
  end


  scenario "visits new page for quiz" do
    quiz = build(:quiz)

    visit new_quiz_path
    
    expect(page).to have_content("New Quiz")
    
    fill_in "Name of the Quiz",  with: quiz.name 
    
    click_button "Create Quiz"
    
    expect(page).to have_content("Created Quiz")
  end

  scenario "visits edit page for quizs" do
    
    quiz = create(:quiz)
    
    new_quiz = build(:quiz)

    visit edit_quiz_path(quiz)
    
    expect(page).to have_content("Edit Quiz")
    
    fill_in "Quiz Name",  with: new_quiz.name   
    
    click_button "Update"
    
    expect(page).to have_content("Updated Quiz")
  end
end  