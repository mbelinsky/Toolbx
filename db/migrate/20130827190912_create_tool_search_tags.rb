class CreateToolSearchTags < ActiveRecord::Migration
  def change
    create_table :tool_search_tags do |t|
      t.references :search_tag
      t.references :tool

      t.timestamps
    end
    add_index :tool_search_tags, :search_tag_id
    add_index :tool_search_tags, :tool_id
  end
end
