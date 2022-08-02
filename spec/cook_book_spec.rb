require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe CookBook do
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheeseburger")}
  let(:cookbook) {CookBook.new}

  it 'exists and has readable attributes' do
    expect(cookbook).to be_a(CookBook)
  end

  it 'can add recipes' do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end

  it 'can return ingredient names' do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
  end

  xit 'can return highest calorie meal' do
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.highest_calorie_meal).to eq(recipe2)
  end
end
