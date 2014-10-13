class Admin::RoundupsController < ApplicationController

  def index
    @roundups = Roundup.all
  end

  def new
    @page_header = 'Add Roundup'
    @roundup = Roundup.new
  end

  def create
    @page_header = 'Edit Roundup'
    @roundup = Roundup.new(params[:roundup])

    respond_to do |format|
      if @roundup.save
        format.html { redirect_to edit_admin_roundup_path(@roundup), notice: "#{@roundup.title} has been created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @page_header = 'Edit Roundup'
    @roundup = Roundup.find(params[:id])
  end

  def update
    @page_header = 'Edit Roundup'
    @roundup = Roundup.find(params[:id])

    respond_to do |format|
      if @roundup.update_attributes params[:roundup]
        format.html { redirect_to edit_admin_roundup_path(@roundup), notice: "#{@roundup.title} has been updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @roundup = Roundup.find(params[:id])
    @roundup.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_path, notice: "#{@roundup.title} has been deleted." }
    end
  end

end
