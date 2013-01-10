class SessionsController < ApplicationController
  force_ssl

  def new

  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      user.touch :last_login

      redirect_to root_url, notice: "Hey there! Nice to see you."
    else
      flash[:alert] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "You've been logged out. See you again soon!"
  end
end
