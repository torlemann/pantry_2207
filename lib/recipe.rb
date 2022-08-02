class Recipe

  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
  end

  def ingredients_required
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end
end
