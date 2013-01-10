class UserTool < ActiveRecord::Base
  belongs_to :user
  belongs_to :tool

  validates_presence_of :user
  validates_presence_of :tool
end
