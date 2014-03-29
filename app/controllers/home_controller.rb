class HomeController < ApplicationController
  def index
    @has_footer = true
    @categories = Category.all

    tools = Tool.order('featured DESC, users_count DESC, created_at DESC').limit(16).all
    articles = Article.where(published: true).order('created_at DESC').limit(16).all

    @tools_and_articles = tools.concat(articles).shuffle
  end

  def robots
    @unpublished_articles = Article.where(published: false)
    render template: 'home/robots', formats: :text
  end
end