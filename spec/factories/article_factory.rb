# This will guess the User class
FactoryGirl.define do
  factory :article do

    association :user

    title "Article Title"
    header_one "Article Header One"
    header_two "Article Header Two"
    url "http://www.testurl.com"
    description "This is a test article!"
    body "This is the article body. This is the article body. This is the article body. This is the article body."
  end
end
