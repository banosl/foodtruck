FactoryBot.define do
  factory :event do
    event_date { Faker::Date.between(from: Date.today, to: 10.days.from_now).to_s }
    latitude { Faker::Alphanumeric.alphanumeric(number: 10) }
    longitude { Faker::Alphanumeric.alphanumeric(number: 10) }
    start_time { Faker::Time.between_dates(from: Date.today, to: Date.today + 10).to_s }
    end_time { start_time }
    description { Faker::Books::Dune.quote }
  end
end
