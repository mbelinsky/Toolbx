class Screen < ActiveRecord::Base
  belongs_to :tool, inverse_of: :screens
  validates_presence_of :tool, :order

  attr_accessible :screenshot, :order

  has_attached_file :screenshot, styles: { full: ["960", :jpg], desat_banner: ["300x180#", :jpg], banner: ["300x180#", :jpg], small_square: ["130x130#", :jpg], thumb: ["30x30#", :jpg] }, convert_options: { desat_banner: "-set option:modulate:colorspace hsb -modulate 88,50", quality: 85 }
  validates_attachment_presence :screenshot
  validates_attachment_content_type :screenshot, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :screenshot, less_than: 2.megabytes
end
