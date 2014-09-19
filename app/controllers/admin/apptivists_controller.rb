class Admin::ApptivistsController < AdminController
  def index
    @orders = {'Recently Added' => 'articles.created_at DESC', 'Most Popular' => 'users_count DESC, articles.created_at DESC', 'Featured' => 'featured DESC, users_count DESC, articles.created_at DESC'}
    params[:order] ||= 'Recently Added'

    @users = User.all
  end

  def edit

  end

  def new
    @page_header = 'Add Apptivist'
    @apptivist = User.new
  end

  def toggle_apptivist
    @apptivist = User.find(params[:id])

    if @apptivist.apptivist == true
      @apptivist.update_attribute(:apptivist, false)
    else
      @apptivist.update_attribute(:apptivist, true)
    end

    respond_to do |format|
      format.json { render :json => @apptivist }
    end
  end
end
