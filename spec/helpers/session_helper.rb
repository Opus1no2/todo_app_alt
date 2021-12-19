module SessionHelper
  def log_in(user)
    post "/session", params: { email: user.email, password: user.password }
  end
end