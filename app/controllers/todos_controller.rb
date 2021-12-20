# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = todo_list.todos.order(created_at: :desc)
  end

  def create
    @todo = Todo.new(todo_params)
    todo_list.todos << @todo

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.prepend(:todos, partial: "todo",
          locals: { todo: @todo })
      end
    end
  end

  def destroy
    @todo = todo_list.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo) }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

  def todo_list
    @todo_list ||= current_user.todo_lists.find(params[:todo_list_id])
  end
end
