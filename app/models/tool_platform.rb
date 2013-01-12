class ToolPlatform < ActiveRecord::Base
  belongs_to :tool
  belongs_to :platform

  validates_presence_of :tool
  validates_presence_of :platform
end
