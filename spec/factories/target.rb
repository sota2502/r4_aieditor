FactoryBot.define do
  factory :target do
    value { Faker::Number.within(range: -1..6) }
  end
end
