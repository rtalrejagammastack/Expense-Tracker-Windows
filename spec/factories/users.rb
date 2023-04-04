FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user-#{n}@gmail.com" } 
    password { "password" }
    sequence(:name) {|n| "User #{n}" }
    phone_number { 1234567894 }
  end
end
