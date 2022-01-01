# frozen_string_literal: true

class LoginController < ApplicationController
  before_action :authenticated?

  def show; end

  private

  def authenticated?
    redirect_to todo_list_todos_path(current_user.todo_lists.first) if logged_in?
  end
end
