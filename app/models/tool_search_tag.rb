class ToolSearchTag < ActiveRecord::Base
  belongs_to :search_tag
  belongs_to :tool
  # attr_accessible :title, :body
end
