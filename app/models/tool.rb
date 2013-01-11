class Tool < ActiveRecord::Base
  belongs_to :license
  has_many :users, through: :user_tools
  has_many :screens
  attr_accessible :app_store_url, :cost, :description, :featured, :github_url, :google_play_url, :name, :site_url, :license_id, :icon

  validates_presence_of :name, :description, :icon, :license

  has_attached_file :icon, styles: { small: "120x120#", thumb: "60x60#" }
  validates_attachment_presence :icon
  validates_attachment_content_type :icon, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :icon, less_than: 1.megabyte
end
