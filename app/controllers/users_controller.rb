class UsersController < ApplicationController
  def index

  end

  def new
    @person = Person.new
    @organization = Organization.new
  end

  def create
    @person = Person.new(params[:person])
    @organization = Organization.new(params[:organization])
    @user_type = params[:user_type]

    respond_to do |format|
      if @user_type == 'person'
        if @person.save
          cookies.permanent[:toolbox_auth_token] = @person.toolbox_auth_token
          format.html { redirect_to root_url, notice: 'Thanks for signing up! Now go add some tools.' }
        else
          format.html { render action: 'new' }
        end
      elsif @user_type == 'organization'
        if @organization.save
          cookies.permanent[:toolbox_auth_token] = @organization.toolbox_auth_token
          format.html { redirect_to root_url, notice: 'Thanks for signing up! Now go add some tools.' }
        else
          format.html { render action: 'new' }
        end
      end
    end
  end
end
