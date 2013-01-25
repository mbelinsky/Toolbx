class ArticleImage < ActiveRecord::Base
  attr_accessible :image

  validates_attachment_presence :image
  has_attached_file :image, styles: { full: ["580", :jpg], banner: ["300x180#", :jpg], square_banner: ["300x300#", :jpg], thumb: ["60x60#", :jpg] }, convert_options: { quality: 85 }

  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :image, less_than: 2.megabytes
end
