class ArticleSearchTag < ActiveRecord::Base
  belongs_to :search_tag
  belongs_to :article
  # attr_accessible :title, :body
end
