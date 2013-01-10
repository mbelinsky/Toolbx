# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tool do
    name "MyString"
    cost "9.99"
    description "MyText"
    github_url "MyString"
    google_play_url "MyString"
    app_store_url "MyString"
    site_url "MyString"
    featured false
    license nil
  end
end
