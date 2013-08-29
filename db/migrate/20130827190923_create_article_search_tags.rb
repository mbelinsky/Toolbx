class CreateArticleSearchTags < ActiveRecord::Migration
  def change
    create_table :article_search_tags do |t|
      t.references :search_tag
      t.references :article

      t.timestamps
    end
    add_index :article_search_tags, :search_tag_id
    add_index :article_search_tags, :article_id
  end
end
