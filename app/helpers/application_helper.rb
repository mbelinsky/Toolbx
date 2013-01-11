module ApplicationHelper
  def cp(path)
    'current' if request.env['PATH_INFO'].include? path
  end
end
