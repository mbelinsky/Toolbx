class RoundupsController < ApplicationController
  def show
    @has_footer = true
    @roundup = Roundup.find(params[:id])

    @items = []
    @roundup.roundup_items.each do |item|
      @item = item.item_type.constantize.find(item.item_id)
      @item[:item_type] = item.item_type.downcase
      @items << @item
      @items.sort_by!(&:id)
    end
  end
end
