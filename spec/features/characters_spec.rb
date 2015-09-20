require "rails_helper"

feature "Characters" do  
  scenario "visits index page for index" do
    character = create(:character)
    quiz = character.quiz

    visit quiz_characters_path(quiz)

    expect(page).to have_content(character.name)
  end

  scenario "visits new page for character" do
    character = build(:character)
    quiz = character.quiz

    visit new_quiz_character_path(quiz)
    
    expect(page).to have_content("New Character")
    
    fill_in "Name",  with: character.name 
    
    click_button "Create Character"
    
    expect(page).to have_content("Created Character")
  end
end  