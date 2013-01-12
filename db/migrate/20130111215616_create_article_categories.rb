class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.references :article
      t.references :category

      t.timestamps
    end
    add_index :article_categories, :article_id
    add_index :article_categories, :category_id
  end
end
