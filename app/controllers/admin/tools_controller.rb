class Admin::ToolsController < AdminController
  def index
    @tools = Tool.page(params[:page]).per(36)
  end

  def new
    @page_header = 'Add Tool'
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        format.html { redirect_to admin_tools_path, notice: "#{@tool.name} has been created." }
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
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes params[:tool]
        format.html { redirect_to admin_tools_path, notice: "#{@tool.name} has been updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end
end
