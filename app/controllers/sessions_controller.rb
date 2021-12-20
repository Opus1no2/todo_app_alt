# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    if user.authenticate(permitted[:password]).present?
      log_in(user)
      redirect_to todo_list_todos_path(user.todo_lists.first, user.todos.first)
      return
    end

    head :no_content
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def permitted
    params.permit(:email, :password)
  end

  private

  def user
    @user ||= User.find_by(email: permitted[:email])
  end
end
