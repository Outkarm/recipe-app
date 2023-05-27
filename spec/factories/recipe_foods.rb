FactoryBot.define do
  factory :recipe_food do
    quantity { rand(1..10) }
    recipe { Recipe.first || association(:recipe) }
    food { Food.first || association(:food) }
  end
end
