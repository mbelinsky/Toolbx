class Tool < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :license
  has_many :user_tools, dependent: :destroy
  has_many :users, through: :user_tools

  has_many :article_tools, dependent: :destroy, inverse_of: :tool
  has_many :articles, through: :article_tools

  has_many :tool_categories, dependent: :destroy, inverse_of: :tool
  has_many :categories, through: :tool_categories


  has_many :tool_platforms, dependent: :destroy, inverse_of: :tool
  has_many :platforms, through: :tool_platforms

  has_many :screens, dependent: :destroy, order: 'screens.order ASC', inverse_of: :tool
  attr_accessible :app_store_url, :cost, :description, :featured, :github_url, :google_play_url, :name, :site_url, :license_id, :icon, :screens_attributes, :platform_ids, :category_ids, :facebook_username, :twitter_username, :screens

  validates_presence_of :name, :description, :icon, :categories, :category_ids, :platforms, :platform_ids

  validates_associated :screens

  accepts_nested_attributes_for :screens, allow_destroy: true

  mapping do
    indexes :id, index: :not_analyzed
    indexes :name, analyzer: 'snowball'
    indexes :description, analyzer: 'snowball'
    indexes :created_at, type: :date
    indexes :users_count, type: :integer
    indexes :featured, type: :boolean
  end

  def self.search(params)
    # return scoped
    # orders = {'Recently Added' => 'created_at DESC', 'Most Popular' => 'users_count DESC, created_at DESC', 'Featured' => 'featured DESC, users_count DESC, created_at DESC'}

    #.in_categories(params[:category_ids]).supports_platform(params[:platform]).order(@orders[params[:order]]).page(params[:page]).per(36).search(params[:keyword])

    tire.search(load: true, page: params[:page], per_page: 36) do
      query { string params[:keyword], default_operator: 'AND' } if params[:keyword].present?

      if params[:order] == 'Recently Added'
        sort { by :created_at, 'desc' }
      elsif params[:order] == 'Most Popular'
        sort do
          by :users_count, :desc
          by :created_at, :desc
        end
      elsif params[:order] == 'Featured'
        sort do
          by :featured, :desc
          by :users_count, :desc
          by :created_at, :desc
        end
      end
    end
  end

  def to_indexed_json
    self.to_json
  end

  attr_reader :icon_remote_url
  has_attached_file :icon, styles: { small: ["120x120", :jpg], thumb: ["60x60", :jpg] }, convert_options: { quality: 85, all: '-background white -mosaic +matte -gravity center', small: '-extent 120x120', thumb: '-extent 60x60' }
  validates_attachment_presence :icon
  validates_attachment_content_type :icon, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :icon, less_than: 1.megabyte

  def icon_remote_url=(url)
    self.icon = URI.parse(url)
    @icon_remote_url = url
  end

  def formatted_app_store_url
    nil if self.app_store_url.blank?

    self.app_store_url.match(/https?:\/\//) ? self.app_store_url : "http://#{self.app_store_url}"
  end

  def formatted_google_play_url
    nil if self.google_play_url.blank?

    self.google_play_url.match(/https?:\/\//) ? self.google_play_url : "http://#{self.google_play_url}"
  end

  def formatted_site_url
    nil if self.site_url.blank?

    self.site_url.match(/https?:\/\//) ? self.site_url : "http://#{self.site_url}"
  end

  def formatted_github_url
    nil if self.github_url.blank?

    self.github_url.match(/https?:\/\//) ? self.github_url : "http://#{self.github_url}"
  end

  def facebook_url
    facebook_username.blank? ? nil : "https://facebook.com/#{facebook_username}"
  end

  def twitter_url
    twitter_username.blank? ? nil : "https://twitter.com/#{twitter_username}"
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
      joins(:tool_categories).where('tool_categories.category_id in (?)', category_ids).group('tools.id')
    else
      scoped
    end
  end

end