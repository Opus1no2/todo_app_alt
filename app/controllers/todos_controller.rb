# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = todo_list.todos
  end

  def create
    todo_list.todos << Todo.new(todo_params)
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

  def todo_list
    @todo_list ||= current_user.todo_lists.find(params[:todo_list_id])
  end
end
