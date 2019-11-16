FactoryBot.define do
  factory :action_state do
    sequence(:chara) { |n| "chara_#{n}" }
    sequence(:field) { |n| "filed_#{n}" }
    freq { Faker::Number.within(range: 1..100) }
    precis { Faker::Number.within(range: 1..100) }
  end
end
