class ToolsController < ApplicationController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC'}
    @tools = Tool.page(params[:page]).per(36)
  end
end
