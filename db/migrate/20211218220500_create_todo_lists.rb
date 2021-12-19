class CreateTodoLists < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_lists do |t|
      t.string :label
      t.belongs_to :user
      t.timestamps
    end
  end
end
