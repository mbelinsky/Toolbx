class UserLanguage < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  validates_presence_of :user
  validates_presence_of :language

  validates_uniqueness_of :user_id, scope: :language_id
end
