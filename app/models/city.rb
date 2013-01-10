class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
  attr_accessible :name, :short_name
end
