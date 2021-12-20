# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_in(current_user)
    session[:user_id] = current_user.id
  end

  def log_out
    session.delete([:user_id])
  end

  def authenticate_user
    redirect_to login_url unless logged_in?
  end
end
