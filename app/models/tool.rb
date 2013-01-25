class Tool < ActiveRecord::Base
  belongs_to :license
  has_many :user_tools, dependent: :destroy
  has_many :users, through: :user_tools

  has_many :tool_categories, dependent: :destroy, inverse_of: :tool
  has_many :categories, through: :tool_categories


  has_many :tool_platforms, dependent: :destroy, inverse_of: :tool
  has_many :platforms, through: :tool_platforms

  has_many :screens, dependent: :destroy, limit: 4, order: 'screens.order ASC', inverse_of: :tool
  attr_accessible :app_store_url, :cost, :description, :featured, :github_url, :google_play_url, :name, :site_url, :license_id, :icon, :screens_attributes, :platform_ids, :category_ids

  validates_presence_of :name, :description, :icon, :categories, :category_ids, :platforms, :platform_ids

  validates_format_of :site_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates_format_of :app_store_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates_format_of :google_play_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates_format_of :github_url, with: URI::regexp(%w(http https)), allow_blank: true

  validates_associated :screens

  accepts_nested_attributes_for :screens, allow_destroy: true

  has_attached_file :icon, styles: { small: ["120x120#", :jpg], thumb: ["60x60#", :jpg] }, convert_options: { quality: 85 }
  validates_attachment_presence :icon
  validates_attachment_content_type :icon, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :icon, less_than: 1.megabyte

  def self.search(query)
    if query
      where('name like ?', "%#{query}%")
    else
      scoped
    end
  end

  def self.supports_platform(platform_id = nil)
    if platform_id && !platform_id.blank?
      joins(:tool_platforms).where('tool_platforms.platform_id = ?', platform_id)
    else
      scoped
    end
  end

  def self.in_categories(category_ids = nil)
    if category_ids && !category_ids.blank?
      joins(:tool_categories).where('tool_categories.category_id in (?)', category_ids).group(:id)
    else
      scoped
    end
  end
end