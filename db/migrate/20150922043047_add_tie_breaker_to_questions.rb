class AddTieBreakerToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :tie_breaker, :boolean
  end
end
