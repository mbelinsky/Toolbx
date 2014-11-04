class AddDefaultValueToRoundupItemsPosition < ActiveRecord::Migration
  def change
    change_column :roundup_items, :position, :integer, default: 0, null: false
  end
end
