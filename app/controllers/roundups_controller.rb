class RoundupsController < ApplicationController
  def show
    @has_footer = true
    @roundup = Roundup.find(params[:id])

    @items = []
    @roundup.roundup_items.each do |item|
      @item = item.item_type.constantize.find_by_id(item.item_id)
      next unless @item
      @item[:item_type] = item.item_type.downcase
      @item[:item_id] = item.id
      @item[:position] = item.position
      @items << @item
    end

    @items.sort_by!(&:position)
  end

  def sort
    params[:roundup_item].each_with_index do |id, index|
      RoundupItem.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end
end
