class RemoveCompleteAtToTodos < ActiveRecord::Migration[7.0]
  def change
    remove_column :todos, :complete_at
  end
end
