FactoryGirl.define do
  factory :user do
    username "testuser"
    email "testuser@miscia.net"
    password "testpassword"
    password_confirmation { |u| u.password }
  end
end
