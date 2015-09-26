    require "rails_helper"

feature "Questions" do  
  scenario "visits index page for index" do
    question = create(:question)
    quiz = question.quiz

    visit quiz_questions_path(quiz)

    expect(page).to have_content(question.text)
  end

  scenario "visits new page for questions" do
    question = build(:question)
    answer = build(:answer)
    character = create(:character)
    quiz = character.quiz

    visit new_quiz_question_path(quiz)
    
    expect(page).to have_content("New Question")
    
    fill_in "Your New Question",  with: question.text 
    
    fill_in "Answer for #{character.name}", with: answer.text 
    
    click_button "Create Question"
    
    expect(page).to have_content("Created Question")
    
    expect(page).to have_content(question.text)
  end

  scenario 'create new tie breaker question' do
    question = build(:question)
    answer = build(:answer)
    character = create(:character)
    quiz = character.quiz    
    
    visit quiz_path(quiz)
    
    click_link 'Create New Tie-Breaker Question'
    
    expect(page).to have_content('New Tie-Breaker Question')

    fill_in "Your Tie-Breaker Question",  with: question.text 
    
    fill_in "Answer for #{character.name}", with: answer.text 
    
    click_button "Create Question"
    
    expect(page).to have_content('Created Tie-Breaker Question')
  end

  scenario 'edit tie breaker question' do
    question = create(:question, tie_breaker: true)
    quiz = question.quiz
    character = create(:character, quiz: quiz)
    answer = create(:answer, question: question, character: character)
    new_question = build(:question)
    new_answer = build(:answer)

    visit edit_quiz_question_path(quiz, question)
    
    expect(page).to have_content('Edit Tie-Breaker Question')
    
    fill_in "Your Tie-Breaker Question",  with: question.text 
    
    fill_in "Answer for #{character.name}", with: answer.text 
    
    click_button "Update"

    expect(page).to have_content('Updated Tie-Breaker Question and Answers')  
  end

  scenario "visits edit page for questions" do
    character = create(:character)
    quiz = character.quiz
    question = create(:question, quiz: quiz)
    answer = create(:answer, character: character, question: question)
    new_answer = build(:answer)
    new_question = new_answer.question

    visit edit_quiz_question_path(quiz, question)
    
    expect(page).to have_content("Edit Question")
    
    fill_in "Your Question",  with: new_question.text   
    
    fill_in "Answer", with: new_answer.text 
    
    click_button "Update"
    
    expect(page).to have_content("Updated Question and Answers")
  end

  scenario 'Delete Question' do
    question = create(:question)
    quiz = question.quiz

    visit quiz_questions_path(quiz)

    #find(".hospitalization-#{hospitalization.id} .red.button").click
    #find(".approve").trigger('click')

    click_link "Delete"

    expect(page).to have_content('Deleted Question')
  end
end  