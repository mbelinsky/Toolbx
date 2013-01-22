class AddAttachmentFeaturedImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    drop_attached_file :articles, :featured_image
  end
end
