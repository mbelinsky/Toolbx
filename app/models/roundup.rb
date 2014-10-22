class Roundup < ActiveRecord::Base
  attr_accessible :description, :title, :tool_ids, :article_ids, :user_ids

  has_many :roundup_items
  has_many :tools, through: :roundup_items, source: :item, source_type: 'Tool'
  has_many :users, through: :roundup_items, source: :item, source_type: 'User'
  has_many :articles, through: :roundup_items, source: :item, source_type: 'Article'

  def to_param
    "#{id} #{title}".parameterize
  end
end
