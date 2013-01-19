class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

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
end