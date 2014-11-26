# This will guess the User class
FactoryGirl.define do
  factory :annotation do
    association :gallery_image
    gps_coordinates "39.981592,-75.200093"
  end
end
