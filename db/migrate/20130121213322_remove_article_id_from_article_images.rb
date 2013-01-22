class RemoveArticleIdFromArticleImages < ActiveRecord::Migration
  def change
    remove_column :article_images, :article_id
    remove_column :article_images, :featured
  end
end
