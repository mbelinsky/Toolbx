class Admin::ToolsController < AdminController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, users_count DESC, created_at DESC'}
    params[:order] ||= 'Recently Added'

    @tools = Tool.search(params)
  end

  def new
    @page_header = 'Add Tool'
    @tool = Tool.new
  end

  def create
    @page_header = 'Add Tool'
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        format.html { redirect_to edit_admin_tool_path(@tool), notice: "#{@tool.name} has been created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @page_header = 'Edit Tool'
    @tool = Tool.find(params[:id])
  end

  def update
    @page_header = 'Edit Tool'
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes params[:tool]
        format.html { redirect_to edit_admin_tool_path(@tool), notice: "#{@tool.name} has been updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @tool = Tool.find(params[:id])

    @tool.destroy

    respond_to do |format|
      format.html { redirect_to admin_tools_path, notice: "#{@tool.name} has been deleted." }
    end
  end
end
