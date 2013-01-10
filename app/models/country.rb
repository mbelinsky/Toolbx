class Country < ActiveRecord::Base
  belongs_to :continent
  has_many :regions
  has_many :cities
  attr_accessible :dial_code, :name, :short_name
end
