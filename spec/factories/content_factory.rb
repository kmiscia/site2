FactoryGirl.define do

  factory :content do
    name "Test Content"
    name_slug "test_content"
    system false
    display_name true
    body "This is the content body."
  end
end
