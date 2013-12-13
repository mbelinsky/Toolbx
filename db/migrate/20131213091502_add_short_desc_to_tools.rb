class AddShortDescToTools < ActiveRecord::Migration
  def change
    add_column :tools, :short_desc, :string
  end
end
