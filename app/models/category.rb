class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :tools, through: :tool_categories
  has_many :articles, through: :article_categories
end
