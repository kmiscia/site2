FactoryGirl.define do

  factory :gallery_image do
    name "Test Gallery Image"
    association :gallery, :factory => :gallery
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') }
  end
end
