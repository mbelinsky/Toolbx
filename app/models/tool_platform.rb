class ToolPlatform < ActiveRecord::Base
  belongs_to :tool, inverse_of: :tool_platforms
  belongs_to :platform

  validates_presence_of :tool
  validates_presence_of :platform

  validates_uniqueness_of :tool_id, scope: :platform_id
end
