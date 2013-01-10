# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :region do
    name "MyString"
    short_name "MyString"
    country nil
  end
end
