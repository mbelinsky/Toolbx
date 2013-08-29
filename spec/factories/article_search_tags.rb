# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_search_tag do
    search_tag nil
    article nil
  end
end
