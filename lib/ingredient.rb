class Ingredient

  attr_reader :name, :unit, :calories
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @unit = attributes.fetch(:unit)
    @calories = attributes.fetch(:calories)
  end
end
