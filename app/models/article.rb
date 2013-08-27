class Article < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: User
  has_many :article_categories, dependent: :destroy, inverse_of: :article
  has_many :categories, through: :article_categories
  has_many :article_tools, dependent: :destroy, inverse_of: :article
  has_many :tools, through: :article_tools

  has_many :user_articles, dependent: :destroy
  has_many :users, through: :user_articles

  validates_presence_of :author, :title, :body, :categories, :category_ids
  attr_accessible :body, :title, :category_ids, :tool_ids, :featured, :published, :featured_image, :source_url

  validates_attachment_presence :featured_image
  has_attached_file :featured_image, styles: { full: ["580", :jpg], desat_banner: ["300x180#", :jpg], banner: ["300x180#", :jpg], desat_square_banner: ["300x300#", :jpg], square_banner: ["300x300#", :jpg], small_banner: ["280x120#", :jpg] }, convert_options: { desat_banner: "-set option:modulate:colorspace hsb -modulate 75,50", desat_square_banner: "-set option:modulate:colorspace hsb -modulate 88,50", quality: 85, all: '-background white -mosaic +matte' }

  validates_attachment_content_type :featured_image, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :featured_image, less_than: 2.megabytes

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
      indexes :title, analyzer: :snowball
      indexes :body, analyzer: :snowball
      indexes :slug
      indexes :created_at, type: :date
      indexes :users_count, type: :integer
      indexes :featured, type: :boolean
      indexes :banner, index: :not_analyzed
      indexes :desat_banner, index: :not_analyzed
      indexes :square_banner, index: :not_analyzed
      indexes :desat_square_banner, index: :not_analyzed

      indexes :categories do
        indexes :id, type: :integer, index: :not_analyzed
        indexes :title, type: :string, index: :not_analyzed
      end
    end
  end

  # def self.search(query)
  #   if query
  #     where('title like ?', "%#{query}%")
  #   else
  #     scoped
  #   end
  # end

  def self.search(params)
    tire.search(page: params[:page], per_page: 36) do
      # generate the actual
      query do
        if params[:keyword].blank? && params[:category_ids].blank?
          all
        else
          boolean do
            must {string params[:keyword], default_operator: 'AND'} if params[:keyword].present?
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
      facet 'categories' do
        terms :category_id
      end
    end
  end

  def to_indexed_json
    to_json(
      methods: [
        :banner,
        :desat_banner,
        :square_banner,
        :desat_square_banner,
        :slug
      ],
      include: [
        :categories
      ]
    )
  end

  def banner
    featured_image.url(:banner)
  end

  def desat_banner
    featured_image.url(:desat_banner)
  end

  def square_banner
    featured_image.url(:square_banner)
  end

  def desat_square_banner
    featured_image.url(:desat_square_banner)
  end

  def self.in_categories(category_ids = nil)
    if category_ids && !category_ids.blank?
      joins(:article_categories).where('article_categories.category_id in (?)', category_ids).group('articles.id')
    else
      scoped
    end
  end

  def slug
    "#{self.id}-#{self.title.parameterize}"
  end

  def to_param
    slug
  end

  def formatted_source_url
    nil if self.source_url.blank?

    self.source_url.match(/https?:\/\//) ? self.source_url : "http://#{self.source_url}"
  end
end