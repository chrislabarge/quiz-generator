class AddQuizRefToCharacters < ActiveRecord::Migration
  def change
  	add_reference :characters, :quiz, index: true
    add_foreign_key :characters, :quizzes
  end
end
