class AddUserArticleFieldsToUserAndArticle < ActiveRecord::Migration
  def change
    add_column :articles, :users_count, :integer, default: 0
    add_column :users, :articles_count, :integer, default: 0
  end
end
