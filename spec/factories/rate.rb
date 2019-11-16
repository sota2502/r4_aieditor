FactoryBot.define do
  factory :rate do
    sequence(:name) { |n| "rate_#{n}" }
    value { Faker::Number.within(range: 1..100) }
  end
end
