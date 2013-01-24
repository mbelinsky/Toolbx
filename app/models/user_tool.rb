class UserTool < ActiveRecord::Base
  belongs_to :user, counter_cache: :tools_count
  belongs_to :tool, counter_cache: :users_count

  attr_accessible :user, :tool

  validates_presence_of :user
  validates_presence_of :tool

  validates_uniqueness_of :user_id, scope: :tool_id
end