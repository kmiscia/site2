FactoryGirl.define do
  factory :comment do
    association :article
    body "This is a test comment. This is a test comment."
  end
end
