class AddPositionToRoundupItems < ActiveRecord::Migration
  def change
    add_column :roundup_items, :position, :integer
  end
end
