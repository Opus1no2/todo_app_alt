class SessionsController < ApplicationController
  def create
    user = User.find_by(email: permitted[:email])
    if user && user.authenticate(permitted[:password]).present?
      session[:user_id] = user.id
      return redirect_to todo_list_todos_path(user.todo_lists.first, user.todos.first)
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
end
