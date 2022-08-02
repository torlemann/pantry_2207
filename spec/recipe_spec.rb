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

  xit 'can add ingredients' do
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected = {
          ingredient1: 6,
          ingredient2: 8
    }
    expect(recipe1.ingredients_required).to eq(expected)
    expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
  end
end
