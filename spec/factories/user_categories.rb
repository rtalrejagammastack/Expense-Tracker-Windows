FactoryBot.define do
  factory :user_category do
    user
    sequence(:name) {|n| "Personal#{n}" }
  end
end
