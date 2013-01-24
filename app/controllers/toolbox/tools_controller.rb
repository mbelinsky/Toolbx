class Toolbox::ToolsController < ToolboxController
  def create
    tool = Tool.find(params[:tool])

    if !tool
      render nothing: true, status: 400
    elsif UserTool.create(user: current_user, tool: tool)
      render nothing: true, status: 201
    else
      render nothing: true, status: 500
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    user_tool = UserTool.where(user_id: current_user, tool_id: tool.id).first

    if !tool || !user_tool
      render nothing: true, status: 400
    elsif user_tool.destroy()
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end
end
