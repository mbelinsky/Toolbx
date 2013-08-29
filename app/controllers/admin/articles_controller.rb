class Admin::ArticlesController < AdminController
  def index
    @orders = {'Recently Added' => 'articles.created_at DESC', 'Most Popular' => 'users_count DESC, articles.created_at DESC', 'Featured' => 'featured DESC, users_count DESC, articles.created_at DESC'}
    params[:order] ||= 'Recently Added'

    @articles = Article.search(params)
  end

  def new
    @page_header = 'Add Article'
    @article = Article.new
  end

  def create
    @page_header = 'Add Article'
    @article = Article.new(params[:article])
    @article.author = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to edit_admin_article_path(@article), notice: "#{@article.title} has been created." }

        mixpanel.track current_user.email, 'Created Article', {
          title: @article.title,
          id: @article.id
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @page_header = 'Edit Article'
    @article = Article.find(params[:id])
  end

  def update
    @page_header = 'Edit Article'
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes params[:article]
        format.html { redirect_to edit_admin_article_path(@article), notice: "#{@article.title} has been updated." }

        mixpanel.track current_user.email, 'Updated Article', {
          title: @article.title,
          id: @article.id
        }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: "#{@article.title} has been deleted." }

      mixpanel.track current_user.email, 'Deleted Article', {
        title: @article.title,
        id: @article.id
      }
    end
  end
end