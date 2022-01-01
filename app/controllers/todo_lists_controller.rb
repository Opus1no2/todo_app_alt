# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user

  def index
    @todo_lists = current_user.todo_lists
  end

  def create
    @todo_list = TodoList.new(
      label: todo_list_params[:label],
      user: current_user
    )

    respond_to do |format|
      format.turbo_stream do
        if @todo_list.save
          render turbo_stream: turbo_stream.append(:todo_lists, partial: 'shared/todo_list',
                                                                locals: { todo_list: @todo_list })
        end
      end
    end
  end

  def destroy
    @todo_list = todos_view.todo_lists.find(params[:id])
    @todo_list.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo_list) }
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:label)
  end

  def todos_view
    @todos_view ||= TodosView.new(current_user, params)
  end
end
