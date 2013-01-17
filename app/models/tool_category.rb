class ToolCategory < ActiveRecord::Base
  belongs_to :tool, inverse_of: :tool_categories
  belongs_to :category
  validates_presence_of :tool, :category

  validates_uniqueness_of :tool_id, scope: :category_id
end
