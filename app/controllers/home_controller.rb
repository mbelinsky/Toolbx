class HomeController < ApplicationController
  def index
    @has_footer = true
    @articles = Article.where(published: true).order('created_at DESC').limit(6)
    @tools = Tool.order('created_at DESC, users_count DESC').limit(6)
    @categories = Category.all
  end

  def robots
    @unpublished_articles = Article.where(published: false)
    render template: 'home/robots', formats: :text
  end
end