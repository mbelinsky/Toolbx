class RemoveShortDescFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :short_desc
  end

  def down
    add_column :articles, :short_desc, :text
  end
end
