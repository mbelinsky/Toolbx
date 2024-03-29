class ArticleCategory < ActiveRecord::Base
  belongs_to :article
  belongs_to :category
  validates_presence_of :article, :category

  validates_uniqueness_of :article_id, scope: :category_id
end
