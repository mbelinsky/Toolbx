class ApptivistArticle < ActiveRecord::Base
  belongs_to :apptivist, class_name: 'User'
  belongs_to :article

  attr_accessible :apptivist, :article

  validates_presence_of :apptivist
  validates_presence_of :article

  validates_uniqueness_of :apptivist_id, scope: :article_id
end
