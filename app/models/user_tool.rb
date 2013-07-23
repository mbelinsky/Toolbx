class UserTool < ActiveRecord::Base
  belongs_to :user, counter_cache: :tools_count
  belongs_to :tool#, counter_cache: :users_count

  after_create :create_callback
  after_destroy :destroy_callback

  attr_accessible :user, :tool

  validates_presence_of :user
  validates_presence_of :tool

  validates_uniqueness_of :user_id, scope: :tool_id

  def create_callback
    Tool.increment_counter(:users_count, tool.id)
    tool.tire.update_index
  end

  def destroy_callback
    Tool.decrement_counter(:users_count, tool.id)
    tool.tire.update_index
  end
end