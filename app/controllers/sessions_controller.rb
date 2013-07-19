#!/bin/env ruby
# encoding: utf-8
class SessionsController < ApplicationController
  force_ssl

  def new
    @title = "» Log In"
    @has_footer = true
  end


  def create
    @title = "» Log In"
    user = User.find_by_email(params[:email_or_username]) || User.find_by_username(params[:email_or_username])

    if user && user.authenticate(params[:password])
      cookies.permanent[:toolbox_auth_token] = user.toolbox_auth_token
      user.touch :last_login

      redirect_to root_url, notice: "Hey there! Nice to see you."
    else
      flash[:alert] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def create_omniauth
    # raise env['omniauth.auth'].to_yaml
    # return

    user = User.from_omniauth(env['omniauth.auth'])

    if user.class == String
      # this is a little janky, but it'll work.
      redirect_to root_url, alert: user
    else
      cookies.permanent[:toolbox_auth_token] = user.toolbox_auth_token
      user.touch :last_login

      # 'Thanks for signing up! Now go add some tools.'
      redirect_to root_url, notice: "Hey there! Nice to see you."
    end
  end

  def failure
    # raise OmniAuth::Error.new(env['omniauth.error.type']) #env['omniauth.error'] || OmniAuth::Error.new(env['omniauth.error.type'])
    # render text: 'hithere'
  end

  def destroy
    cookies.delete(:toolbox_auth_token)
    redirect_to root_url, notice: "You've been logged out. See you again soon!"
  end
end
