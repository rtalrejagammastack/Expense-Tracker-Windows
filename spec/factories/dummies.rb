FactoryBot.define do
  factory :dummy do
    name { "MyString" }
    age { rand(1..100) }
    born_at { "2023-04-04 15:06:33" }
    # email { "hello@gmail.com" }
    sequence(:email) {|n| "hello+#{n}@gmail.com" } #for unique field
  end
end
