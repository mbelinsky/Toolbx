class AddAttachmentImageToArticleImages < ActiveRecord::Migration
  def self.up
    change_table :article_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :article_images, :image
  end
end
