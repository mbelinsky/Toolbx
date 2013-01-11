class Screen < ActiveRecord::Base
  belongs_to :tool
  validates_presence_of :article, :order

  has_attached_file :screenshot, styles: { small: "300x180#" }
  validates_attachment_presence :screenshot
  validates_attachment_content_type :screenshot, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :icon, less_than: 2.megabytes
end
