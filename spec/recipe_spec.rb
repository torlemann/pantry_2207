require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:recipe1) {Recipe.new("Mac and Cheese")}

  it 'exists and has readable attributes' do
   expect(recipe1).to be_a(Recipe)
   expect(recipe1.name).to eq("Mac and Cheese")
   expect(recipe1.ingredients_required).to eq({})
  end

  it 'can add ingredients' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected = {
          ingredient1 => 6,
          ingredient2 => 8
    }
    expect(recipe1.ingredients_required).to eq(expected)
    expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
  end

  it 'can total calories' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    expect(recipe1.total_calories).to eq(440)
    expect(recipe2.total_calories).to eq(675)
  end
end
