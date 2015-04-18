include ActionDispatch::TestProcess

# This will guess the User class
FactoryGirl.define do

  factory :article do
    association :user
    sequence(:title) { |n| "Article #{n} Title" }
    header_one "Article Header One"
    header_two "Article Header Two"
    url "http://www.testurl.com"
    description "This is a test article!"
    body "This is the article body."
    posted_at Time.now - 5
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  
    factory :snowboarding_article do
      association :category, :factory => :snowboarding_category
    end
    
    factory :assorted_article do
      association :category, :factory => :assorted_category
    end
    
    factory :running_article do
      association :category, :factory => :running_category
    end
    
    factory :web_article do
      association :category, :factory => :web_category
    end
  end
end
