class AboutController < ApplicationController
  def index
    @has_footer = true
    @toolbar_docked = true
  end
end