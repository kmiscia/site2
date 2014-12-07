FactoryGirl.define do

  factory :user do
    username "testuser"
    email "testuser@miscia.net"
    password "testpassword"
    password_confirmation { |u| u.password }
  end

  factory :admin, :class => User do
    username "adminuser"
    email "adminuser@miscia.net"
    password "adminpassword"
    password_confirmation { |u| u.password }
  end
end
