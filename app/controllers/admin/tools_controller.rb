class Admin::ToolsController < AdminController
  def index
    @orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, created_at DESC'}
    params[:order] ||= 'Recently Added'

    @tools = Tool.search(params)
    @tool_results_count = Tool.search_count(params)
  end

  def new
    @page_header = 'Add Tool'
    @tool = Tool.new
  end

  def create
    @page_header = 'Add Tool'
    params[:tool][:search_tag_ids] = sanitize_search_tags(params[:tool][:search_tag_ids])

    @tool = Tool.new(params[:tool])


    respond_to do |format|
      if @tool.save
        format.html { redirect_to edit_admin_tool_path(@tool), notice: "#{@tool.name} has been created." }

        mixpanel.track current_user.email, 'Created Tool', {
          name: @tool.name,
          id: @tool.id
        }
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
    params[:tool][:search_tag_ids] = sanitize_search_tags(params[:tool][:search_tag_ids])

    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes params[:tool]
        format.html { redirect_to edit_admin_tool_path(@tool), notice: "#{@tool.name} has been updated." }

        mixpanel.track current_user.email, 'Updated Tool', {
          name: @tool.name,
          id: @tool.id
        }
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

      mixpanel.track current_user.email, 'Deleted Tool', {
        name: @tool.name,
        id: @tool.id
      }
    end
  end
end
