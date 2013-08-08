#!/bin/env ruby
# encoding: utf-8
class ToolsController < ApplicationController
  before_filter :authorize, only: [:new_suggestion, :create_suggestion]

  def index
    @title = "» Tools"
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, users_count DESC, created_at DESC'}
    params[:order] ||= 'Featured'

    @tools = Tool.search(params)
    
    # Are there 1 or more categories selected?
    if params[:category_ids] != nil && params[:category_ids].length < 2
      @current_category = Category.find(params[:category_ids][0])
    end
    
  end

  def show
    @tool = Tool.find(params[:id])
    @title = "» #{@tool.name}"
    @has_footer = true
  end

  def new_suggestion
    @title = "» Suggest A Tool"
    @suggestion = ToolSuggestion.new
    @has_footer = true
  end

  def create_suggestion
    @title = "» Suggest A Tool"
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