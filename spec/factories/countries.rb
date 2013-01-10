# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    name "MyString"
    short_name "MyString"
    continent nil
    dial_code 1
  end
end
