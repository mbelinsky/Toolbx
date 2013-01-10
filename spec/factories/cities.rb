# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    name "MyString"
    short_name "MyString"
    region nil
    country nil
  end
end
