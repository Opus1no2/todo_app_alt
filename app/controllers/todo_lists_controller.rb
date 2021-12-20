# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :authenticate_user

  def index
    @todo_lists = current_user.todo_lists
  end
end
