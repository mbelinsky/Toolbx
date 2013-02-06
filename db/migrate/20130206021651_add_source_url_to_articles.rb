class AddSourceUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :source_url, :string
  end
end
