class SessionsController < ApplicationController
  def create
    head :ok
  end

  def destroy
    head :ok
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
