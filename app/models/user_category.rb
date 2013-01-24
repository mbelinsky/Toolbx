class UserCategory < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_categories
  belongs_to :category
  validates_presence_of :user, :category

  validates_uniqueness_of :user_id, scope: :category_id
end