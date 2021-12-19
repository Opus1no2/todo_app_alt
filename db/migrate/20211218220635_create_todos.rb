class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :description
      t.datetime :due_at
      t.datetime :complete_at
      t.belongs_to :todo_list
      t.timestamps
    end
  end
end
