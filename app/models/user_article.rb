class UserArticle < ActiveRecord::Base
  belongs_to :user, counter_cache: :articles_count
  belongs_to :article, counter_cache: :users_count

  attr_accessible :user, :article

  validates_presence_of :user
  validates_presence_of :article

  validates_uniqueness_of :user_id, scope: :article_id
end