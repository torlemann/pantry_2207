require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do

  it 'exists and has readable attributes'do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new
    expect(pantry).to be_a(Pantry)
    expect(pantry.stock).to eq({})
  end

  it 'can check pantry stock' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    pantry = Pantry.new
    expect(pantry.stock_check(ingredient1)).to eq(0)
  end

  it 'can restock' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry = Pantry.new
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)

    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end
end
