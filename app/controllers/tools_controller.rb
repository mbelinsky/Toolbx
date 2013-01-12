class ToolsController < ApplicationController
  def index
    @tools = Tool.page(params[:page]).per(36)
  end
end
