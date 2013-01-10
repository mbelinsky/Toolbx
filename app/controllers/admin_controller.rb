class AdminController < ApplicationController
  before_filter :authorize_admin

  private

  def authorize_admin
    redirect_to root_url if current_user.admin == false
  end
end
