# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_image do
    article nil
    featured false
  end
end
