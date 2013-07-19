class ErrorsController < ApplicationController
  def error_404
    @not_found_path = params[:not_found]
    @has_footer = true
  end

  def error_500
    @has_footer = true
  end
end
