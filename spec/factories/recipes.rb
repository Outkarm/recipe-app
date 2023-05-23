FactoryBot.define do
  factory :recipe do
    name { 'my_string' }
    preparation_time { 'my_string' }
    cooking_time { 'my_string' }
    description { 'my+text' }
    public { false }
    user { nil }
  end
end
