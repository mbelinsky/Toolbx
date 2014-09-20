class ApptivistTool < ActiveRecord::Base
  belongs_to :apptivist, class_name: 'User'
  belongs_to :tool

  attr_accessible :apptivist, :tool

  validates_presence_of :apptivist
  validates_presence_of :tool

  validates_uniqueness_of :apptivist_id, scope: :tool_id
end
