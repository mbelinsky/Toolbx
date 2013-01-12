class CreateToolPlatforms < ActiveRecord::Migration
  def change
    create_table :tool_platforms do |t|
      t.references :tool
      t.references :platform

      t.timestamps
    end
    add_index :tool_platforms, :tool_id
    add_index :tool_platforms, :platform_id
  end
end
