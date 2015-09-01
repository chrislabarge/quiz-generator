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
    
    #save_and_open_page  
    
    fill_in "Answer", with: answer.text 
    
    click_button "Create Question"
    
    expect(page).to have_content("Created Question")
  end
end  