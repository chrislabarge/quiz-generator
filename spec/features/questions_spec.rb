require "rails_helper"

feature "Questions" do  
  scenario "visits index page for index" do
    question = create(:question)

    visit questions_path

    expect(page).to have_content(question.text)
  end

  scenario "visits new page for questions" do
    question = build(:question)
    answer = build(:answer)

    visit new_question_path
    
    expect(page).to have_content("New Question")
    
    fill_in "Your New Question",  with: question.text 
    
    fill_in "Answer", with: answer.text 
    
    click_button "Create Question"
    
    expect(page).to have_content("Created Question")
    
    expect(page).to have_content(question.text)
  end

  scenario "visits edit page for questions" do
    answer = create(:answer)
    question = answer.question
    new_answer = build(:answer, character: answer.character)
    new_question = new_answer.question

    visit edit_question_path(question)
    
    expect(page).to have_content("Edit Question")
    
    fill_in "Your Question",  with: new_question.text   
    
    fill_in "Answer", with: new_answer.text 
    
    click_button "Update"
    
    expect(page).to have_content("Updated Question")
  end
end  