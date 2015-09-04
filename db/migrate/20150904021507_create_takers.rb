class CreateTakers < ActiveRecord::Migration
  def change
    create_table :takers do |t|
      t.references :quiz, index: true

      t.timestamps null: false
    end
    add_foreign_key :takers, :quizzes
  end
end
