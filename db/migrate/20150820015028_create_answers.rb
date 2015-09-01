class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :character, index: true
      t.text :text

      t.timestamps null: false
    end
    add_foreign_key :answers, :questions
    add_foreign_key :answers, :characters
  end
end
