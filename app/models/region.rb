class Region < ActiveRecord::Base
  belongs_to :country
  has_many :cities
  attr_accessible :name, :short_name
end
