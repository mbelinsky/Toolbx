class ToolsController < ApplicationController
  before_filter :authorize, only: [:new_suggestion, :create_suggestion]

  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC'}
    params[:order] ||= 'Recently Added'

    @tools = Tool.in_categories(params[:category_ids]).supports_platform(params[:platform]).search(params[:keyword]).order(@orders[params[:order]]).page(params[:page]).per(36)
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new_suggestion
    @suggestion = ToolSuggestion.new
    @has_footer = true
  end

  def create_suggestion
    @suggestion = ToolSuggestion.new(params[:tool_suggestion])
    @has_footer = true

    if @suggestion.valid?
      ToolSuggestionsMailer.new_suggestion(current_user, @suggestion).deliver
      redirect_to :back, notice: 'Thanks! We\'ll review this tool as soon as possible.'
    else
      render :new_suggestion
    end
  end
end