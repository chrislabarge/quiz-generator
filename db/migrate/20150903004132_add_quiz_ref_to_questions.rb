class AddQuizRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :quiz, index: true
    add_foreign_key :questions, :quizzes
  end
end
