require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 50})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})}
  let(:pantry) {Pantry.new}

  it 'exists and has readable attributes'do
    expect(pantry).to be_a(Pantry)
    expect(pantry.stock).to eq({})
  end

  it 'can check pantry stock' do
    expect(pantry.stock_check(ingredient1)).to eq(0)
  end

  it 'can restock' do
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)

    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end

  it 'can check if pantry has enough ingredients for recipe' do
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)

    pantry.restock(ingredient2, 7)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)

    pantry.restock(ingredient2, 1)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
  end
end
