FactoryBot.define do
  factory :search do
    sequence(:name) { |n| "search_#{n}" }
    x1 { Faker::Number.within(range: 1..100) }
    y1 { Faker::Number.within(range: 1..100) }
    x2 { Faker::Number.within(range: 1..100) }
    y2 { Faker::Number.within(range: 1..100) }
  end
end
