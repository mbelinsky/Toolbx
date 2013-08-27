#!/bin/env ruby
# encoding: utf-8
class ArticlesController < ApplicationController
  def index
    @title = "» Articles"
    @orders = {'Recently Added' => 'articles.created_at DESC', 'Most Popular' => 'users_count DESC, articles.created_at DESC', 'Featured' => 'featured DESC, users_count DESC, articles.created_at DESC'}
    params[:order] ||= 'Recently Added'

    # @articles = Article.in_categories(params[:category_ids]).search(params[:keyword]).where(published: true).order(@orders[params[:order]]).page(params[:page]).per(36)
    @articles = Article.search(params)

    # Are there 1 or more categories selected?
    if params[:category_ids] != nil && params[:category_ids].length < 2
      @current_category = Category.find(params[:category_ids][0])
    end
  end

  def show
    @article = Article.find_by_slug!(params[:id])
    @title = "» #{@article.title}"
    @has_footer = true
    @has_control_bar = true
  end
end