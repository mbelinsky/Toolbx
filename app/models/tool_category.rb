class ToolCategory < ActiveRecord::Base
  belongs_to :tool
  belongs_to :category
  validates_presence_of :tool, :category
end
