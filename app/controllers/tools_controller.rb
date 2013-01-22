class ToolsController < ApplicationController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC'}
    params[:order] ||= 'Recently Added'

    @tools = Tool.in_categories(params[:category_ids]).supports_platform(params[:platform]).search(params[:keyword]).order(@orders[params[:order]]).page(params[:page]).per(36)
  end
end
