require "rails_helper"

feature "Characters" do  
  scenario "visits index page for index" do
    character = create(:character)

    visit characters_path

    expect(page).to have_content(character.name)
  end

  scenario "visits new page for character" do
    character = build(:character)

    visit new_character_path
    
    expect(page).to have_content("New Character")
    
    fill_in "Name",  with: character.name 
    
    click_button "Create Character"
    
    expect(page).to have_content("Created Character")
  end
end  