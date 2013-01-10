class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.references :article
      t.boolean :featured

      t.timestamps
    end
    add_index :article_images, :article_id
  end
end
