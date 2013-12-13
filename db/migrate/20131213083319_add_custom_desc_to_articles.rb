class AddCustomDescToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :custom_desc, :text
  end
end
