class AddColumnToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :parameter, :string
  end
end
