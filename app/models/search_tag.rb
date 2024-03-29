class SearchTag < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name

  def text
    name
  end
end
