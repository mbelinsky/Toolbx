class Organization < User
  as_enum :sector, [:"Non-Profit", :"For-Profit"]
  validates_as_enum :sector, allow_nil: false
end
