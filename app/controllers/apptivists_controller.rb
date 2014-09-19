class ApptivistsController < ApplicationController
  def index
    @title = "» Apptivists"
    @apptivists = User.where(apptivist: true)
  end
end
