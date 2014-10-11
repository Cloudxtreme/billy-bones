require 'factory_girl'
FactoryGirl.define do
  factory :bill do

    category_id 1

    trait :with_meter do
      meter Faker::Number.number(4)
    end

    trait :with_cost do
      cost Faker::Commerce.price
    end

    trait :with_date do
      date Date.today
    end

    trait :with_period do
      period Date.today
    end

    factory :filled_bill,
            traits: [:with_meter, :with_cost, :with_date, :with_period]

  end
end
