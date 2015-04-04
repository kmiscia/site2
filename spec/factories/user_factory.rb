FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email { "#{username}@miscia.net" }
    password "testpassword"
    password_confirmation { |u| u.password }
  end

  factory :admin, :class => User do
    sequence(:username) { |n| "admin#{n}" }
    email { "#{username}@miscia.net" }
    password "adminpassword"
    password_confirmation { |u| u.password }
  end
end
