require 'faker'

FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    preparation_time { rand(1..15) }
    cooking_time { rand(1..15) }
    description { Faker::Food.description }
    public { false }
    user { association(:user) }
  end
end
