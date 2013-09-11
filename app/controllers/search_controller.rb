class SearchController < ApplicationController
  def index
    params[:per_page] = 6
    params[:order] = 'Most Popular'

    @tools = Tool.search(params)
    @articles = Article.search(params)
  end
end