class HomeController < ApplicationController
  def index
    @has_footer = true
    @articles = Article.where(published: true).order('created_at DESC').limit(6)
    @tools = Tool.order('users_count DESC').order('created_at DESC').limit(6)
  end
end
