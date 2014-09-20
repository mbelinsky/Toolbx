class CreateApptivistArticles < ActiveRecord::Migration
  def change
    create_table :apptivist_articles do |t|
      t.references :apptivist
      t.references :article

      t.timestamps
    end
    add_index :apptivist_articles, :apptivist_id
    add_index :apptivist_articles, :article_id
  end
end
