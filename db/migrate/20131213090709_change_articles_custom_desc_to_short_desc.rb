class ChangeArticlesCustomDescToShortDesc < ActiveRecord::Migration
  def change
    rename_column :articles, :custom_desc, :short_desc
  end
end