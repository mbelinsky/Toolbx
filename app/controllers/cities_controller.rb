class CitiesController < ApplicationController
  def index
    unless params[:term] && params[:term].length > 3
      render text: 'Supply a search term of at least four characters.', status: 400
      return
    end

    results = City.where('name like ?', "#{params[:term]}%").as_json
    render json: results
  end
end