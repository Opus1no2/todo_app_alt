# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user

  def index
    @todo_lists = current_user.todo_lists
  end

  def destroy
    @todo_list = todos_view.todo_lists.find(params[:id])
    @todo_list.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo_list) }
    end
  end

  private

  def todos_view
    @todos_view ||= TodosView.new(current_user, params)
  end
end
