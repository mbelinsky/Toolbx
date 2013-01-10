class AddOrderToScreens < ActiveRecord::Migration
  def change
    add_column :screens, :order, :integer
  end
end
