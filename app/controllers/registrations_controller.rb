# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def create
    user = User.find_by(email: registration_params[:email])

    if user
      redirect_to registration_path, notice: 'This user already exists'
    else
      user = User.create!(email: registration_params[:email], password: registration_params[:password])
      log_in(user)
      redirect_to todo_list_todos_path(user.todo_lists.first)
    end
  end

  def show; end

  private

  def registration_params
    params.permit(:email, :password)
  end
end
