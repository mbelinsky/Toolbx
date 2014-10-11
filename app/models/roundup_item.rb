class RoundupItem < ActiveRecord::Base
  belongs_to :roundup
  belongs_to :item, polymorphic: true
  attr_accessible :item
end
