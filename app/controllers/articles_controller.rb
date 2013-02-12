#!/bin/env ruby
# encoding: utf-8
class ArticlesController < ApplicationController
  def index
    @title = "» Articles"
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, users_count DESC, created_at DESC'}
    params[:order] ||= 'Recently Added'

    @articles = Article.in_categories(params[:category_ids]).search(params[:keyword]).where(published: true).order(@orders[params[:order]]).page(params[:page]).per(36)
  end

  def show
    @article = Article.find_by_slug!(params[:id])
    @title = "» #{@article.title}"
    @has_footer = true
    @has_control_bar = true
  end
end