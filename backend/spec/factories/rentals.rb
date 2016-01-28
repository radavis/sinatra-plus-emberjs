FactoryGirl.define do
  factory :rental do
    sequence(:title) { |n| "Generic Rental Unit ##{n}" }
    city "Boston"
    bedrooms 2
  end
end
