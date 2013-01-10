# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    surname "MyString"
    email "MyString"
    password_digest "MyString"
    facebook_username "MyString"
    twitter_username "MyString"
    linkedin_username "MyString"
    website_url "MyString"
    sector_cd 1
    description "MyText"
    city nil
  end
end
