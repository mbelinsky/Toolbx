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

  has_many :tool_search_tags, dependent: :destroy, inverse_of: :tool
  has_many :search_tags, through: :tool_search_tags

  has_many :screens, dependent: :destroy, order: 'screens.order ASC', inverse_of: :tool
  attr_accessible :app_store_url, :cost, :short_desc, :description, :featured, :github_url, :google_play_url, :name, :site_url, :license_id, :icon, :screens_attributes, :platform_ids, :category_ids, :facebook_username, :twitter_username, :screens, :search_tag_ids

  validates_presence_of :name, :description, :icon, :categories, :category_ids, :platforms, :platform_ids

  validates_associated :screens

  validates :short_desc, length: { maximum: 65, too_long: "is too long (max %{count})" }, allow_blank: true

  accepts_nested_attributes_for :screens, allow_destroy: true

  tire do
    settings analysis: {
      analyzer: {
        default: {
          type: :snowball
        }
      }
    }

    mapping do
      indexes :id, type: :integer, index: :not_analyzed
      indexes :name, analyzer: :snowball
      indexes :description, analyzer: :snowball
      indexes :created_at, type: :date
      indexes :users_count, type: :integer
      indexes :featured, type: :boolean
      indexes :first_screen_banner, index: :not_analyzed
      indexes :first_screen_desat_banner, index: :not_analyzed
      indexes :icon_thumb, index: :not_analyzed

      indexes :search_tags do
        indexes :id, type: :integer, index: :not_analyzed
        indexes :name, type: :string
      end

      indexes :platforms do
        indexes :id, type: :integer, index: :not_analyzed
        indexes :name, type: :string, index: :not_analyzed
      end

      indexes :categories do
        indexes :id, type: :integer, index: :not_analyzed
        indexes :title, type: :string, index: :not_analyzed
      end
    end
  end

  def self.search_count(params)
    tire.search search_type: 'count' do
      query do
        if params[:keyword].blank? && params[:platform].blank? && params[:category_ids].blank?
          all
        else
          boolean do
            must {string params[:keyword], default_operator: 'AND'} if params[:keyword].present?
            must {term 'platforms.id', params[:platform]} if params[:platform].present?
            must {terms 'categories.id', params[:category_ids]} if params[:category_ids].present?
          end
        end
      end
    end
  end

  def self.search(params)
    params[:per_page] ||= 36

    tire.search(page: params[:page], per_page: params[:per_page]) do
      # generate the actual
      query do
        if params[:keyword].blank? && params[:platform].blank? && params[:category_ids].blank?
          all
        else
          boolean do
            must {string params[:keyword], default_operator: 'AND'} if params[:keyword].present?
            must {term 'platforms.id', params[:platform]} if params[:platform].present?
            must {terms 'categories.id', params[:category_ids]} if params[:category_ids].present?
          end
        end
      end

      # order the results
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

      # facets for has_many associations
      facet 'platforms' do
        terms :platform_id
      end

      facet 'categories' do
        terms :category_id
      end
    end
  end

  def to_indexed_json
    to_json(
      methods: [
        :first_screen_banner,
        :first_screen_desat_banner,
        :icon_thumb
      ],
      include: [
        :platforms,
        :categories,
        :search_tags
      ]
    )
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

  def first_screen_banner
    screens.first ? screens.first.screenshot.url(:banner) : nil
  end

  def first_screen_desat_banner
    screens.first ? screens.first.screenshot.url(:desat_banner) : nil
  end

  def icon_thumb
    icon.url(:thumb)
  end
end