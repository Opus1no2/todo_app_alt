class TodosController < ApplicationController
  def index
    @todos = current_user.todo_lists.find(params[:todo_list_id]).todos
  end
end
