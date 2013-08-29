class AdminController < ApplicationController
  before_filter :authorize
  before_filter :authorize_admin

  def search_tags
    search_tags = params[:q] ? SearchTag.where("lower(name) like ?", "#{params[:q].downcase}%") : SearchTag.all
    render json: search_tags.to_json(only: [:id], methods: [:text])
  end

  private

  def authorize_admin
    redirect_to root_url if current_user.admin == false
  end
end
