require 'factory_girl'
FactoryGirl.define do
  factory :bill do
    meter Faker::Number.number(4)
    cost Faker::Commerce.price
    date Date.today
    period Date.today
    category_id 1
  end
end
