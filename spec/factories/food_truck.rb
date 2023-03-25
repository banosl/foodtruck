FactoryBot.define do
  factory :food_truck do
    name { Faker::Commerce.vendor + " Truck" }
    cuisine_type { Faker::Food.ethnic_category }
    web_link { Faker::Internet.url }
  end
end