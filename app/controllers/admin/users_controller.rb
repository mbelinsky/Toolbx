class Admin::UsersController < AdminController
  def index
    @orders = {'Recently Added' => 'users.created_at DESC', 'By Name' => 'users.first_name ASC, users.created_at DESC'}
    params[:order] ||= 'By Name'

    @page_header = 'Manage Apptivists'
    @users = User.search(params)
  end

  def edit
    @page_header = 'Update Apptivist'
    @user = User.find(params[:id])
  end

  def update
    @has_footer = true
    @title = '» Update Apptivist'
    @user = User.find_by_username(params[:id]) || User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to :back, notice: "Changes saved."
    else
      redirect_to :back, notice: "Changes not saved."
      render action: 'edit'
    end
  end

  def toggle_apptivist
    @user = User.find(params[:id])

    if @user.apptivist == true
      @user.update_attribute(:apptivist, false)
    else
      @user.update_attribute(:apptivist, true)
    end

    respond_to do |format|
      format.json { render json: @user }
    end
  end
end
