class Admin::ArticlesController < AdminController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, users_count DESC, created_at DESC'}
    params[:order] ||= 'Recently Added'

    @articles = Article.in_categories(params[:category_ids]).search(params[:keyword]).order(@orders[params[:order]]).page(params[:page]).per(36)
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
        format.html { redirect_to admin_articles_path, notice: "#{@article.title} has been created." }
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
        format.html { redirect_to admin_articles_path, notice: "#{@article.title} has been updated." }
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
    end
  end
end