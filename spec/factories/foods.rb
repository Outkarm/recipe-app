FactoryBot.define do
  factory :food do
    name { 'MyString' }
    measurement_unit { 'MyString' }
    price { 'MyString' }
    quantity { 1 }
    user { nil }
  end
end
