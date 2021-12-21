# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    todos_view
  end

  def create
    @todo = Todo.new(
      description: todo_params[:description],
      todo_list: todos_view.todo_list
    )

    respond_to do |format|
      format.turbo_stream do
        if @todo.save
          render turbo_stream: turbo_stream.prepend(:todos, partial: "todo",
            locals: { todo: @todo })
        end
      end
    end
  end

  def destroy
    @todo = todos_view.todo_list.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo) }
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end

  def todos_view
    @todos_view ||= TodosView.new(current_user, params)
  end
end
