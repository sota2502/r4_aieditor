FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "test_project_#{n}" }
  end
end
