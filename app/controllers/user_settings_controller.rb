# frozen_string_literal: true

class UserSettingsController < ApplicationController
  before_action :authenticate_user

  def show; end

  def update
    if current_user.update(email: params[:email], password: params[:password])
      flash[:notice] = 'Settings updated!'
    else
      flash[:alert] = current_user.errors.full_messages
    end
    redirect_to settings_path
  end
end
