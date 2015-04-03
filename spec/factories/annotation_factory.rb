# This will guess the User class
FactoryGirl.define do
  factory :annotation do
    body "This is the annotations body!"
    association :gallery_image
    latitude "39.981592"
    longitude "-75.200093"
  end
end
