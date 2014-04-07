class HomeController < ApplicationController
  def index
    @has_footer = true
    @categories = Category.all

    tools = Tool.order('featured DESC, users_count DESC, created_at DESC').limit(8).all.shuffle
    articles = Article.where(published: true).order('created_at DESC').limit(22).all

    # @tools_and_articles = tools.concat(articles).shuffle
    @tools_and_articles = []

    articles.each_with_index do |article, i|
      @tools_and_articles << article
      @tools_and_articles << tools[i] if i % 3 == 0
    end
  end

  def robots
    @unpublished_articles = Article.where(published: false)
    render template: 'home/robots', formats: :text
  end
end