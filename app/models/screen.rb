class Screen < ActiveRecord::Base
  belongs_to :tool
  has_attached_file :screenshot, styles: { small: "100x100>", thumb: "75x75>" }

  validates_attachment_presence :screenshot
  validates_attachment_content_type :screenshot, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_presence_of :order
end
