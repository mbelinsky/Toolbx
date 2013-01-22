class CreateUserArticles < ActiveRecord::Migration
  def change
    create_table :user_articles do |t|
      t.references :user
      t.references :article

      t.timestamps
    end
    add_index :user_articles, :user_id
    add_index :user_articles, :article_id
  end
end
