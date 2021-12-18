class SessionsController < ApplicationController
  def create
    user = User.find_by(email: permitted[:email])
    if user && user.authenticate(permitted[:password]).present?
      session[:user_id] = user.id
      return redirect_to todo_lists_url
    end

    head :no_content
  end

  def destroy
    head :ok
  end

  def permitted
    params.permit(:email, :password)
  end
end
