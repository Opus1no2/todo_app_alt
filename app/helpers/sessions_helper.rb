module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    @current_user = nil
    session[:user_id] = nil
  end

  def authenticate_user
    redirect_to login_url unless logged_in?
  end
end
