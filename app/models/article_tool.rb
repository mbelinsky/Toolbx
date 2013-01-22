class ArticleTool < ActiveRecord::Base
  belongs_to :article
  belongs_to :tool

  validates_presence_of :article
  validates_presence_of :tool

  validates_uniqueness_of :tool_id, scope: :article_id
end