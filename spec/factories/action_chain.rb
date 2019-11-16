FactoryBot.define do
  factory :action_chain do
    sequence(:name) { |n| "action_chain_#{n}" }
  end
end
