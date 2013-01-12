class Article < ActiveRecord::Base
  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: User
  has_many :article_images, dependent: :destroy
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  attr_accessible :body, :title
  validates_presence_of :author, :title, :body, :article_image
end
