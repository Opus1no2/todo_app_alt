# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :authenticate_user

  def index
    @todos = current_user.todo_lists.find(params[:todo_list_id]).todos
  end
end
