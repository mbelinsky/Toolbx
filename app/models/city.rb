class City < ActiveRecord::Base
  belongs_to :region
  belongs_to :country
  attr_accessible :name, :short_name

  def pretty_name
    pretty_name = self.name

    if self.region
      pretty_name += ", #{self.region.name}"
    end

    pretty_name += ", #{self.country.name}"

    return pretty_name
  end

  def as_json
    {
      label: self.pretty_name,
      value: self.id
    }
  end
end