class Toolbox::ArticlesController < ToolboxController
  def create
    article = Article.find(params[:article])

    if !article
      render nothing: true, status: 400
    elsif !article.published
      render nothing: true, status: 403
    elsif UserArticle.create(user: current_user, article: article)
      render nothing: true, status: 201
    else
      render nothing: true, status: 500
    end
  end

  def destroy
    article = Article.find(params[:id])
    user_article = UserArticle.where(user_id: current_user, article_id: article.id).first

    if !article || !user_article
      render nothing: true, status: 400
    elsif user_article.destroy()
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end
end