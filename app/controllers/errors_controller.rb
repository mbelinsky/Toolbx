class ErrorsController < ApplicationController
  def error_404
    @not_found_path = params[:not_found]
    @has_footer = true
    render 'error_404', status: 404
  end

  def error_422
    @has_footer = true
    render 'error_422', status: 422
  end

  def error_500
    @has_footer = true
    render 'error_500', status: 500
  end
end
