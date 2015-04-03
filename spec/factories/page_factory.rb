include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :page do
    association :user
    sequence(:title) { |n| "Article #{n} Title" }
    header_one "Article Header One"
    header_two "Article Header Two"
    url "http://www.testurl.com"
    description "This is a test article!"
    body "This is the article body."
    posted_at Time.now - 5
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  end
end
