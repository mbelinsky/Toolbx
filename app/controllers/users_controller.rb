#!/bin/env ruby
# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authorize, except: [:show_tools, :show_articles, :new, :create]

  def index
    @title = "» Apptivists"
    @users = User.where(apptivist: true)
  end

  def new
    @title = "» Sign Up"
    @user = User.new
    @has_footer = true
  end

  def create
    @title = "» Sign Up"
    @user = User.new(params[:user])
    @has_footer = true

    respond_to do |format|
      if @user.save
        cookies.permanent[:toolbox_auth_token] = @user.toolbox_auth_token
        flash[:new_user] = true # This is for mixpanel, so we know to alias

        UserMailer.welcome(@user).deliver

        begin
          Gibbon::API.lists.subscribe(id: Settings.mailchimp.list_id, email: {email: @user.email}, double_optin: false, update_existing: true, send_welcome: false, merge_vars: {:FNAME => @user.first_name, :LNAME => @user.last_name})
        rescue Gibbon::MailChimpError => err
          Rails.logger.error "Mailchimp error in users#create:"
          Rails.logger.error "  #{err}"
        end

        format.html { redirect_to root_url, notice: 'Thanks for signing up! Now go add some tools.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @has_footer = true
    @title = '» Settings'
    @subscribed_to_newsletter = false

    begin
      member_info = Gibbon::API.lists.member_info(id: Settings.mailchimp.list_id, emails: [{email: current_user.email}])

      if member_info['data'].empty? || member_info['data'][0]['status'] == 'unsubscribed'
        @subscribed_to_newsletter = false
      else
        @subscribed_to_newsletter = true
      end
    rescue Gibbon::MailChimpError => e
      # not subscribed
      @subscribed_to_newsletter = false
    end
  end

  def update
    @has_footer = true
    @title = '» Settings'

    begin
      if params[:subscribed_to_newsletter] == 'on'
        Gibbon::API.lists.subscribe(id: Settings.mailchimp.list_id, email: {email: current_user.email}, double_optin: false, update_existing: true, send_welcome: false, merge_vars: {:FNAME => current_user.first_name, :LNAME => current_user.last_name})
        @subscribed_to_newsletter = true
      else
        Gibbon::API.lists.unsubscribe(id: Settings.mailchimp.list_id, email: {email: current_user.email})
        @subscribed_to_newsletter = false
      end
    rescue Gibbon::MailChimpError => err
      Rails.logger.error "Mailchimp error in users#update:"
      Rails.logger.error "  #{err}"
    end

    if params[:user][:password] || params[:user][:password_confirmation] || params[:current_password]
      # bail if no password entered
      if params[:current_password].blank?
        params[:user].delete :password
        params[:user].delete :password_confirmation
        params.delete :current_password

        if current_user.update_attributes params[:user]
          redirect_to :edit_user, notice: "Changes saved."
        else
          render action: 'edit'
        end

        return
      end

      @editing_password = true
      authenticated = current_user.authenticate(params[:current_password])

      if authenticated && current_user.update_attributes(params[:user])
        redirect_to :back, notice: "Changes saved."
      else
        unless authenticated
          current_user.errors[:base] << 'Current password is incorrect.'
        end

        render action: 'edit'
      end
    elsif current_user.update_attributes params[:user]
      redirect_to :back, notice: "Changes saved."
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = current_user

    @user.destroy
    cookies.delete(:toolbox_auth_token)

    redirect_to root_url, notice: "Your account has been deleted. Sorry to see you go!"
  end

  def show_tools
    @user = User.find_by_username(params[:id]) || User.find(params[:id])
    @title = "» #{@user.full_name} » Tools"
    @tools = @user.tools.page(params[:page]).per(36)
  end

  def show_articles
    @user = User.find_by_username(params[:id]) || User.find(params[:id])
    @title = "» #{@user.full_name} » Articles"
    @articles = @user.articles.page(params[:page]).per(36)
  end

  def add_tool
    @tool = Tool.find(params[:id])
  end

  def remove_tool
    @tool = Tool.find(params[:id])
  end

end
