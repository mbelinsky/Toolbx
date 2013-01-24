class UsersController < ApplicationController
  before_filter :authorize, except: [:show_tools, :show_articles, :new, :create]

  def new
    @user = User.new
    @has_footer = true
  end

  def create
    @user = User.new(params[:user])
    @has_footer = true

    respond_to do |format|
      if @user.save
        cookies.permanent[:toolbox_auth_token] = @user.toolbox_auth_token
        format.html { redirect_to root_url, notice: 'Thanks for signing up! Now go add some tools.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show_tools
    @user = User.find_by_username!(params[:id])
    @tools = @user.tools.page(params[:page]).per(36)
  end

  def show_articles
    @user = User.find_by_username!(params[:id])
    @articles = @user.articles.page(params[:page]).per(36)
  end

  def add_tool
    @tool = Tool.find(params[:id])
  end

  def remove_tool
    @tool = Tool.find(params[:id])
  end
end