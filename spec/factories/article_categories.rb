# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_category do
    article nil
    category nil
  end
end
