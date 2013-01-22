class Article < ActiveRecord::Base
  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: User
  has_many :article_categories, dependent: :destroy, inverse_of: :article
  has_many :categories, through: :article_categories
  has_many :article_tools, dependent: :destroy, inverse_of: :article
  has_many :tools, through: :article_tools

  validates_presence_of :author, :title, :body, :categories
  attr_accessible :body, :title, :category_ids, :tool_ids, :featured, :published, :featured_image

  validates_attachment_presence :featured_image
  has_attached_file :featured_image, styles: { desat_banner: "300x180#", banner: "300x180#", desat_square_banner: "300x300#", square_banner: "300x300#", small_banner: "280x120#" }, convert_options: { desat_banner: "-set option:modulate:colorspace hsb -modulate 75,50", desat_square_banner: "-set option:modulate:colorspace hsb -modulate 88,50" }

  validates_attachment_content_type :featured_image, content_type: ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/xpng', 'image/gif'], message: 'please upload a jpg, png, or gif file'
  validates_attachment_size :featured_image, less_than: 1.megabyte

  def self.search(query)
    if query
      where('title like ?', "%#{query}%")
    else
      scoped
    end
  end

  def self.in_categories(category_ids = nil)
    if category_ids && !category_ids.blank?
      joins(:article_categories).where('article_categories.category_id in (?)', category_ids).group(:id)
    else
      scoped
    end
  end
end