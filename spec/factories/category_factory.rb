FactoryGirl.define do
  
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
  end
  
  factory :snowboarding_category, :class => Category do
    name "Snowboarding"
  end
  
  factory :web_category, :class => Category do
    name "Web"
  end
  
  factory :assorted_category, :class => Category do
    name "Assorted"
  end
  
  factory :running_category, :class => Category do
    name "Running"
  end
end
