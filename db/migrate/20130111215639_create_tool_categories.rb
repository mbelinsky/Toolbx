class CreateToolCategories < ActiveRecord::Migration
  def change
    create_table :tool_categories do |t|
      t.references :tool
      t.references :category

      t.timestamps
    end
    add_index :tool_categories, :tool_id
    add_index :tool_categories, :category_id
  end
end
