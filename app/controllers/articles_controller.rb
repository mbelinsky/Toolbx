class ArticlesController < ApplicationController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC'}
    params[:order] ||= 'Recently Added'

    @articles = Article.in_categories(params[:category_ids]).search(params[:keyword]).where(published: true).order(@orders[params[:order]]).page(params[:page]).per(36)
  end

  def show
    @article = Article.find(params[:id])
    @has_footer = true
    @has_control_bar = true
  end
end