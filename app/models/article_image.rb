class ArticleImage < ActiveRecord::Base
  belongs_to :article
  attr_accessible :featured
  validates_presence_of :article

  validates_attachment_presence :image
  has_attached_file :image, styles: { small: "300x180#", small_square: "300x300#" }
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
end
