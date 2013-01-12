class ArticleCategory < ActiveRecord::Base
  belongs_to :article
  belongs_to :category
  validates_presence_of :article, :category
end
