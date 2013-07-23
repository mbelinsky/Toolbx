class UserTool < ActiveRecord::Base
  belongs_to :user, counter_cache: :tools_count
  belongs_to :tool#, counter_cache: :users_count

  after_commit :create_callback, on: :create
  after_commit :destroy_callback, on: :destroy

  attr_accessible :user, :tool

  validates_presence_of :user
  validates_presence_of :tool

  validates_uniqueness_of :user_id, scope: :tool_id

  def create_callback
    # For some reason, using Tool.increment_counter doesn't update the value until after the `update_index` does its thing. Oddly, tool.increment works as expected
    # Tool.increment_counter(:users_count, tool.id)
    self.tool.increment!(:users_count)
    tool.tire.update_index
  end

  def destroy_callback
    # For some reason, using Tool.increment_counter doesn't update the value until after the `update_index` does its thing. Oddly, tool.increment works as expected
    # Tool.decrement_counter(:users_count, tool.id)
    self.tool.decrement!(:users_count)
    tool.tire.update_index
  end
end